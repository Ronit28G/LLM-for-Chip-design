module control_unit(
    input wire clk,
    input wire rst,
    input wire start,
    output reg en,
    output reg done,
    output reg load_inputs,
    output reg capture_outputs,
    output reg [3:0] cycle_count
);

    // State definitions
    localparam IDLE = 2'b00;
    localparam LOAD = 2'b01;
    localparam COMPUTE = 2'b10;
    localparam CAPTURE = 2'b11;

    reg [1:0] state, next_state;

    // State register
    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // Cycle counter
    always @(posedge clk) begin
        if (rst) begin
            cycle_count <= 4'd0;
        end else if (state == IDLE || state == LOAD) begin
            cycle_count <= 4'd0;
        end else if (state == COMPUTE) begin
            cycle_count <= cycle_count + 4'd1;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: begin
                if (start)
                    next_state = LOAD;
                else
                    next_state = IDLE;
            end
            LOAD: begin
                next_state = COMPUTE;
            end
            COMPUTE: begin
                if (cycle_count >= 4'd7)
                    next_state = CAPTURE;
                else
                    next_state = COMPUTE;
            end
            CAPTURE: begin
                next_state = IDLE;
            end
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(*) begin
        en = 1'b0;
        done = 1'b0;
        load_inputs = 1'b0;
        capture_outputs = 1'b0;

        case (state)
            IDLE: begin
                en = 1'b0;
                done = 1'b0;
                load_inputs = 1'b0;
                capture_outputs = 1'b0;
            end
            LOAD: begin
                load_inputs = 1'b1;
                en = 1'b1;
            end
            COMPUTE: begin
                en = 1'b1;
            end
            CAPTURE: begin
                capture_outputs = 1'b1;
                done = 1'b1;
            end
        endcase
    end

endmodule
