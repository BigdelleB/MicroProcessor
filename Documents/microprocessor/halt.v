module halt(CLK,RESET, HALT,EN_L,H);
	input CLK;
	input HALT;
	input EN_L;
	output H;
	input RESET;
	
	reg prevEN_L;
	wire H;
	
	always@(posedge CLK) begin
		if(!RESET) begin
			prevEN_L=1'b1;
			//H=1'b0;
		end 
		
		else begin
			prevEN_L<=EN_L;
		end
	end
	
	//if H=1'b1 we are supposed to be halted  ,if halt =1 and EN_L=1 we halt, other
	
	assign H = (HALT) ? ((prevEN_L==1'b1 && EN_L==1'b0) ? 1'b0 : 1'b1):1'b0;
	
endmodule