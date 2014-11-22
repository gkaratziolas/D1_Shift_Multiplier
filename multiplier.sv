module Add_Shift_Sequencer#(parameter n = 4)(
    input logic clock, start, Q0,
    output logic add, shift, reset, ready);
    
    logic [n-1:0] count; //would use sqrt(n), but that didn't work!

    enum {IDLE, ADDING, SHIFTING, STOPPED} STATE;
    
    always_ff @( posedge clock )
      begin:seq
        case( STATE )
            IDLE:
              begin
                if( start )
                  begin
                    STATE <= ADDING;
                    count <= n;
                  end         
              end           
            ADDING:
              begin
                count = count - 1;
                STATE <= SHIFTING;
              end
                
            SHIFTING:
              begin
                if( count > 0)
                    STATE <= STOPPED;
                else
                    STATE = ADDING;
              end
                    
            STOPPED:
              begin
                if( start )
                    STATE = IDLE;
              end
         endcase
      end
    
    always_comb
      begin:comb
        reset   = 1'b0;
        add     = 1'b0;
        shift   = 1'b0;
        ready   = 1'b0;
        case( STATE )
            IDLE:
              begin
                reset = 1'b1;
              end
            ADDING:
              begin
                if( Q0 )
                    add = 1'b1;
              end
            SHIFTING:
              begin
                shift = 1'b1;
              end
            STOPPED:
              begin
                ready = 1'b1;
              end
	endcase
      end
endmodule
