module DFF0(data_in,clock,reset, data_out);
input data_in;
input clock,reset;

output reg data_out;

always@(posedge clock)
	begin
		if(reset)
			data_out<=1'b0;
		else
			data_out<=data_in;
	end	

endmodule

//4 bit D Flip Flop
module DFF4(in,clk,rst,out);

input [3:0] in;
input clk,rst;
output [3:0] out;

DFF0 dff0 (in[0],clk,rst,out[0]);
DFF0 dff1 (in[1],clk,rst,out[1]);
DFF0 dff2 (in[2],clk,rst,out[2]);
DFF0 dff3 (in[3],clk,rst,out[3]);

endmodule
