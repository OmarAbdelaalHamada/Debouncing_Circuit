module Debouncing_Circuit_tb();
reg clk,rst_n,noisy_in;
wire debouncer_out;
parameter PERIODE = 10;
parameter COUNTER_FINAL_VALUE = 100;
parameter DELAY = COUNTER_FINAL_VALUE*PERIODE;
Debouncing_Circuit DUT(clk,rst_n,noisy_in,debouncer_out);
initial begin
    forever begin
        #(PERIODE/2) clk = ~clk;
    end 
end
initial begin
    initialization();
    rst();
    test(); 
    test(); 
    #(4*DELAY);
    $stop;
end
//initialization :
task initialization(); 
    begin
        clk = 1;
        rst_n = 0;
        noisy_in = 0;
    end
endtask
//reset :
task rst(); 
    begin
        @(negedge clk)
        rst_n = 0;
        @(negedge clk)
        rst_n = 1;
    end
endtask
//test
task test(); 
    begin
	#(2*DELAY)
	
	repeat(2) begin
		@(posedge clk)
		noisy_in = 1;
		@(posedge clk)
		noisy_in = 0;
		@(posedge clk)
		noisy_in = 1;
	end
	
	#(2*DELAY)

	repeat(2) begin
		@(posedge clk)
		noisy_in = 0;
		@(posedge clk)
		noisy_in = 1;
		@(posedge clk)
		noisy_in = 0;
	end
end
endtask
endmodule