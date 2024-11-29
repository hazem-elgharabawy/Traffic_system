module traffic_system_tb ();
    
    reg clk;
    reg rst_n;
    reg jam_sensor_0;
    reg jam_sensor_1;
    reg jam_sensor_2;
    reg jam_sensor_3;
    
    wire allow_0;
    wire allow_1;
    wire allow_2;
    wire allow_3;

    integer correct_counter = 0;
    integer error_counter = 0;


    //DUT instantiation
    traffic_system_top instance_name (.*);



    // clock generation block
    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk; 
        end
    end


    // traffic light simulation
    initial begin
        init();
        check_reset;
        // check normal operation
        repeat (100) @(posedge clk);
        $stop;
    end


    //check reset
task check_reset (); begin
    rst_n= 0;
    @(negedge clk);
    if (allow_0 || allow_1 || allow_2 || allow_3) begin
        error_counter = error_counter + 1;
        $display("ERROR: reset functionality");
    end else begin
        correct_counter = correct_counter + 1 ;
    end 
    @(negedge clk);
    rst_n = 1;
    
end
    
endtask

task init(); begin
    jam_sensor_0 = 0;
    jam_sensor_1 = 0;
    jam_sensor_2 = 0;
    jam_sensor_3 = 0;
end
endtask


endmodule