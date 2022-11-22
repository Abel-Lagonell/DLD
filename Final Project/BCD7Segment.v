module BCD7Segment(I,A,B,C,D,E,F,G)
input [3:0] I; //BCD Input
output A,B,C,D,E,F,G;

assign A = ~I[0]&~I[2] & (I[1]^I[3]); //A'C'(B^D)
assign B = I[1] & (I[2]^I[3]); //B(C^D)
assign C = ~I[1]&I[2]&~I[3]; //B'CD'
assign D = ~I[0]&~I[2]&(I[1]^I[3]) | I[1]&I[2]&I[3]; //A'C'(B^D)+BCD
assign E = I[1]&~I[2] | I[3]; //BC'+D
assign F = ~I[0]&~I[1]&~I[2]&I[3] | I[1]&I[2]&I[3] | ~I[0]&~I[1]&I[2]; //A'B'C'D+BCD+A'B'C
assign G = ~I[0]&~I[1]&~I[2] | I[1]&I[2]&I[3]; //A'B'C'+BCD

endmodule