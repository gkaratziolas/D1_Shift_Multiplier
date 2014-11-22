module test_register;

    parameter n = 4;
    logic clock, reset, add, shift, C;
    logic[n-1:0] Qin, Sum;
    logic[n*2-1:0] AQ;
    
    Register REG(.*);


    initial
      begin
        clock = 1'b0;
        forever #10ns clock = ~clock;
      end

    always
      begin
        Qin = 5;
        Sum = 4;
        reset = 1'b1;
        shift = 1'b0;
        add   = 1'b0;
        C = 1;

        #50ns;

        reset = 1'b0;
        shift = 1'b0;
        add   = 1'b1;

        #50ns;

        reset = 1'b0;
        shift = 1'b1;
        add   = 1'b0;

        #50ns;

        reset = 1'b0;
        shift = 1'b0;
        add   = 1'b0;

      end

endmodule
