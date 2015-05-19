module shifter(LA, A, LR, Y, C, V,N,Z); // add all inputs and outputs inside parentheses

  // inputs
  input LA; //logical shift or arithmatic shift
  input [7:0] A; //the 8 bit input, unshifted
  input LR; //shift left or shift right
 
  
  // outputs
  output  [7:0] Y; //the 8 bit output of the shifted number
  output C; //the shift out value
  output V;
  output N;
  output Z;
 
	
	assign C= (LR==1'b1) ? A[0] : A[7];
	assign V=1'b0;
	assign N= (Y[7]==1'b1) ? 1'b1:1'b0;
	assign Z= (Y==8'b00000000)? 1'b1:1'b0;
	
	assign Y[0] =(LA==1'b1&& LR==1'b1) ? A[1] :((LA==1'b0 &&LR==1'b1)? A[1] : 1'b0);
	assign Y[1] = (LA==1'b1&& LR==1'b1) ? A[2] :((LA==1'b0 &&LR==1'b1)? A[2] : A[0]);
	assign Y[2] = (LA==1'b1&& LR==1'b1) ? A[3] :((LA==1'b0 &&LR==1'b1)? A[3] : A[1]);
	assign Y[3] = (LA==1'b1&& LR==1'b1) ? A[4] :((LA==1'b0 &&LR==1'b1)? A[4] : A[2]);
	assign Y[4] = (LA==1'b1&& LR==1'b1) ? A[5] :((LA==1'b0 &&LR==1'b1)? A[5] : A[3]);
	assign Y[5] = (LA==1'b1&& LR==1'b1) ? A[6] :((LA==1'b0 &&LR==1'b1)? A[6] : A[4]);
	assign Y[6] = (LA==1'b1&& LR==1'b1) ? A[7] :((LA==1'b0 &&LR==1'b1)? A[7] : A[5]);
	assign Y[7] = (LA==1'b1&& LR==1'b1) ? A[7] :((LA==1'b0 &&LR==1'b1)? 1'b0 : A[6]);	

endmodule