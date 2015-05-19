module alu(A, B, OP, Y, C, V, N, Z, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0,RESET);
  input  [7:0]  A;
  input  [7:0]  B;
  input RESET;
  input  [2:0]  OP;

  output [7:0]  Y;
  output        C;
  output        V;
  output        N;
  output        Z;
  output [6:0]  HEX7;
  output [6:0]  HEX6;
  output [6:0]  HEX5;
  output [6:0]  HEX4;
  output [6:0]  HEX3;
  output [6:0]  HEX2;
  output [6:0]  HEX1;
  output [6:0]  HEX0;
  
  wire CISEL;     //intermediates to allow the control to send out signals accordingly
  wire BSEL;
  wire SHIFT_LA;
  wire SHIFT_LR;
  wire LOGICAL_OP;
  wire [1:0] OSEL;
  
  wire [7:0] Bout;
  wire CIholder;
  
  wire [7:0] Y_Shift;
  wire [7:0] Y_Arith;
  wire [7:0] Y_Logic;
  
  wire [3:0] CNVZLOG;
  wire [3:0] CNVZARITH;
  wire [3:0] CNVZSHIFT;  



  // ADD YOUR CODE BELOW THIS LINE
  control freak(
	  .OP(OP), 
	  .CISEL(CISEL), 
	  .BSEL(BSEL), 
	  .OSEL(OSEL), 
	  .SHIFT_LA(SHIFT_LA), 
	  .SHIFT_LR(SHIFT_LR),
	  .LOGICAL_OP(LOGICAL_OP)
	 );
  
  muxCI CI(
	.CISEL(CISEL),
	.CIout(CIholder)
  );
  
  muxBB BB(
	.BSEL(BSEL),
	.B(B), 
	.CIout(Bout)
  );
  
  muxOUT finalMux(
	.SHIFT(Y_Shift), 
	.ARITH(Y_Arith), 
	.LOG(Y_Logic),
	.SEL(OSEL),
	.CIout(Y),
	.C(C),
	.Z(Z),
	.N(N),
	.V(V),
	.CNVZSHIFT(CNVZSHIFT),
	.CNVZLog(CNVZLOG),
	.CNVZARITH(CNVZARITH)
  );

  logical paradox(
		.A(A),
		.B(Bout),
		.OP(LOGICAL_OP),
		.Y(Y_Logic),
		.Z(CNVZLOG[3]),
		.N(CNVZLOG[1]),
		.V(CNVZLOG[2]),
		.C(CNVZLOG[0])
  );  
  
  shifter iDontGiveAShift(
		.LA(SHIFT_LA),
		.A(A),
		.LR(SHIFT_LR),
		.Y(Y_Shift),
		.C(CNVZSHIFT[0]),
		.N(CNVZSHIFT[1]),
		.V(CNVZSHIFT[2]),
		.Z(CNVZSHIFT[3])
  );
  
  adder add(
	.A(A),
	.B(Bout),
	.CI(CIholder),
	.Y(Y_Arith),
	.C(CNVZARITH[0]),
	.N(CNVZARITH[1]),
	.V(CNVZARITH[2]),
	.Z(CNVZARITH[3])
  );

  // ADD YOUR CODE ABOVE THIS LINE



  // SEVEN-SEGMENT DISPLAY DRIVERS

  // replace unused segments with code to disable display
  assign HEX5 = 7'b1111111;
  assign HEX4 = 7'b1111111;
  assign HEX3 = 7'b1111111;
  assign HEX2 = 7'b1111111;
  assign HEX1 = 7'b1111111;
  assign HEX0 = 7'b1111111;

  hex_to_seven_seg upperBitsOfY(
    .B(Y[7:4]),
    .SSEG_L(HEX7)
  );

  hex_to_seven_seg lowerBitsOfY(
    .B(Y[3:0]),
    .SSEG_L(HEX6)
  );

endmodule