//Counter - 10 
module Count10(clk,reset,inc,count_eq_9,count);

input clk,reset,inc;
output count_eq_9;
output [3:0] count;

wire k;
wire c;
wire [3:0] i;

DFF4 dff(i,clk,k,count);
RCA rca(.A(count),.Cin(inc),.Sum(i));
assign count_eq_9 = (count == 4'b1001)? 1'b1:1'b0;
assign k = (count_eq_9&inc)|reset;

endmodule