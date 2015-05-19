module cpu(CLK, RESET, EN_L, Iin, Din, PC, NextPC, DataA, DataB, DataC, DataD, MW);
  input         CLK;
  input         RESET;
  input         EN_L;
  input  [15:0] Iin;
  input  [7:0]  Din;
  
  output [7:0]  PC;
  output [7:0]  NextPC;
  output [7:0]  DataA;
  output [7:0]  DataB;
  output [7:0]  DataC;
  output [7:0]  DataD;
  output        MW;
  
  // comment the two lines out below if you use a submodule to generate PC/NextPC
  reg [7:0] PC;
  
  
  wire MW;
  wire [2:0] SA;
  wire [2:0] SB;
  wire LD;
  wire [2:0] DR;
  wire MB;
  wire MD;
  wire [7:0] DataB_out;
  wire [7:0] IMM;
  wire [2:0] FS;
  wire [2:0] BS;
  wire [7:0] OFF;
  wire HALT;
  wire H;
  wire N;
  wire Z;
  wire MP;
  wire [7:0] NextPC;
  
  // ADD YOUR CODE BELOW THIS LINE
	decoder decode(
		.Iin(Iin),
		.SA(SA),
		.SB(SB),
		.DR(DR),
		.FS(FS),
		.MB(MB),
		.IMM(IMM),
		.LD(LD),
		.MW(MW),
		.MD(MD),
		.BS(BS),
		.OFF(OFF),
		.HALT(HALT)
	);
	
  register RF(
		.CLK(CLK),
		.RESET(RESET),
		.SA(SA),
		.SB(SB),
		.LD(LD),
		.DR(DR),
		.D_in(DataC),
		.DataA(DataA),
		.DataB(DataB)
	);


	alu ALU(
		.A(DataA), 
		.B(DataB_out), 
		.OP(FS), 
		.Y(DataD), 
		.C(), 
		.V(),
		.N(N), 
		.Z(Z), 
		.HEX7(),
		.HEX6(),
		.HEX5(), 
		.HEX4(), 
		.HEX3(), 
		.HEX2(), 
		.HEX1(), 
		.HEX0(),
		.RESET(RESET)
	);	
	
	MuxB B(
		.mb(MB),
		.IMM(IMM),
		.DataB(DataB),
		.out(DataB_out)
	);
	MuxD D(
		.md(MD),
		.Din(Din),
		.DataD(DataD),
		.out(DataC)
		);
	
	halt halts(
		.CLK(CLK),
		.RESET(RESET),
		.HALT(HALT),
		.EN_L(EN_L),
		.H(H)
	);
	
	always@(posedge CLK) begin
		if(RESET ==1'b1) begin
			PC<= 8'b0;
		end
		
		else begin
			PC<= NextPC;
			end
		end
		
		assign NextPC= (H==1'b1)? PC : ((MP==1'b1)? PC+8'd2 + OFF : PC +8'd2);
	
	
	
//	always@(posedge CLK) begin
//		if(RESET == 1'b1) begin
//			PC = 8'b0;
//			NextPC = 8'd2;
//		end
//		else if(MP == 1'b1) begin
//			PC = PC + 8'd2 + OFF;
//			NextPC = NextPC + 8'd2 + OFF;
//		end
//		else if(H == 1'b1) begin
//			PC = PC;
//			NextPC = NextPC;
//		end
//		else begin
//			PC = PC + 8'd2;
//			NextPC = NextPC + 8'd2;
//		end
//	end
	
	ComparingMUX comparison(
		.BS(BS),
		.Z(Z),
		.N(N),
		.MP(MP)
	);
			
  
  // ADD YOUR CODE ABOVE THIS LINE

  
endmodule