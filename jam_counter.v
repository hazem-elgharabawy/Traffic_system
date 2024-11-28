module jam_counter (
    input clk,
    input rst_n,
    input jam_counter_en,
    output reg jam_start,
    output reg jam_rotation,
    
);
    
    reg [3:0] jam_counter;
    reg start;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            start <= 0;
            jam_counter <= 0;
            jam_start <= 0;
            jam_rotation <= 0;
        end
        else if (!jam_counter_en) begin
            start <= 0;
            jam_counter <= 0;
            jam_start <= 0;
            jam_rotation <= 0;
        else begin
            if (!start) begin
                jam_start <= 1;
                start <= 1;
                jam_counter <= jam_counter + 1;
            end
            else if (jam_counter == 14) begin        // each jam will be given 15 sec
                jam_rotation <=1;
                jam_counter <= 0;
            end
            else begin
                jam_counter <= jam_counter + 1;
                jam_rotation <= 0;
                jam_start <= 0;
            end
        end 
        end
    end
    
endmodule