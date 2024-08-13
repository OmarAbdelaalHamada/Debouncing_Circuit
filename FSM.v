module FSM(clk,rst_n,sync_signal,timer_done,debouncer_out,timer_en);
localparam IDLE = 2'b00;
localparam CHECK_HIGH = 2'b01;
localparam HIGH_STATE = 2'b10;
localparam CHECK_LOW = 2'b11;
input clk,rst_n,sync_signal,timer_done;
output reg debouncer_out,timer_en;
//encoding :
// (*fsm_encoding = "gray"*)
reg [1:0]current_state,next_state;
//next state :
always @(*) begin
    case (current_state)
       IDLE :begin
            if(sync_signal)begin
                next_state <= CHECK_HIGH;
            end
            else begin
                next_state <= IDLE;
            end
       end 
       CHECK_HIGH :begin
            if(timer_done)begin
                next_state <= HIGH_STATE;
            end
            else begin
                next_state <= CHECK_HIGH;
            end
       end 
       HIGH_STATE :begin
            if(sync_signal)begin
                next_state <= HIGH_STATE;
            end
            else begin
                next_state <= CHECK_LOW;
            end
       end 
       CHECK_LOW :begin
            if(sync_signal)begin
                next_state <= HIGH_STATE;
            end
            else if(timer_done)begin
                next_state <= IDLE;
            end
            else begin
                next_state <= CHECK_LOW;
            end
       end  
    endcase
end
//current state :
always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        current_state <= IDLE;
    end
    else begin
        current_state <= next_state;
    end
end
//output :
always @(*) begin
    case (current_state)
        IDLE : begin
            debouncer_out <= 0;
            timer_en <= 0;
        end  
        CHECK_HIGH : begin
            debouncer_out <= 0;
            timer_en <= 1;
        end  
        HIGH_STATE : begin
            debouncer_out <= 1;
            timer_en <= 0;
        end  
        CHECK_LOW : begin
            debouncer_out <= 1;
            timer_en <= 1;
        end  
    endcase
end
endmodule