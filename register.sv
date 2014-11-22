module Register#(parameter n = 4)(
    input logic clock, reset, add, shift, C,
    input logic[n-1:0] Qin, Sum,
    output logic[n*2-1:0] AQ );
    
    logic Creg; //MSB carry bit storage
    
    always_ff @( posedge clock )
        if( reset )
          begin
            Creg        <= 0;
            AQ[n*2-1:n] <= 0;
            AQ[n-1:0]   <= Qin; //load multiplier into Q
          end
          
        else if( add ) //store Sum in C, A
          begin
            Creg <= C;
            AQ[n*2-1:n] <= Sum;
          end
        
        else if( shift )
          begin
            {Creg, AQ} <= {1'b0, Creg, AQ[n*2-1:1]};
          end
endmodule
