module jam_counter (
    input clk,
    input rst_n,
    input jam_counter_en,
    output reg check_other_lanes
);
    
    reg [3:0] jam_counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            jam_counter <= 0;
            check_other_lanes <= 0;
        end
        else if (jam_counter_en) begin
            if (jam_counter == 14) begin        // each jam will be given 15 sec
                check_other_lanes <=1;
                jam_counter <= 0;
            end
            else begin
                jam_counter <= jam_counter + 1;
                check_other_lanes <= 0;
            end
        end 
        else begin
            jam_counter <= 0;
            check_other_lanes <= 0;
        end
    end
    
endmodule