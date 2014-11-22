module test_multiplier;

    parameter n = 4;
    logic clock, start;
    logic [n-1:0] M, Qin;
    logic [2*n-1:0] AQ;

    Multiplier MUL(.*);

    initial
      begin
        clock = 1'b0;
        forever #10ns clock = ~clock;
      end

    initial
      begin
	Qin   = 0;
        M     = 0;
        start = 0;

	for (Qin=0; Qin<2**n-1; Qin++)
          begin
            for (M=0; M<2**n-1; M++)
              begin
                #5ns start = 1'b1;
                #20ns start = 1'b0;
                #150ns;
                assert( AQ == Qin * M )
                else
                    $error("Fail: %d != %d * %d", AQ, Qin, M);
                #5ns start = 1'b1;
                #20ns start = 1'b0;
              end
          end
	$display("Multiplier works for all values. Go have drink!");
      end

endmodule