module adder#(parameter n = 4)(
    input logic[n-1:0] A, M,
    output logic[n-1:0] Sum,
    output logic C );

    assign {C, Sum} = {1'b0,A} + {1'b0,M};

endmodule
