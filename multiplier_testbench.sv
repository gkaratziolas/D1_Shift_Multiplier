module test_multiplier;

    parameter n = 4;
    logic clock, start;
    logic [n-1:0] M, Qin;
    logic [2*n-1:0] AQ);

    Multiplier M(.*);

    initial
      begin
        clock = 1b'0;
        forever #10ns clock = ~clock;
      end


endmodule