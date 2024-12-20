module norm_counter (
    input clk,
    input rst_n,
    input norm_counter_en,
    output reg [1:0] current_road_norm
);
    
    reg [4:0] norm_counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            norm_counter <= 0;
            current_road_norm <= 2'b0;
        end
        else if (norm_counter_en) begin

            if (norm_counter == 29) begin           // each lane will have 30 sec 
                current_road_norm <= current_road_norm + 1;
                norm_counter <= 0;
            end
            else begin
                norm_counter <= norm_counter + 1;
            end
        end 
    end
    
endmodule