module Synchronizer(clk,rst_n,noisy_in,sync_signal);
parameter NUM_STAGES = 2;
input clk,rst_n,noisy_in;
output reg sync_signal;
endmodule