module logical(A,B,OP,Y,C,V,N,Z); // add all inputs and outputs inside parentheses

  // inputs
  input [7:0] A; //A input, 8 bits wide
  input [7:0] B; //B input, 8 bits wide
  input OP; //1 bit input, tells the logical reg to do OR or AND logic
  //if OP is 0, we do OR
  //OP==1, we do AND
  
  // outputs
  output [7:0] Y;
  output C;
  output V;
  output N;
  output Z;
 
  // reg and internal variable definitions
	
  
  assign Y= (OP==1'b1) ? A&B : A|B;
  assign C=  1'b0;
  assign V= 1'b0;
  assign N= (Y[7]==1'b1) ? 1'b1:1'b0;
  assign Z= (Y==8'b00000000) ? 1'b1:1'b0;
  
endmodule