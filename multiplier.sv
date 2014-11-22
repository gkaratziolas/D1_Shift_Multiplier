module Add_Shift_Sequencer#(parameter n = 4)(
    input logic clock, start, Q0,
    output logic add, shift, reset, ready);
    
    logic [sqrt(n)-1:0] count; //might need to be swaped out for [n-1:0]

    enum {IDLE, ADDING, SHIFTING, STOPPED} STATE;
    
    always_ff @( posedge clock )
      begin
        case( STATE )
            IDLE:
                if( start )
                    STATE <= ADDING;
                    count <= n;
                    
            ADDING:
                count = count - 1;
                STATE <= SHIFTING;
                
            SHIFTING:
                if( count > 0)
                    STATE <= READY;
                else
                    STATE = ADDING;
                    
            STOPPED:
                if( start )
                    STATE = RESET;
      end
    
    always_comb
      begin
        reset   = 1'b0;
        add     = 1'b0;
        shift   = 1'b0;
        ready   = 1'b0;
        case( STATE )
            IDLE:
                reset = 1'b1;
            ADDING:
                if( Q0 )
                    add = 1'b1;
            SHIFTING:
                shift = 1'b1;
            STOPPED:
                ready = 1'b1
      end
endmodule
