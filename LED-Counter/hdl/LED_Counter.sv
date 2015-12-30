

module LED_Counter(
                    input  bit          reset_n,    // asynchronous reset input
                    input  bit          clock,      // 50 MHz board clock
                    output bit [9:0]    LED         // LED line
                                                    // DE-0 Nano: has only 8 LED's, hence two signals will go into nowhere
                                                    // DE-0 CV  : utilizes all 10 LED's
                  );

// as the rest source is asynchronous (not in phase with the clock signal) we'll do some synchronization
// reset_sync_n is asyncronously asserted - but synchronously de-asserted
bit reset_sync_n;
ResetSync ResetSynchronizer (.*);
                  

// int unsigned is a SystemVerilog type for an unsigned 32 bit value
// hence counting from 0 to 2^32-1 (4'294'967'295)
// With 50 MHz clock input the counter will overflow every 4294967295/50000000 ~ 85 seconds
int unsigned Cnt;

// A simple up counter
always_ff @(posedge clock or negedge reset_sync_n)
begin
    if(!reset_sync_n)
        Cnt <= '0;
    else
        Cnt <= Cnt + 1'b1;
end

// assign the upper 10 bit of the counter to the LED's
// Remark: DE-0 Nano: truncation of 2 MSB (bit 29:22 are assigned to LED)
// Remark: DE-0 CV  : bit 31:22 are assigned to LED
assign LED = Cnt[31:22];

endmodule
