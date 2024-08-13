module Debouncing_Circuit(clk,rst_n,noisy_in,debouncer_out);
parameter NUM_STAGES = 2;
parameter COUNTER_FINAL_VALUE = 100;
input clk,rst_n,noisy_in;
output reg debouncer_out;
wire sync_signal,timer_done,timer_en;
Synchronizer Sync(clk,rst_n,noisy_in,sync_signal);
FSM fsm(clk,rst_n,sync_signal,timer_done,debouncer_out,timer_en);
Timer timer(clk,rst_n,timer_en,timer_done);
endmodule