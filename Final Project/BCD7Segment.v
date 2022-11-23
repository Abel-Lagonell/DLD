module BCD7Segment(I,A,B,C,D,E,F,G);
input [3:0] I; //BCD Input
output A,B,C,D,E,F,G;

wire a,b,c,d;

assign a = I[0];
assign b = I[1];
assign c = I[2];
assign d = I[3];

assign A = (~a&~c) & (b^d); //A'C'(B^D)
assign B = b & (c^d); //B(C^D)
assign C = (~b&c) & ~d; //B'CD'
assign D = (b&~c&~d) | (~b&~c&d) | (b&c&d); //BC'D'+ B'C'D + BCD
assign E = (b&~c) | d; //BC'+D
assign F = (~a&~b&~c&d) | (b&c&d) | (~a&~b&c); //A'B'C'D+BCD+A'B'C
assign G = (~a&~b&~c) | (b&c&d); //A'B'C'+BCD

endmodule