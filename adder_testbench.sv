module adder_testbench;

    parameter n = 4;

    logic[n-1:0] A, M, Sum;
    logic C;

    Adder ADDER (.*);


    initial
      begin
	A = 0;
        M = 0;
	for (A=0; A<2**n-1; A++)
          begin
            for (M=0; M<2**n-1; M++)
              begin
                #2ns;
                assert( {C, Sum} == A + M )
                else
                    $error("Fail: Not Working!");
              end
          end
	$display("Adder works for all values");
      end

endmodule
