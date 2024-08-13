module Timer(clk,rst_n,timer_en,timer_done);
parameter COUNTER_FINAL_VALUE = 20;
input clk,rst_n,timer_en;
output reg timer_done;
endmodule