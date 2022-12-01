//Counter - 6
module Count6(clk,reset,inc,count_eq_6,count);

input clk,reset,inc;
output count_eq_6;
output [3:0] count;

wire k;
wire c;
wire [3:0] i;

DFF4 dff(i,clk,k,count);
RCA rca(.A(count),.Cin(inc),.Sum(i));
assign count_eq_6 = (count == 4'b0110)? 1'b1:1'b0;
assign k = (count_eq_6&inc)|reset;

endmodule