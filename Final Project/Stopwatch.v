//Stopwatch
module Dig_Stopwatch(clk,rst,Start_Stop,Out1,Out2,Out3,Out4);
input clk,rst,Start_Stop;
output [3:0] Out1,Out2,Out3,Out4;

wire c;
wire [3:0] a,seq;

assign a[0] = Start_Stop;
assign a[1] = a[0] & seq[0];
assign a[2] = a[1] & seq[1];
assign a[3] = a[2] & seq[2];


clk_divider(.clock(clk), .clk_out(c));

Count10(.reset(rst),.inc(a[0]),.clk(c),.count(Out1),.count_eq_9(seq[0]));
Count10(.reset(rst),.inc(a[1]),.clk(c),.count(Out2),.count_eq_9(seq[1]));
Count10(.reset(rst),.inc(a[2]),.clk(c),.count(Out3),.count_eq_9(seq[2]));
Count6 (.reset(rst),.inc(a[3]),.clk(c),.count(Out4));

endmodule

