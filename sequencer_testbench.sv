module test_sequencer;
    parameter n = 4;
    logic clock, start, Q0, add, shift, reset, ready;
    logic[n-1:0] count;

    Sequencer SEQ(.*);

    initial
      begin
        clock = 1'b0;
        forever #10ns clock = ~clock;
      end

    always
      begin
        start = 1'b0;
        Q0    = 1'b0;
	
	#30ns

        start = 1'b1;
        Q0    = 1'b0;

	#20ns

        start = 1'b0;
        Q0    = 1'b0;

	#30ns

        start = 1'b0;
        Q0    = 1'b0;

	#30ns

        start = 1'b0;
        Q0    = 1'b0;

        #300ns;


      end
endmodule
