module lab5iram1B(CLK, RESET, ADDR, Q);
  input         CLK;
  input         RESET;
  input  [7:0]  ADDR;
  output [15:0] Q;

  reg    [15:0] mem[0:127]; // instruction memory with 16 bit entries

  wire   [6:0]  saddr;
  integer       i;


  assign saddr = ADDR[7:1];
  assign Q = mem[saddr];

  always @(posedge CLK) begin
    if(RESET) begin
      mem[0]   <= 16'b1111000000000001;   // SUB R0, R0, R0
      mem[1]   <= 16'b0101000101111111;   // ADDI R5, R0, -1
      mem[2]   <= 16'b0010101001111001;   // LB R1, -7(R5)
      mem[3]   <= 16'b0010101010111010;   // LB R2, -6(R5)
      mem[4]   <= 16'b0110010011000001;   // ANDI R3, R2, 1
      mem[5]   <= 16'b1111000011011001;   // SUB R3, R0, R3
      mem[6]   <= 16'b1111001011011101;   // AND R3, R1, R3
      mem[7]   <= 16'b1111000011100000;   // ADD R4, R0, R3
      mem[8]   <= 16'b1111001000001100;   // SLL R1, R1
      mem[9]   <= 16'b1111010000010011;   // SRL R2, R2
      mem[10]  <= 16'b0110010011000001;   // ANDI R3, R2, 1
      mem[11]  <= 16'b1111000011011001;   // SUB R3, R0, R3
      mem[12]  <= 16'b1111001011011101;   // AND R3, R1, R3
      mem[13]  <= 16'b1111100011100000;   // ADD R4, R4, R3
      mem[14]  <= 16'b1111001000001100;   // SLL R1, R1
      mem[15]  <= 16'b1111010000010011;   // SRL R2, R2
      mem[16]  <= 16'b0110010011000001;   // ANDI R3, R2, 1
      mem[17]  <= 16'b1111000011011001;   // SUB R3, R0, R3
      mem[18]  <= 16'b1111001011011101;   // AND R3, R1, R3
      mem[19]  <= 16'b1111100011100000;   // ADD R4, R4, R3
      mem[20]  <= 16'b1111001000001100;   // SLL R1, R1
      mem[21]  <= 16'b1111010000010011;   // SRL R2, R2
      mem[22]  <= 16'b0110010011000001;   // ANDI R3, R2, 1
      mem[23]  <= 16'b1111000011011001;   // SUB R3, R0, R3
      mem[24]  <= 16'b1111001011011101;   // AND R3, R1, R3
      mem[25]  <= 16'b1111100011100000;   // ADD R4, R4, R3
      mem[26]  <= 16'b0100101100000000;   // SB R4, 0(R5)

      for(i = 27; i < 128; i = i + 1) begin
        mem[i] <= 16'b0000000000000000;
      end
    end
  end

endmodule
