module srff (r, s, clk, rst, q, qbar);
input r, s, clk, rst;
output q, qbar;
reg q;
assign qbar = ~q;

always @ (posedge clk or posedge rst)
begin
  if (rst)
    q <= 1'b0;
  else
  begin
    case ({r, s})
      2'b00: q <= q;
      2'b01: q <= 1'b1;
      2'b10: q <= 1'b0;
      2'b11: q <= 1'bz;
    endcase
  end
end
endmodule


module srff_test;
reg r, s, clk, rst;
wire q, qbar;

srff sr1(r, s, clk, rst, q, qbar);

always #5 clk = ~clk;

initial
begin
  r = 0; s = 0; clk = 0; rst = 1;
  #10 rst = 0;
  #10 r = 0; s = 1;
  #10 r = 1; s = 0;
  #10 r = 1; s = 1;
  #50 $stop;
end
endmodule

