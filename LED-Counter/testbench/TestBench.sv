

module TestBench();

// declares interface signals
bit reset_n;
bit clock;
bit [9:0] LED;

// instanciate DUT
LED_Counter DUT (.*);

// Clock generator 50 MHz (20ns period)
always 
    begin : ClockGenerator
        #10ns
        clock = ~clock;
    end

// The test sequence
initial
begin : TestSequence
    // simulate Power On Reset
    reset_n = 0;
    #43ns;
    reset_n = 1;
    
    
    #1s
    
    $stop();
end

endmodule
