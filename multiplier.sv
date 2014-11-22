module Multiplier#(parameter n = 4)(
    input logic clock, start,
    input logic [n-1:0] M, Qin,
    output logic [2*n-1:0] AQ);

    logic add, shift, reset, ready, C, Q0;
    logic[n-1:0] Sum;

    Register REG(.*);
    Adder ADD(.A(AQ[2*n-1:n]), .M(M), .Sum(Sum), .C(C));
    //Sequencer SEQ(.*, .Q0(AQ[0]));
    Sequencer SEQ(.clock(clock), .start(start), .Q0(AQ[0]), .add(add), .shift(shift), .reset(reset), .ready(ready));

endmodule
