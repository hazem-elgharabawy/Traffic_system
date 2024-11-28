module norm_op_unit (
    input [1:0] traffic_light,
    output reg  allow_0_norm,
    output reg  allow_1_norm,
    output reg  allow_2_norm,
    output reg  allow_3_norm,
);
    
    always @(*) begin

        case (traffic_light)
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
endmodule