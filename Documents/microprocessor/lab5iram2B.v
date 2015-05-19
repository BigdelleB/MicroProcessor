module lab5iram2B(CLK, RESET, ADDR, Q);
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
      mem[0]   <= 16'b0010000001111000;   // LB   R1, -8(R0)
      mem[1]   <= 16'b0010000010111001;   // LB   R2, -7(R0)
      mem[2]   <= 16'b0100000001111111;   // SB   R1, -1(R0)
      mem[3]   <= 16'b0100000001111110;   // SB   R1, -2(R0)
      mem[4]   <= 16'b0100000010111101;   // SB   R2, -3(R0)
      mem[5]   <= 16'b1111010000011011;   // SRL  R3, R2
      mem[6]   <= 16'b1111011000011010;   // SRA  R3, R3
      mem[7]   <= 16'b1111011000011010;   // SRA  R3, R3
      mem[8]   <= 16'b1111011000011010;   // SRA  R3, R3
      mem[9]   <= 16'b1111010000100100;   // SLL  R4, R2
      mem[10]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[11]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[12]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[13]  <= 16'b1111011100011110;   // OR   R3, R3, R4
      mem[14]  <= 16'b0100000011111100;   // SB   R3, -4(R0)
      mem[15]  <= 16'b0000000000000001;   // HALT
      mem[16]  <= 16'b0100000001111111;   // SB   R1, -1(R0)
      mem[17]  <= 16'b1111010001101000;   // ADD  R5, R2, R1
      mem[18]  <= 16'b0101010001000000;   // ADDI R1, R2, 0
      mem[19]  <= 16'b0100000001111110;   // SB   R1, -2(R0)
      mem[20]  <= 16'b0100000101111101;   // SB   R5, -3(R0)
      mem[21]  <= 16'b1111101000011011;   // SRL  R3, R5
      mem[22]  <= 16'b1111011000011011;   // SRL  R3, R3
      mem[23]  <= 16'b1111011000011011;   // SRL  R3, R3
      mem[24]  <= 16'b1111011000011011;   // SRL  R3, R3
      mem[25]  <= 16'b1111101000100100;   // SLL  R4, R5
      mem[26]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[27]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[28]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[29]  <= 16'b1111011100011110;   // OR   R3, R3, R4
      mem[30]  <= 16'b0100000011111100;   // SB   R3, -4(R0)
      mem[31]  <= 16'b0000000000000001;   // HALT
      mem[32]  <= 16'b0100000001111111;   // SB   R1, -1(R0)
      mem[33]  <= 16'b1111101001010000;   // ADD  R2, R5, R1
      mem[34]  <= 16'b1111101000001001;   // SUB  R1, R5, R0
      mem[35]  <= 16'b0100000001111110;   // SB   R1, -2(R0)
      mem[36]  <= 16'b0100000010111101;   // SB   R2, -3(R0)
      mem[37]  <= 16'b1111010000011011;   // SRL  R3, R2
      mem[38]  <= 16'b1111011000011011;   // SRL  R3, R3
      mem[39]  <= 16'b1111011000011011;   // SRL  R3, R3
      mem[40]  <= 16'b1111011000011011;   // SRL  R3, R3
      mem[41]  <= 16'b1111010000100100;   // SLL  R4, R2
      mem[42]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[43]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[44]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[45]  <= 16'b1111011100011110;   // OR   R3, R3, R4
      mem[46]  <= 16'b0100000011111100;   // SB   R3, -4(R0)
      mem[47]  <= 16'b0000000000000001;   // HALT
      mem[48]  <= 16'b0100000001111111;   // SB   R1, -1(R0)
      mem[49]  <= 16'b1111010001101000;   // ADD  R5, R2, R1
      mem[50]  <= 16'b0110010001111111;   // ANDI R1, R2, -1
      mem[51]  <= 16'b0100000001111110;   // SB   R1, -2(R0)
      mem[52]  <= 16'b0100000101111101;   // SB   R5, -3(R0)
      mem[53]  <= 16'b1111101000011011;   // SRL  R3, R5
      mem[54]  <= 16'b1111011000011011;   // SRL  R3, R3
      mem[55]  <= 16'b1111011000011011;   // SRL  R3, R3
      mem[56]  <= 16'b1111011000011011;   // SRL  R3, R3
      mem[57]  <= 16'b1111101000100100;   // SLL  R4, R5
      mem[58]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[59]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[60]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[61]  <= 16'b1111011100011110;   // OR   R3, R3, R4
      mem[62]  <= 16'b0100000011111100;   // SB   R3, -4(R0)
      mem[63]  <= 16'b0000000000000001;   // HALT
      mem[64]  <= 16'b0100000001111111;   // SB   R1, -1(R0)
      mem[65]  <= 16'b1111101001010000;   // ADD  R2, R5, R1
      mem[66]  <= 16'b0111101001000000;   // ORI  R1, R5, 0
      mem[67]  <= 16'b0100000001111110;   // SB   R1, -2(R0)
      mem[68]  <= 16'b0100000010111101;   // SB   R2, -3(R0)
      mem[69]  <= 16'b1111010000011011;   // SRL  R3, R2
      mem[70]  <= 16'b1111011000011011;   // SRL  R3, R3
      mem[71]  <= 16'b1111011000011011;   // SRL  R3, R3
      mem[72]  <= 16'b1111011000011011;   // SRL  R3, R3
      mem[73]  <= 16'b1111010000100100;   // SLL  R4, R2
      mem[74]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[75]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[76]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[77]  <= 16'b1111011100011110;   // OR   R3, R3, R4
      mem[78]  <= 16'b0100000011111100;   // SB   R3, -4(R0)
      mem[79]  <= 16'b0000000000000001;   // HALT
      mem[80]  <= 16'b0100000001111111;   // SB   R1, -1(R0)
      mem[81]  <= 16'b1111010001101000;   // ADD  R5, R2, R1
      mem[82]  <= 16'b1111010010001101;   // AND  R1, R2, R2
      mem[83]  <= 16'b0100000001111110;   // SB   R1, -2(R0)
      mem[84]  <= 16'b0100000101111101;   // SB   R5, -3(R0)
      mem[85]  <= 16'b1111101000011011;   // SRL  R3, R5
      mem[86]  <= 16'b1111011000011011;   // SRL  R3, R3
      mem[87]  <= 16'b1111011000011011;   // SRL  R3, R3
      mem[88]  <= 16'b1111011000011011;   // SRL  R3, R3
      mem[89]  <= 16'b1111101000100100;   // SLL  R4, R5
      mem[90]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[91]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[92]  <= 16'b1111100000100100;   // SLL  R4, R4
      mem[93]  <= 16'b1111011100011110;   // OR   R3, R3, R4
      mem[94]  <= 16'b0100000011111100;   // SB   R3, -4(R0)
      mem[95]  <= 16'b0000000000000001;   // HALT
      mem[96]  <= 16'b0100000001111111;   // SB   R1, -1(R0)
      mem[97]  <= 16'b1111101001010000;   // ADD  R2, R5, R1
      mem[98]  <= 16'b1111101000001001;   // SUB  R1, R5, R0
      mem[99]  <= 16'b0100000001111110;   // SB   R1, -2(R0)
      mem[100] <= 16'b0100000010111101;   // SB   R2, -3(R0)
      mem[101] <= 16'b1111010000011011;   // SRL  R3, R2
      mem[102] <= 16'b1111011000011011;   // SRL  R3, R3
      mem[103] <= 16'b1111011000011011;   // SRL  R3, R3
      mem[104] <= 16'b1111011000011011;   // SRL  R3, R3
      mem[105] <= 16'b1111010000100100;   // SLL  R4, R2
      mem[106] <= 16'b1111100000100100;   // SLL  R4, R4
      mem[107] <= 16'b1111100000100100;   // SLL  R4, R4
      mem[108] <= 16'b1111100000100100;   // SLL  R4, R4
      mem[109] <= 16'b1111011100011110;   // OR   R3, R3, R4
      mem[110] <= 16'b0100000011111100;   // SB   R3, -4(R0)
      mem[111] <= 16'b0000000000000001;   // HALT
      mem[112] <= 16'b0100000001111111;   // SB   R1, -1(R0)
      mem[113] <= 16'b1111010001101000;   // ADD  R5, R2, R1
      mem[114] <= 16'b1111010000001001;   // SUB  R1, R2, R0
      mem[115] <= 16'b0100000001111110;   // SB   R1, -2(R0)
      mem[116] <= 16'b0100000101111101;   // SB   R5, -3(R0)
      mem[117] <= 16'b1111101000011011;   // SRL  R3, R5
      mem[118] <= 16'b1111011000011011;   // SRL  R3, R3
      mem[119] <= 16'b1111011000011011;   // SRL  R3, R3
      mem[120] <= 16'b1111011000011011;   // SRL  R3, R3
      mem[121] <= 16'b1111101000100100;   // SLL  R4, R5
      mem[122] <= 16'b1111100000100100;   // SLL  R4, R4
      mem[123] <= 16'b1111100000100100;   // SLL  R4, R4
      mem[124] <= 16'b1111100000100100;   // SLL  R4, R4
      mem[125] <= 16'b1111011100011110;   // OR   R3, R3, R4
      mem[126] <= 16'b0100000011111100;   // SB   R3, -4(R0)
      mem[127] <= 16'b0000000000000001;   // HALT
    end
  end

endmodule
