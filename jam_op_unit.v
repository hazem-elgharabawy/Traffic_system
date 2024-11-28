module jam_op_unit (
    input clk,
    input rst_n,
    
    input jam_sensor_0,
    input jam_sensor_1,
    input jam_sensor_2,
    input jam_sensor_3,
    
    input jam_op_en,
    input jam_rotation,
    input jam_start,
    
    output reg allow_0_jam,
    output reg allow_1_jam,
    output reg allow_2_jam,
    output reg allow_3_jam
);

    reg [1:0] current_road_jam ;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            allow_0_jam = 0;
            allow_1_jam = 0;
            allow_2_jam = 0;
            allow_3_jam = 0;
            current_road_jam = 2'b00;
        end
        else if (!jam_op_en) begin
            allow_0_jam = 0;
            allow_1_jam = 0;
            allow_2_jam = 0;
            allow_3_jam = 0;
            current_road_jam = 2'b00;
        end
        else if(jam_start) begin
            if (jam_sensor_0) begin
                allow_0_jam = 1;
                allow_1_jam = 0;
                allow_2_jam = 0;
                allow_3_jam = 0;
                current_road_jam = 2'b00;
            end 
            else if (jam_sensor_1) begin
                allow_0_jam = 0;
                allow_1_jam = 1;
                allow_2_jam = 0;
                allow_3_jam = 0;
                current_road_jam = 2'b01;
            end
            else if (jam_sensor_2) begin
                allow_0_jam = 0;
                allow_1_jam = 0;
                allow_2_jam = 1;
                allow_3_jam = 0;
                current_road_jam = 2'b10;
            end
            else if (jam_sensor_3) begin
                allow_0_jam = 0;
                allow_1_jam = 0;
                allow_2_jam = 0;
                allow_3_jam = 1;
                current_road_jam = 2'b11;
            end
        end
        else if (jam_rotation) begin
            case (current_road_jam)
                0:begin
                    if (jam_sensor_1) begin
                        allow_0_jam = 0;
                        allow_1_jam = 1;
                        allow_2_jam = 0;
                        allow_3_jam = 0;
                        current_road_jam = 2'b01;
                    end
                    else if (jam_sensor_2) begin
                        allow_0_jam = 0;
                        allow_1_jam = 0;
                        allow_2_jam = 1;
                        allow_3_jam = 0;
                        current_road_jam = 2'b10;
                    end
                    else if (jam_sensor_3) begin
                        allow_0_jam = 0;
                        allow_1_jam = 0;
                        allow_2_jam = 0;
                        allow_3_jam = 1;
                        current_road_jam = 2'b11;
                    end
                    else if (jam_sensor_0) begin
                        allow_0_jam = 1;
                        allow_1_jam = 0;
                        allow_2_jam = 0;
                        allow_3_jam = 0;
                        current_road_jam = 2'b00;
                    end 
                end 
                1:begin
                    if (jam_sensor_2) begin
                        allow_0_jam = 0;
                        allow_1_jam = 0;
                        allow_2_jam = 1;
                        allow_3_jam = 0;
                        current_road_jam = 2'b10;
                    end
                    else if (jam_sensor_3) begin
                        allow_0_jam = 0;
                        allow_1_jam = 0;
                        allow_2_jam = 0;
                        allow_3_jam = 1;
                        current_road_jam = 2'b11;
                    end
                    else if (jam_sensor_0) begin
                        allow_0_jam = 1;
                        allow_1_jam = 0;
                        allow_2_jam = 0;
                        allow_3_jam = 0;
                        current_road_jam = 2'b00;
                    end
                    else if (jam_sensor_1) begin
                        allow_0_jam = 0;
                        allow_1_jam = 1;
                        allow_2_jam = 0;
                        allow_3_jam = 0;
                        current_road_jam = 2'b01;
                    end 
                end
                2:begin
                    if (jam_sensor_3) begin
                        allow_0_jam = 0;
                        allow_1_jam = 0;
                        allow_2_jam = 0;
                        allow_3_jam = 1;
                        current_road_jam = 2'b11;
                    end
                    else if (jam_sensor_0) begin
                        allow_0_jam = 1;
                        allow_1_jam = 0;
                        allow_2_jam = 0;
                        allow_3_jam = 0;
                        current_road_jam = 2'b00;
                    end
                    else if (jam_sensor_1) begin
                        allow_0_jam = 0;
                        allow_1_jam = 1;
                        allow_2_jam = 0;
                        allow_3_jam = 0;
                        current_road_jam = 2'b01;
                    end
                    else if (jam_sensor_2) begin
                        allow_0_jam = 0;
                        allow_1_jam = 0;
                        allow_2_jam = 1;
                        allow_3_jam = 0;
                        current_road_jam = 2'b10;
                    end
                end
                3:begin
                    if (jam_sensor_0) begin
                        allow_0_jam = 1;
                        allow_1_jam = 0;
                        allow_2_jam = 0;
                        allow_3_jam = 0;
                        current_road_jam = 2'b00;
                    end 
                    else if (jam_sensor_1) begin
                        allow_0_jam = 0;
                        allow_1_jam = 1;
                        allow_2_jam = 0;
                        allow_3_jam = 0;
                        current_road_jam = 2'b01;
                    end
                    else if (jam_sensor_2) begin
                        allow_0_jam = 0;
                        allow_1_jam = 0;
                        allow_2_jam = 1;
                        allow_3_jam = 0;
                        current_road_jam = 2'b10;
                    end
                    else if (jam_sensor_3) begin
                        allow_0_jam = 0;
                        allow_1_jam = 0;
                        allow_2_jam = 0;
                        allow_3_jam = 1;
                        current_road_jam = 2'b11;
                    end
                end
                default: begin
                            if (jam_sensor_0) begin
                        allow_0_jam = 1;
                        allow_1_jam = 0;
                        allow_2_jam = 0;
                        allow_3_jam = 0;
                        current_road_jam = 2'b00;
                    end 
                    else if (jam_sensor_1) begin
                        allow_0_jam = 0;
                        allow_1_jam = 1;
                        allow_2_jam = 0;
                        allow_3_jam = 0;
                        current_road_jam = 2'b01;
                    end
                    else if (jam_sensor_2) begin
                        allow_0_jam = 0;
                        allow_1_jam = 0;
                        allow_2_jam = 1;
                        allow_3_jam = 0;
                        current_road_jam = 2'b10;
                    end
                    else if (jam_sensor_3) begin
                        allow_0_jam = 0;
                        allow_1_jam = 0;
                        allow_2_jam = 0;
                        allow_3_jam = 1;
                        current_road_jam = 2'b11;
                    end
                end 
            endcase
        end
    end
    
endmodule