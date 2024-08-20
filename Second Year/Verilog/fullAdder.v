// data flow
module fa_dfm(a,b,ci,s,co);
input a,b,ci;
output s,co;
assign s=a^b^ci;
assign co=(a&b)|(b&ci)|(a&ci);
endmodule

// data flow test bench
module fa_dfm_tb;
reg a,b,ci;
wire s,co;
fa_dfm DUT(a,b,ci,s,co);
initial begin
$monitor (a,b,ci,s,co);
a = 0;b = 0;ci = 1; #100;
a = 0;b = 1;ci = 0; #100;
a = 0;b = 1;ci = 1; #100;
a = 1;b = 0;ci = 0; #100;
a = 1;b = 0;ci = 1; #100;
a = 1;b = 1;ci = 0; #100;
a = 1;b = 1;ci = 1; #100;
end
endmodule

// Structural model of a full adder
// assuming half adder and or gate are defined somewhere else
module fa_sm(a, b, ci, s, co);
    // Input ports
    input a, b, ci;
    // Output ports
    output s, co;
    // Internal wires
    wire t1, t2, t3;

    // First half adder
    ha i1(a, b, t1, t2);

    // Second half adder
    ha i2(t1, ci, s, t3);

    // OR gate for carry out
    or_m i3(t2, t3, co);
endmodule

// Structural test bench
// same

// Behavioural model
module fa_bm(din,dout);
input [2:0] din;
output reg [1:0] dout;
always @(din)
begin
case (din)
3'b000:dout=2'b00;
3'b001:dout=2'b10;
3'b010:dout=2'b10;
3'b011:dout=2'b01;
3'b100:dout=2'b10;
3'b101:dout=2'b01;
3'b110:dout=2'b01;
3'b111:dout=2'b11;
endcase
end
endmodule

// test bench (similar)
module fa_bm_tb;
reg [2:0] din;
wire [1:0] dout;
fa_bm DUT(din,dout);
initial begin
$monitor (din,dout);
din = 3'b001; #100;
din = 3'b010; #100;
din = 3'b011; #100;
din = 3'b100; #100;
din = 3'b101; #100;
din = 3'b110; #100;
din = 3'b111; #100;
end
endmodule