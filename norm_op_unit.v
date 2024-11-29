module norm_op_unit (
    input norm_op_en,
    input [1:0] current_road_norm,
    output reg  allow_0_norm,
    output reg  allow_1_norm,
    output reg  allow_2_norm,
    output reg  allow_3_norm
);
    
    always @(*) begin
        if (norm_op_en) begin
            case (current_road_norm)
                0 : begin
                    allow_0_norm = 1;
                    allow_1_norm = 0;
                    allow_2_norm = 0;
                    allow_3_norm = 0;
                end
                1 : begin
                    allow_0_norm = 0;
                    allow_1_norm = 1;
                    allow_2_norm = 0;
                    allow_3_norm = 0;
                end
                2 : begin
                    allow_0_norm = 0;
                    allow_1_norm = 0;
                    allow_2_norm = 1;
                    allow_3_norm = 0;
                end
                3 : begin
                    allow_0_norm = 0;
                    allow_1_norm = 0;
                    allow_2_norm = 0;
                    allow_3_norm = 1;
                end 
                default: begin
                    allow_0_norm = 0;
                    allow_1_norm = 0;
                    allow_2_norm = 0;
                    allow_3_norm = 0;
                end
            endcase
        end
        else begin
                allow_0_norm = 0;
                allow_1_norm = 0;
                allow_2_norm = 0;
                allow_3_norm = 0;
        end
    end
endmodule