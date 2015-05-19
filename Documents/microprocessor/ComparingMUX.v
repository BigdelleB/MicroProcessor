module ComparingMUX(BS,Z,N,MP);

input [2:0] BS;
input Z;
input N;

output MP;

wire MP;

assign MP = (BS==3'b000) ? Z : ((BS == 3'b001) ? ~Z : ((BS==3'b010) ? ~N : ((BS==3'b011) ? N : 1'b0)));

endmodule

