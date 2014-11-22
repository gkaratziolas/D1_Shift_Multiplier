module test_register;

    parameter n = 4;
    logic clock, reset, add, shift, C, Creg;
    logic[n-1:0] Qin, Sum;
    logic[n*2-1:0] QA;
    
    initial
      begin
        clock = 1'b0;
        forever #10ns clock = ~clock;
      end
endmodule
