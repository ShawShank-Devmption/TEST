module dff (d, clk, rst, q, qbar);
input d, clk, rst;
output q, qbar;
reg q;
assign qbar = ~q;

always @ (posedge clk or posedge rst)
begin
  if (rst)
    q <= 1'b0;
  else
    q <= d;
end
endmodule


module dff_test;
reg d, clk, rst;
wire q, qbar;
dff d1(d, clk, rst, q, qbar);

always #5 clk = ~clk;

initial
begin
  d = 1; clk = 0; rst = 1;
  #10 rst = 0;
  #10 d = 0;
  #10 d = 1;
  #50 $stop;
end
endmodule

