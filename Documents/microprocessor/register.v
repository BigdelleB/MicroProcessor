module register(CLK,RESET,SA,SB,LD,DR,D_in,DataA,DataB);	
	input CLK;
	input [2:0] SA;
	input [2:0] SB;
	input LD;
	input [2:0] DR;
	input [7:0] D_in;
	input RESET;
	
	output [7:0] DataA;
	output [7:0] DataB;
	
	reg [7:0] regA;
	reg [7:0] regB;
	reg [7:0] regC;
	reg [7:0] regD;
	reg [7:0] regE;
	reg [7:0] regF;
	reg [7:0] regG;
	reg [7:0] regH;
	wire [7:0] DataA;
	wire [7:0] DataB;
	
	
	assign DataA = (SA == 3'b000) ? regA : ((SA == 3'b001) ? regB : ((SA == 3'b010) ? regC : 
		((SA == 3'b011) ? regD : ((SA == 3'b100) ? regE : ((SA == 3'b101) ? regF : ((SA == 3'b110) ? 
		regG : regH))))));
	assign DataB = (SB == 3'b000) ? regA : ((SB == 3'b001) ? regB : ((SB == 3'b010) ? regC : 
		((SB == 3'b011) ? regD : ((SB == 3'b100) ? regE : ((SB == 3'b101) ? regF : ((SB == 3'b110) ? 
		regG : regH))))));
	
	always@(posedge CLK) begin
		if(RESET == 1'b1) begin
			regA <= 8'b0;
			regB <= 8'b0;
			regC <= 8'b0;
			regD <= 8'b0;
			regE <= 8'b0;
			regF <= 8'b0;
			regG <= 8'b0;
			regH <= 8'b0;
		end
		
		if(LD == 1'b1) begin
			case(DR)
				3'b000: regA <= D_in;
				3'b001: regB <= D_in;
				3'b010: regC <= D_in;
				3'b011: regD <= D_in;
				3'b100: regE <= D_in;
				3'b101: regF <= D_in;
				3'b110: regG <= D_in;
				3'b111: regH <= D_in;
			endcase
		end
	end
endmodule
