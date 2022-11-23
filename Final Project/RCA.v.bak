//The HA module
module HA(A, B, Sum, Cout);
input A, B;
output Sum, Cout;

assign Sum = A^B;
assign Cout = A&B; //| - OR, & - AND, ^ - XOR

endmodule

//The RCA module
module RCA(A,Cin,Cout,Sum);

input [3:0] A;
input Cin;
output Cout; 
output [3:0] Sum;

wire c[2:0];

HA u1(A[0],Cin,Sum[0],c[0]);
HA u2(A[1],c[0],Sum[1],c[1]);
HA u3(A[2],c[1],Sum[2],c[2]);
HA u4(A[3],c[2],Sum[3],Cout);
//Not going to be using Cout at all in the stopwatch


endmodule