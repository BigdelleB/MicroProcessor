module decoder(Iin,SA,SB,DR,FS,MB,IMM,LD,MW,MD,BS,OFF,HALT);
	input [15:0] Iin;
	output [2:0] SA;
	output [2:0] SB;
	output [2:0] DR;
	output [2:0] FS;
	output MB;
	output [7:0] IMM;
	output LD;
	output MW;
	output MD;
	output [2:0] BS;
	output [7:0] OFF;
	output HALT;
	
	wire [2:0] SA;
	wire [2:0] SB;
	
	wire [2:0] DR;
	wire [2:0] FS;
	wire MB;
	wire [7:0] IMM;
	wire LD;
	wire MW;
	wire MD;
	wire HALT;
	wire [2:0] BS;
	wire [7:0] OFF;
	
	assign SA = Iin[11:9];
	assign SB = Iin[8:6];
	assign DR = (Iin[15:12] == 4'b1111) ? Iin[5:3] : ((Iin[15:12] == 4'b0100) ? Iin[11:9]: Iin[8:6]);
	assign FS = (Iin[15:12] == 4'b1111) ? Iin[2:0] : ((Iin[15:12] == 4'b1000 || Iin[15:12] == 4'b1001 || 
		Iin[15:12] == 4'b1010 || Iin[15:12] == 4'b1011) ? 3'b001 : ((Iin[15:12] == 4'b0101) ? 3'b000 : 
		((Iin[15:12] == 4'b0110) ? 3'b101 : ((Iin[15:12] == 4'b0111) ? 3'b110 : 3'b000))));
	assign IMM = (Iin[15:12] != 4'b1111 && Iin[15:12]!=4'b1010) ? {Iin[5],Iin[5],Iin[5:0]} : 8'b0;
	assign MB = (Iin[15:12] == 4'b1111 || Iin[15:12]==4'b1001 || Iin[15:12]==4'b1000) ? 1'b0 : 1'b1;
	assign LD = (Iin[15:12] == 4'b0100 || Iin[15:12] == 4'b1000 || Iin[15:12] == 4'b1001 || 
		Iin[15:12] == 4'b1010 || Iin[15:12] == 4'b1011 || Iin[15:12]==4'b0000) ? 1'b0 : 1'b1;
	assign MW = (Iin[15:12] == 4'b0100) ? 1'b1 : 1'b0;
	assign MD = (Iin[15:12] == 4'b0100 || Iin[15:12] == 4'b0010) ? 1'b1 : 1'b0;
	assign HALT = (Iin[15:12] == 4'b0000 && Iin[2:0] == 3'b001) ? 1'b1 : 1'b0;
	
	//1001 used to bed 001
	assign BS = (Iin[15:12] == 4'b1000) ? 3'b000 : ((Iin[15:12] == 4'b1001) ? 3'b001 : ((Iin[15:12] == 4'b1010) ?
		3'b010 : (Iin[15:12] == 4'b1011 ? 3'b011 : 3'b100)));
	assign OFF = {Iin[5],Iin[5:0],1'b0};
	
endmodule