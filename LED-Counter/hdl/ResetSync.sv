

module ResetSync
                #(parameter N_SYNC_STAGES = 3)
                (
                 input  bit reset_n,
                 input  bit clock,
                 output bit reset_sync_n
                );

// Reset Synchronization:
/* >3 FlipFlops are used for generating the internal reset signal
 *
 *  the FF are arranged in a synchronous shift register, with the first FF (rRestSync_m) being constantely feed with logic value 1
 *  (corresponding to de-asserted rest - as the reset signal ha negative logic ( 0 ... reset active, 1 ... reset inactive).
 *
 *  the chain is asynchrounously set to 0 in case the external reset signal is asserted (logic low), hence the reset output follows
 *  a negative edge of the reset_n signal immediately.
 *  if the reset_n is however de-asserted, the logic higher data has to propagate throught the shift register.
 *
 *  this guarantees the reset pulse to
 *      #) be synchronously de-asserted
 *      #) has a minimum low duration of >3 clock cycles
 *  
 */
bit rRestSync_m;
bit [N_SYNC_STAGES-2:0] rRestSync;

always_ff @(posedge clock or negedge reset_n)
begin
    if(!reset_n)
        {rRestSync_m, rRestSync} <= '0;
    else
        {rRestSync_m, rRestSync} <= {1'b1, rRestSync_m, rRestSync[N_SYNC_STAGES-2:1]};
end

assign reset_sync_n = rRestSync[0];

endmodule
