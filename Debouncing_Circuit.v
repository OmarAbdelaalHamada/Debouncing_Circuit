module Debouncing_Circuit(clk,rst_n,noisy_in,debouncer_out);
parameter NUM_STAGES = 2;
parameter COUNTER_FINAL_VALUE = 20;
input clk,rst_n,noisy_in;
output reg debouncer_out;
endmodule