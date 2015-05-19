module muxOUT(SHIFT, ARITH, LOG, SEL, CIout, C,N,V,Z, CNVZSHIFT, CNVZLog, CNVZARITH);
  // inputs
  input [1:0] SEL;
  input [7:0] SHIFT;
  input [7:0] ARITH;
  input [7:0] LOG;
  
  
  //4 bits for each C,N,V and Z, the mux must take in the 4 and then choose which data to display
  input [3:0] CNVZSHIFT;
  input [3:0] CNVZLog;
  input [3:0] CNVZARITH;

  
  
  // outputs
  output [7:0] CIout;
  output C;
  output N;
  output V;
  output Z;
  
  
  assign CIout = (SEL==2'b00) ? SHIFT:((SEL==2'b01)? ARITH: LOG);
  assign C= (SEL==2'b00) ? CNVZSHIFT[0]:((SEL==2'b01)? CNVZARITH[0]: CNVZLog[0]);
  assign N= (SEL==2'b00) ? CNVZSHIFT[1]:((SEL==2'b01)? CNVZARITH[1]: CNVZLog[1]);
  assign V= (SEL==2'b00) ? CNVZSHIFT[2]:((SEL==2'b01)? CNVZARITH[2]: CNVZLog[2]);
  assign Z= (SEL==2'b00) ? CNVZSHIFT[3]:((SEL==2'b01)? CNVZARITH[3]: CNVZLog[3]);

endmodule