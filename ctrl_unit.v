module ctrl_unit (
    
    // top input
    input clk,
    input rst_n,
    input traffic_jam_0;
    input traffic_jam_1;
    input traffic_jam_2;
    input traffic_jam_3;
    // top output
    output reg allow_0; 
    output reg allow_1; 
    output reg allow_2; 
    output reg allow_3; 
 
    //ctrl input
    input allow_0_norm;
    input allow_1_norm;
    input allow_2_norm;
    input allow_3_norm;
    input allow_0_jam;
    input allow_1_jam;
    input allow_2_jam;
    input allow_3_jam;

    //ctrl output
    output reg norm_op_en;
    output reg jam_op_en;
    output reg norm_counter_en;
    output reg jam_counter_en;
);

    reg [1:0] current_state;
    reg [1:0] next_state;

    parameter IDLE = 0;
    parameter NORMAL = 1;
    parameter JAM = 2;

    wire there_is_a_jam;
    assign there_is_a_jam = traffic_jam_0 | traffic_jam_1 | traffic_jam_2 | traffic_jam_3;


    // state transition
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= IDLE; 
        end
        else begin
            current_state <= next_state;
        end
    end

    // next state logic 
    always @(*) begin
        case (current_state)
            IDLE:begin
                if (there_is_a_jam) begin
                    next_state = JAM;
                end
                else begin
                    next_state = NORMAL;
                end
            end 
            NORMAL:begin
                if (there_is_a_jam) begin
                    next_state = JAM;
                end
                else begin
                    next_state = NORMAL;
                end
            end
            JAM: begin
                if (there_is_a_jam) begin
                    next_state = JAM;
                end
                else begin
                    next_state = NORMAL;
                end
            end
            default:begin
                next_state = IDLE;
            end 
        endcase
    end

    // output logic
    always @(*) begin
        case (current_state)
            IDLE: begin
                allow_0 = 0;
                allow_1 = 0;
                allow_2 = 0;
                allow_3 = 0;
                norm_op_en = 0;
                jam_op_en = 0;
                norm_counter_en = 0;
                jam_counter_en = 0;
            end 
            NORMAL: begin
                allow_0 = allow_0_norm;
                allow_1 = allow_1_norm;
                allow_2 = allow_2_norm;
                allow_3 = allow_3_norm;
                norm_op_en = 1;
                jam_op_en = 0;
                norm_counter_en = 1;
                jam_counter_en = 0;
            end
            JAM: begin
                allow_0 = allow_0_jam;
                allow_1 = allow_1_jam;
                allow_2 = allow_2_jam;
                allow_3 = allow_3_jam;
                norm_op_en = 0;
                jam_op_en = 1;
                norm_counter_en = 0;
                jam_counter_en = 1;
            end
            default: begin
                allow_0 = 0;
                allow_1 = 0;
                allow_2 = 0;
                allow_3 = 0;
                norm_op_en = 0;
                jam_op_en = 0;
                norm_counter_en = 0;
                jam_counter_en = 0;
            end 
        endcase
    end





endmodule