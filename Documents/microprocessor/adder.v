module adder(A,B,CI,Y,C,V,N,Z); // add all inputs and outputs inside parentheses

  // inputs
  input [7:0] A;
  input [7:0] B;
  input		  CI;
  
  // outputs
  output [7:0] Y;
  output 		C;
  output			V;
  output			N;
  output			Z;
  
  // reg and internal variable definitions
  wire C0;
  wire C1;
  wire C2;
  wire C3;
  wire C4;
  wire C5;
  wire C6;
  
  // implement module here

	assign Y[0] = A[0] ^ B[0] ^ CI;
	assign C0 = (A[0]&B[0]) | (A[0]&CI) | (B[0]&CI);
	assign Y[1] = A[1] ^ B[1] ^ C0;
	assign C1 = (A[1]&B[1]) | (A[1]&C0) | (B[1]&C0);
	assign Y[2] = A[2] ^ B[2] ^ C1;
	assign C2 = (A[2]&B[2]) | (A[2]&C1) | (B[2]&C1);
	assign Y[3] = A[3] ^ B[3] ^ C2;
	assign C3 = (A[3]&B[3]) | (A[3]&C2) | (B[3]&C2);
	assign Y[4] = A[4] ^ B[4] ^ C3;
	assign C4 = (A[4]&B[4]) | (A[4]&C3) | (B[4]&C3);
	assign Y[5] = A[5] ^ B[5] ^ C4;
	assign C5 = (A[5]&B[5]) | (A[5]&C4) | (B[5]&C4);
	assign Y[6] = A[6] ^ B[6] ^ C5;
	assign C6 = (A[6]&B[6]) | (A[6]&C5) | (B[6]&C5);
	assign Y[7] = A[7] ^ B[7] ^ C6;
	assign C = (A[7]&B[7]) | (A[7]&C6) | (B[7]&C6);
	
	assign V = (A[7] == B[7] && Y[7] != A[7])	? 1'b1 : 1'b0;
	assign N = (Y[7] == 1'b1)? 1'b1 : 1'b0;
	assign Z = (Y == 7'b0) ? 1'b1 : 1'b0;
	
  
endmodule