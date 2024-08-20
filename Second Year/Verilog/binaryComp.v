module comparator_4bit(
    input [3:0] a,
    input [3:0] b,
    output reg equal,
    output reg greater,
    output reg less
);

always @(*) begin
    if (a == b) begin
        equal = 1'b1;
        greater = 1'b0;
        less = 1'b0;
    end
    else if (a > b) begin
        equal = 1'b0;
        greater = 1'b1;
        less = 1'b0;
    end
    else begin
        equal = 1'b0;
        greater = 1'b0;
        less = 1'b1;
    end
end

endmodule

//test bench
module comparator_4bit_tb
  reg [3:0] a, b;
  wire equal, greater, less;
  comparator_4bit DUT(a,b,equal,greater,less);
  initial begin
    $monitor(a,b,equal,greater,less);
    a=4'1001;b=4'1001;#50;
    a=4'1010;b=4'1010;#50;
  end
endmodule