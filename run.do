vlib work
vlog -f source_files.list -mfcu
vsim -voptargs=+acc work.traffic_system_tb
add wave *
add wave -position insertpoint  \
sim:/traffic_system_tb/instance_name/control/IDLE \
sim:/traffic_system_tb/instance_name/control/NORMAL \
sim:/traffic_system_tb/instance_name/control/JAM \
sim:/traffic_system_tb/instance_name/control/clk \
sim:/traffic_system_tb/instance_name/control/rst_n \
sim:/traffic_system_tb/instance_name/control/jam_sensor_0 \
sim:/traffic_system_tb/instance_name/control/jam_sensor_1 \
sim:/traffic_system_tb/instance_name/control/jam_sensor_2 \
sim:/traffic_system_tb/instance_name/control/jam_sensor_3 \
sim:/traffic_system_tb/instance_name/control/allow_0 \
sim:/traffic_system_tb/instance_name/control/allow_1 \
sim:/traffic_system_tb/instance_name/control/allow_2 \
sim:/traffic_system_tb/instance_name/control/allow_3 \
sim:/traffic_system_tb/instance_name/control/allow_0_norm \
sim:/traffic_system_tb/instance_name/control/allow_1_norm \
sim:/traffic_system_tb/instance_name/control/allow_2_norm \
sim:/traffic_system_tb/instance_name/control/allow_3_norm \
sim:/traffic_system_tb/instance_name/control/allow_0_jam \
sim:/traffic_system_tb/instance_name/control/allow_1_jam \
sim:/traffic_system_tb/instance_name/control/allow_2_jam \
sim:/traffic_system_tb/instance_name/control/allow_3_jam \
sim:/traffic_system_tb/instance_name/control/norm_op_en \
sim:/traffic_system_tb/instance_name/control/jam_op_en \
sim:/traffic_system_tb/instance_name/control/norm_counter_en \
sim:/traffic_system_tb/instance_name/control/jam_counter_en \
sim:/traffic_system_tb/instance_name/control/current_state \
sim:/traffic_system_tb/instance_name/control/next_state \
sim:/traffic_system_tb/instance_name/control/there_is_a_jam
add wave -position insertpoint  \
sim:/traffic_system_tb/instance_name/normal_operation_counter/clk \
sim:/traffic_system_tb/instance_name/normal_operation_counter/rst_n \
sim:/traffic_system_tb/instance_name/normal_operation_counter/norm_counter_en \
sim:/traffic_system_tb/instance_name/normal_operation_counter/current_road_norm \
sim:/traffic_system_tb/instance_name/normal_operation_counter/norm_counter
add wave -position insertpoint  \
sim:/traffic_system_tb/instance_name/normal_operation/norm_op_en \
sim:/traffic_system_tb/instance_name/normal_operation/current_road_norm \
sim:/traffic_system_tb/instance_name/normal_operation/allow_0_norm \
sim:/traffic_system_tb/instance_name/normal_operation/allow_1_norm \
sim:/traffic_system_tb/instance_name/normal_operation/allow_2_norm \
sim:/traffic_system_tb/instance_name/normal_operation/allow_3_norm



run -all