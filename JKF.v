module jkff (j, k, clk, rst, q, qbar);
input j, k, clk, rst;
output q, qbar;
reg q;
assign qbar = ~q;

always @ (posedge clk or posedge rst)
begin
  if (rst)
    q <= 1'b0;
  else
  begin
    case ({j, k})
      2'b00: q <= q;
      2'b01: q <= 1'b0;
      2'b10: q <= 1'b1;
      2'b11: q <= ~q;
    endcase
  end
end
endmodule


module jkff_test;
reg j, k, clk, rst;
wire q, qbar;
jkff jk(j, k, clk, rst, q, qbar);

always #5 clk = ~clk;

initial
begin
  j = 0; k = 0; clk = 0; rst = 1;
  #10 rst = 0;
  #10 j = 0; k = 1;
  #10 j = 1; k = 0;
  #10 j = 1; k = 1;
  #50 $stop;
end
endmodule

