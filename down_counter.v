module down_counter(Q, clk, rst);
input clk, rst;
output [3:0] Q;
reg [3:0] Q;
always @ (posedge clk or posedge rst)
begin
  if(rst)
    Q <= 4'b0;
  else
    Q <= Q - 1;
end
endmodule


module down_counter_test;
wire [3:0] Q;
reg clk, rst;
down_counter c1(Q, clk, rst);

always #5 clk = ~clk;

initial
begin
  clk = 0; rst = 1;
  #10 rst = 0;
  #200 $stop;
end
endmodule

