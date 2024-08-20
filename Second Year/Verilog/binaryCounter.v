// 4-bit Binary Asynchronous Reset Counter
module abc_m(clk,rst,count);
input clk,rst;
output reg [3:0] count;
always @(posedge rst, posedge clk)
begin
if (rst)
count=4'b0000;
else if (clk)
count=count+1;
end
endmodule

// 4-bit_binary Synchronous Reset Counter
module sbc_m (clk,rst,count);
input clk,rst;
output reg [3:0] count;
always @(posedge clk)
begin
if (rst==1)
count=4'b0000;
else
count=count+1;
end
endmodule