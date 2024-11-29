vlib work
vlog -f source_files.list -mfcu
vsim -voptargs=+acc work.traffic_system_tb
add wave *
add wave -position insertpoint  \
sim:/traffic_system_tb/instance_name/jam_operation/clk \
sim:/traffic_system_tb/instance_name/jam_operation/rst_n \
sim:/traffic_system_tb/instance_name/jam_operation/jam_sensor_0 \
sim:/traffic_system_tb/instance_name/jam_operation/jam_sensor_1 \
sim:/traffic_system_tb/instance_name/jam_operation/jam_sensor_2 \
sim:/traffic_system_tb/instance_name/jam_operation/jam_sensor_3 \
sim:/traffic_system_tb/instance_name/jam_operation/jam_op_en \
sim:/traffic_system_tb/instance_name/jam_operation/jam_rotation \
sim:/traffic_system_tb/instance_name/jam_operation/jam_start \
sim:/traffic_system_tb/instance_name/jam_operation/allow_0_jam \
sim:/traffic_system_tb/instance_name/jam_operation/allow_1_jam \
sim:/traffic_system_tb/instance_name/jam_operation/allow_2_jam \
sim:/traffic_system_tb/instance_name/jam_operation/allow_3_jam \
sim:/traffic_system_tb/instance_name/jam_operation/current_road_jam
add wave -position insertpoint  \
sim:/traffic_system_tb/instance_name/jam_operation_counter/clk \
sim:/traffic_system_tb/instance_name/jam_operation_counter/rst_n \
sim:/traffic_system_tb/instance_name/jam_operation_counter/jam_counter_en \
sim:/traffic_system_tb/instance_name/jam_operation_counter/jam_start \
sim:/traffic_system_tb/instance_name/jam_operation_counter/jam_rotation \
sim:/traffic_system_tb/instance_name/jam_operation_counter/jam_counter \
sim:/traffic_system_tb/instance_name/jam_operation_counter/start


run -all