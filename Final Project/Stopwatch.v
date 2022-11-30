//Stopwatch
module Dig_Stopwatch(clk,rst,Start_Stop,Out1,Out2,Out3,Out4,test);
input clk,rst,Start_Stop;
output [6:0] Out1,Out2,Out3,Out4;
output test;

//TFF0(.clk(Start_Stop),.data(1),.q(s));
assign test = a[0];
assign s = Start_Stop;

wire c,s;
wire [3:0] a,seq,out1, out2, out3, out4;
//Something is wrong and what happens is that the pin assignments are correct just that the Count10 or the BCD is wrong.

assign a[0] = s;
assign a[1] = a[0] & seq[0];
assign a[2] = a[1] & seq[1];
assign a[3] = a[2] & seq[2];


clk_divider(.clock(clk), .clk_out(c));

Count10(.reset(rst),.inc(a[0]),.clk(c),.count(out1),.count_eq_9(seq[0]));
Count10(.reset(rst),.inc(a[1]),.clk(c),.count(out2),.count_eq_9(seq[1]));
Count10(.reset(rst),.inc(a[2]),.clk(c),.count(out3),.count_eq_9(seq[2]));
Count6 (.reset(rst),.inc(a[3]),.clk(c),.count(out4));

BCD7Segment(out1,Out1[0],Out1[1],Out1[2],Out1[3],Out1[4],Out1[5],Out1[6]);
BCD7Segment(out2,Out2[0],Out2[1],Out2[2],Out2[3],Out2[4],Out2[5],Out2[6]);
BCD7Segment(out3,Out3[0],Out3[1],Out3[2],Out3[3],Out3[4],Out3[5],Out3[6]);
BCD7Segment(out4,Out4[0],Out4[1],Out4[2],Out4[3],Out4[4],Out4[5],Out4[6]);

endmodule

