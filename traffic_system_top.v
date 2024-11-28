module traffic_system_top (
    input clk,
    input rst_n,
    input jam_sensor_0;
    input jam_sensor_1;
    input jam_sensor_2;
    input jam_sensor_3;
    output reg allow_0;
    output reg allow_1;
    output reg allow_2;
    output reg allow_3;
);
    
    wire allow_0_norm, allow_1_norm, allow_2_norm, allow_3_norm;
    wire allow_0_jam, allow_1_jam, allow_2_jam, allow_3_jam;
    wire norm_op_en, jam_op_en, norm_counter_en, jam_counter_en;
    wire current_road_norm, current_road_jam;
    wire jam_start, jam_rotation;

    ctrl_unit control (
        .clk(clk),
        .rst_n(rst_n),
        
        .jam_sensor_0(jam_sensor_0),
        .jam_sensor_1(jam_sensor_1),
        .jam_sensor_2(jam_sensor_2),
        .jam_sensor_3(jam_sensor_3),
        
        .allow_0(allow_0),
        .allow_1(allow_1),
        .allow_2(allow_2),
        .allow_3(allow_3)
        
        .allow_0_norm(allow_0_norm),
        .allow_1_norm(allow_1_norm),
        .allow_2_norm(allow_2_norm),
        .allow_3_norm(allow_3_norm),
        
        .allow_0_jam(allow_0_jam),
        .allow_1_jam(allow_1_jam),
        .allow_2_jam(allow_2_jam),
        .allow_3_jam(allow_3_jam),
        
        .norm_op_en(norm_op_en),
        .jam_op_en(jam_op_en),
        .norm_counter_en(norm_counter_en),
        .jam_counter_en(jam_counter_en)
        );

    norm_op_unit normal_operation (
        .current_road_norm(current_road_norm),
        .allow_0_norm(allow_0_norm),
        .allow_1_norm(allow_1_norm),
        .allow_2_norm(allow_2_norm),
        .allow_3_norm(allow_3_norm)
        );

    jam_op_unit jam_operation (
        .clk(clk),
        .rst_n(rst_n),
        .jam_sensor_0(jam_sensor_0),
        .jam_sensor_1(jam_sensor_1),
        .jam_sensor_2(jam_sensor_2),
        .jam_sensor_3(jam_sensor_3),
        .jam_op_en(jam_op_en),
        .jam_rotation(jam_rotation),
        .jam_start(jam_start),
        .allow_0_jam(allow_0_jam),
        .allow_1_jam(allow_1_jam),
        .allow_2_jam(allow_2_jam),
        .allow_3_jam(allow_3_jam)
        );

    norm_counter normal_operation_counter (
        .clk(clk),
        .rst_n(rst_n),
        .norm_counter_en(norm_counter_en),
        .current_road_norm(current_road_norm)
        );
    
    jam_counter jam_operation_counter (
        .clk(clk),
        .rst_n(rst_n),
        .jam_counter_en(jam_counter_en),
        .jam_start(jam_start),
        .jam_rotation(jam_rotation)
        );


endmodule