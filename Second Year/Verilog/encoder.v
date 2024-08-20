module encoder8_3(en,a,y);
input en;
input [7:0]a;
output reg [2:0]y;
always @(a,en)
begin
if(en)
case(a)
8'b00000001: y = 3'b000;
8'b00000010: y = 3'b001;
8'b00000100: y = 3'b010;
8'b00001000: y = 3'b011;
8'b00010000: y = 3'b100;
8'b00100000: y = 3'b101;
8'b01000000: y = 3'b110;
8'b10000000: y = 3'b111;
default:y=3'bXXX;
endcase
else
y=3'bXXX;
end
endmodule

//test bench
module encoder8_3_tb;
reg en;
reg [7:0]a;
wire [2:0]y;
encoder8_3 DUT(en,a,y);
initial begin
$monitor (en,a,y);
en=1;a=8'b00000001; #100;
en=1;a=8'b00000010; #100;
en=1;a=8'b00000100; #100;
en=0;a=8'b00000100; #100;
en=1;a=8'b00001000; #100;
en=1;a=8'b00010000; #100;
en=1;a=8'b00100000; #100;
en=1;a=8'b01000000; #100;
en=1;a=8'b10000000; #100;
end
endmodule