module Synchronizer(clk,rst_n,noisy_in,sync_signal);
parameter NUM_STAGES = 2;
input clk,rst_n,noisy_in;
output reg sync_signal;
reg [NUM_STAGES-1:0]sync_register;
always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin 
        sync_register <= 0;
        sync_signal <= 0;
    end
    else begin
        sync_register[0] <= noisy_in;
        sync_register[1] <= sync_register[0];
        sync_signal <= sync_register[1];
    end
end
endmodule