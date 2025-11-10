module tff(t, clk, rst, q, qbar);
input t, clk, rst;
output q, qbar;
reg q;
assign qbar = ~q;

always @ (posedge clk or posedge rst)
begin
  if (rst)
    q <= 1'b0;
  else if (t)
    q <= ~q;
  else
    q <= q;
end
endmodule


module tff_test;
reg t, clk, rst;
wire q, qbar;
tff t1(t, clk, rst, q, qbar);

always #5 clk = ~clk;

initial
begin
  t = 1; clk = 0; rst = 1;
  #10 rst = 0;
  #10 t = 0;
  #10 t = 1;
  #50 $stop;
end
endmodule

