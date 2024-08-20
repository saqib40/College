//main file
module gates(a,b,c_not,d_or,e_nor,f_and,g_nand,h_xor,i_xnor);
  input a,b;
  output c_not,d_or,e_nor,f_and,g_nand,h_xor,i_xnor;
  assign c_not=~a;
  assign d_or=a|b;
  assign e_nor=~(a|b);
  assign f_and=a&b;
  assign g_nand=~(a&b);
  assign h_xor=a^b;
  assign i_xnor=~(a^b);
endmodule

// test bench
module gates_tb;
  reg a,b;
  wire c_not,d_or,e_nor,f_and,g_nand,h_xor,i_xnor;
  gates DUT(a,b,c_not,d_or,e_nor,f_and,g_nand,h_xor,i_xnor);
  initial begin
    $monitor(a,b,c_not,d_or,e_nor,f_and,g_nand,h_xor,i_xnor);
      a = 1'b0;b = 1'b1; #100;
      a = 1'b1;b = 1'b0; #100;
      a = 1'b1;b = 1'b1; #100;
      a = 1'b0;b = 1'b0; #100;
  end
endmodule