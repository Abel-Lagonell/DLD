//Stopwatch
module Dig_Stopwatch(clk,rst,Start_Stop,Out1,Out2,Out3,Out4);
input clk,rst,Start_Stop;
output [6:0] Out1,Out2,Out3,Out4;

wire c,s,rst2;
wire [3:0] a,seq,o1, o2, o3, o4, w, x, y, u;

assign rst2 = seq[3] | rst;

assign a[0] = s;
assign a[1] = a[0] & seq[0];
assign a[2] = a[1] & seq[1];
assign a[3] = a[2] & seq[2];

TFF0 tff(.clk(Start_Stop),.data(1),.q(s),.reset(0));
assign test = a[0];

clk_divider clkd(.clock(clk), .clk_out(c),.rst(0));

Count10 c1(.reset(rst2),.inc(a[0]),.clk(c),.count(w),.count_eq_9(seq[0]));
Count10 c2(.reset(rst),.inc(a[1]),.clk(c),.count(y),.count_eq_9(seq[1]));
Count10 c3(.reset(rst),.inc(a[2]),.clk(c),.count(x),.count_eq_9(seq[2]));
Count6  c4(.reset(rst2),.inc(a[3]),.clk(c),.count(u),.count_eq_6(seq[3]));

invert i1(w,o1);
invert i2(y,o2);
invert i3(x,o3);
invert i4(u,o4);

BCD7Segment bcd1(o1,Out1[0],Out1[1],Out1[2],Out1[3],Out1[4],Out1[5],Out1[6]);
BCD7Segment bcd2(o2,Out2[0],Out2[1],Out2[2],Out2[3],Out2[4],Out2[5],Out2[6]);
BCD7Segment bcd3(o3,Out3[0],Out3[1],Out3[2],Out3[3],Out3[4],Out3[5],Out3[6]);
BCD7Segment bcd4(o4,Out4[0],Out4[1],Out4[2],Out4[3],Out4[4],Out4[5],Out4[6]);

endmodule

//Mirrors the full bit value
module invert(a,b);
input [3:0] a;
output [3:0] b;

assign b[0]=a[3];
assign b[1]=a[2];
assign b[2]=a[1];
assign b[3]=a[0];

endmodule



