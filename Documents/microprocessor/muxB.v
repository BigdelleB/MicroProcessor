module MuxB(mb,IMM,DataB,out);

input mb;
input [7:0] IMM;
input [7:0] DataB;

output [7:0] out;

assign out = (mb == 1'b1) ? IMM : DataB;

endmodule