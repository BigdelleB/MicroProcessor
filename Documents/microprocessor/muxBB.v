module muxBB(BSEL,B, CIout);
  // inputs
  input  BSEL;
  input [7:0] B;
  
  reg [7:0] btemp;
  
  // outputs
  output [7:0] CIout;
 
  
  //MUX logic, if BSEL==0, CIout=B
  //else if BSEL==1, CIout=~B
  assign CIout= (BSEL==1'b1)? ~B : B;

endmodule