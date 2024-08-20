module btog(b,g);
input [3:0] b;
output [3:0] g;
assign g[3]=b[3];
assign g[2]=b[3]^b[2];
assign g[1]=b[2]^b[1];
assign g[0]=b[1]^b[0];
endmodule

// test bench
module btog_tb;
reg [3:0] b;
wire [3:0] g;
btog DUT(b,g);
initial begin
$monitor (b,g);
b=4'b1001; #100;
b=4'b1101; #100;
b=4'b1111; #100;
b=4'b1011; #100;
end
endmodule