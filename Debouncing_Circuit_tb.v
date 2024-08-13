module Debouncing_Circuit_tb();
reg clk,rst_n,noisy_in;
wire debouncer_out;
Debouncing_Circuit DUT(clk,rst_n,noisy_in,debouncer_out);
initial begin
    clk = 1;
    forever begin
        #5 clk = ~clk;
    end 
end
initial begin
    rst_n = 0;
    noisy_in = 1;
    #10
    rst_n = 1;
    #10
    $stop;
end
endmodule