module test_adder

    parameter n = 4;

    logic[n-1:0] A, M, Sum;
    logic c;

    initial
      begin
        clock = 1'b0;
        forever #10ns clock = ~clock;
      end



    adder ADDER (.*)
endmodule
