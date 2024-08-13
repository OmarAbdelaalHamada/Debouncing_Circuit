module Timer(clk,rst_n,timer_en,timer_done);
parameter COUNTER_FINAL_VALUE = 100;
parameter COUNTER_WIDTH = 7;
input clk,rst_n,timer_en;
output reg timer_done;
reg [COUNTER_WIDTH-1:0]counter;
always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        counter <= 0;
        timer_done <= 0;
    end
    else begin
        if(timer_en) begin
            if(counter < COUNTER_FINAL_VALUE-1) begin
                counter <= counter + 1'b1;
                timer_done <= 0;
            end
            else begin
                counter <= 0;
                timer_done <= 1;
            end
        end
    end
end
endmodule
