module pe(
    input wire clk,
    input wire rst,
    input wire en,
    input wire [15:0] a_in,
    input wire [15:0] b_in,
    output reg [15:0] a_out,
    output reg [15:0] b_out,
    output reg [31:0] psum_out
);

    always @(posedge clk) begin
        if (rst) begin
            a_out <= 16'd0;
            b_out <= 16'd0;
            psum_out <= 32'd0;
        end else if (en) begin
            a_out <= a_in;
            b_out <= b_in;
            psum_out <= psum_out + (a_in * b_in);
        end
    end

endmodule
module systolic_core_4x4(
    input wire clk,
    input wire rst,
    input wire en,
    input wire [15:0] a0_in,
    input wire [15:0] a1_in,
    input wire [15:0] a2_in,
    input wire [15:0] a3_in,
    input wire [15:0] b0_in,
    input wire [15:0] b1_in,
    input wire [15:0] b2_in,
    input wire [15:0] b3_in,
    output wire [31:0] c00,
    output wire [31:0] c01,
    output wire [31:0] c02,
    output wire [31:0] c03,
    output wire [31:0] c10,
    output wire [31:0] c11,
    output wire [31:0] c12,
    output wire [31:0] c13,
    output wire [31:0] c20,
    output wire [31:0] c21,
    output wire [31:0] c22,
    output wire [31:0] c23,
    output wire [31:0] c30,
    output wire [31:0] c31,
    output wire [31:0] c32,
    output wire [31:0] c33
);

    // Internal wires for connecting PEs
    wire [15:0] a_wire [0:3][0:4];
    wire [15:0] b_wire [0:4][0:3];

    // Assign inputs to wire array
    assign a_wire[0][0] = a0_in;
    assign a_wire[1][0] = a1_in;
    assign a_wire[2][0] = a2_in;
    assign a_wire[3][0] = a3_in;

    assign b_wire[0][0] = b0_in;
    assign b_wire[0][1] = b1_in;
    assign b_wire[0][2] = b2_in;
    assign b_wire[0][3] = b3_in;

    // Instantiate 4x4 grid of PEs
    pe pe00(.clk(clk), .rst(rst), .en(en), .a_in(a_wire[0][0]), .b_in(b_wire[0][0]), .a_out(a_wire[0][1]), .b_out(b_wire[1][0]), .psum_out(c00));
    pe pe01(.clk(clk), .rst(rst), .en(en), .a_in(a_wire[0][1]), .b_in(b_wire[0][1]), .a_out(a_wire[0][2]), .b_out(b_wire[1][1]), .psum_out(c01));
    pe pe02(.clk(clk), .rst(rst), .en(en), .a_in(a_wire[0][2]), .b_in(b_wire[0][2]), .a_out(a_wire[0][3]), .b_out(b_wire[1][2]), .psum_out(c02));
    pe pe03(.clk(clk), .rst(rst), .en(en), .a_in(a_wire[0][3]), .b_in(b_wire[0][3]), .a_out(a_wire[0][4]), .b_out(b_wire[1][3]), .psum_out(c03));

    pe pe10(.clk(clk), .rst(rst), .en(en), .a_in(a_wire[1][0]), .b_in(b_wire[1][0]), .a_out(a_wire[1][1]), .b_out(b_wire[2][0]), .psum_out(c10));
    pe pe11(.clk(clk), .rst(rst), .en(en), .a_in(a_wire[1][1]), .b_in(b_wire[1][1]), .a_out(a_wire[1][2]), .b_out(b_wire[2][1]), .psum_out(c11));
    pe pe12(.clk(clk), .rst(rst), .en(en), .a_in(a_wire[1][2]), .b_in(b_wire[1][2]), .a_out(a_wire[1][3]), .b_out(b_wire[2][2]), .psum_out(c12));
    pe pe13(.clk(clk), .rst(rst), .en(en), .a_in(a_wire[1][3]), .b_in(b_wire[1][3]), .a_out(a_wire[1][4]), .b_out(b_wire[2][3]), .psum_out(c13));

    pe pe20(.clk(clk), .rst(rst), .en(en), .a_in(a_wire[2][0]), .b_in(b_wire[2][0]), .a_out(a_wire[2][1]), .b_out(b_wire[3][0]), .psum_out(c20));
    pe pe21(.clk(clk), .rst(rst), .en(en), .a_in(a_wire[2][1]), .b_in(b_wire[2][1]), .a_out(a_wire[2][2]), .b_out(b_wire[3][1]), .psum_out(c21));
    pe pe22(.clk(clk), .rst(rst), .en(en), .a_in(a_wire[2][2]), .b_in(b_wire[2][2]), .a_out(a_wire[2][3]), .b_out(b_wire[3][2]), .psum_out(c22));
    pe pe23(.clk(clk), .rst(rst), .en(en), .a_in(a_wire[2][3]), .b_in(b_wire[2][3]), .a_out(a_wire[2][4]), .b_out(b_wire[3][3]), .psum_out(c23));

    pe pe30(.clk(clk), .rst(rst), .en(en), .a_in(a_wire[3][0]), .b_in(b_wire[3][0]), .a_out(a_wire[3][1]), .b_out(b_wire[4][0]), .psum_out(c30));
    pe pe31(.clk(clk), .rst(rst), .en(en), .a_in(a_wire[3][1]), .b_in(b_wire[3][1]), .a_out(a_wire[3][2]), .b_out(b_wire[4][1]), .psum_out(c31));
    pe pe32(.clk(clk), .rst(rst), .en(en), .a_in(a_wire[3][2]), .b_in(b_wire[3][2]), .a_out(a_wire[3][3]), .b_out(b_wire[4][2]), .psum_out(c32));
    pe pe33(.clk(clk), .rst(rst), .en(en), .a_in(a_wire[3][3]), .b_in(b_wire[3][3]), .a_out(a_wire[3][4]), .b_out(b_wire[4][3]), .psum_out(c33));

endmodule
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
module input_buffer_a(
    input wire clk,
    input wire rst,
    input wire load,
    input wire [15:0] a00,
    input wire [15:0] a01,
    input wire [15:0] a02,
    input wire [15:0] a03,
    input wire [15:0] a10,
    input wire [15:0] a11,
    input wire [15:0] a12,
    input wire [15:0] a13,
    input wire [15:0] a20,
    input wire [15:0] a21,
    input wire [15:0] a22,
    input wire [15:0] a23,
    input wire [15:0] a30,
    input wire [15:0] a31,
    input wire [15:0] a32,
    input wire [15:0] a33,
    input wire en,
    output reg [15:0] a0_out,
    output reg [15:0] a1_out,
    output reg [15:0] a2_out,
    output reg [15:0] a3_out
);

    // Internal storage for matrix A (4x4)
    reg [15:0] matrix_a [0:3][0:3];
    
    // Column index for streaming
    reg [1:0] col_idx;

    // Load matrix and streaming logic
    always @(posedge clk) begin
        if (rst) begin
            // Clear outputs
            a0_out <= 16'd0;
            a1_out <= 16'd0;
            a2_out <= 16'd0;
            a3_out <= 16'd0;
            col_idx <= 2'd0;
            
            // Clear internal matrix
            matrix_a[0][0] <= 16'd0;
            matrix_a[0][1] <= 16'd0;
            matrix_a[0][2] <= 16'd0;
            matrix_a[0][3] <= 16'd0;
            matrix_a[1][0] <= 16'd0;
            matrix_a[1][1] <= 16'd0;
            matrix_a[1][2] <= 16'd0;
            matrix_a[1][3] <= 16'd0;
            matrix_a[2][0] <= 16'd0;
            matrix_a[2][1] <= 16'd0;
            matrix_a[2][2] <= 16'd0;
            matrix_a[2][3] <= 16'd0;
            matrix_a[3][0] <= 16'd0;
            matrix_a[3][1] <= 16'd0;
            matrix_a[3][2] <= 16'd0;
            matrix_a[3][3] <= 16'd0;
        end else if (load) begin
            // Load the matrix
            matrix_a[0][0] <= a00;
            matrix_a[0][1] <= a01;
            matrix_a[0][2] <= a02;
            matrix_a[0][3] <= a03;
            matrix_a[1][0] <= a10;
            matrix_a[1][1] <= a11;
            matrix_a[1][2] <= a12;
            matrix_a[1][3] <= a13;
            matrix_a[2][0] <= a20;
            matrix_a[2][1] <= a21;
            matrix_a[2][2] <= a22;
            matrix_a[2][3] <= a23;
            matrix_a[3][0] <= a30;
            matrix_a[3][1] <= a31;
            matrix_a[3][2] <= a32;
            matrix_a[3][3] <= a33;
            
            // Reset column index
            col_idx <= 2'd0;
        end else if (en) begin
            // Stream out column by column
            a0_out <= matrix_a[0][col_idx];
            a1_out <= matrix_a[1][col_idx];
            a2_out <= matrix_a[2][col_idx];
            a3_out <= matrix_a[3][col_idx];
            
            // Increment column index
            col_idx <= col_idx + 2'd1;
        end
    end

endmodule
module input_buffer_b(
    input wire clk,
    input wire rst,
    input wire load,
    input wire [15:0] b00,
    input wire [15:0] b01,
    input wire [15:0] b02,
    input wire [15:0] b03,
    input wire [15:0] b10,
    input wire [15:0] b11,
    input wire [15:0] b12,
    input wire [15:0] b13,
    input wire [15:0] b20,
    input wire [15:0] b21,
    input wire [15:0] b22,
    input wire [15:0] b23,
    input wire [15:0] b30,
    input wire [15:0] b31,
    input wire [15:0] b32,
    input wire [15:0] b33,
    input wire en,
    output reg [15:0] b0_out,
    output reg [15:0] b1_out,
    output reg [15:0] b2_out,
    output reg [15:0] b3_out
);

    // Internal storage for matrix B (4x4)
    reg [15:0] matrix_b [0:3][0:3];
    
    // Row index for streaming
    reg [1:0] row_idx;

    // Load matrix and streaming logic
    always @(posedge clk) begin
        if (rst) begin
            // Clear outputs
            b0_out <= 16'd0;
            b1_out <= 16'd0;
            b2_out <= 16'd0;
            b3_out <= 16'd0;
            row_idx <= 2'd0;
            
            // Clear internal matrix
            matrix_b[0][0] <= 16'd0;
            matrix_b[0][1] <= 16'd0;
            matrix_b[0][2] <= 16'd0;
            matrix_b[0][3] <= 16'd0;
            matrix_b[1][0] <= 16'd0;
            matrix_b[1][1] <= 16'd0;
            matrix_b[1][2] <= 16'd0;
            matrix_b[1][3] <= 16'd0;
            matrix_b[2][0] <= 16'd0;
            matrix_b[2][1] <= 16'd0;
            matrix_b[2][2] <= 16'd0;
            matrix_b[2][3] <= 16'd0;
            matrix_b[3][0] <= 16'd0;
            matrix_b[3][1] <= 16'd0;
            matrix_b[3][2] <= 16'd0;
            matrix_b[3][3] <= 16'd0;
        end else if (load) begin
            // Load the matrix
            matrix_b[0][0] <= b00;
            matrix_b[0][1] <= b01;
            matrix_b[0][2] <= b02;
            matrix_b[0][3] <= b03;
            matrix_b[1][0] <= b10;
            matrix_b[1][1] <= b11;
            matrix_b[1][2] <= b12;
            matrix_b[1][3] <= b13;
            matrix_b[2][0] <= b20;
            matrix_b[2][1] <= b21;
            matrix_b[2][2] <= b22;
            matrix_b[2][3] <= b23;
            matrix_b[3][0] <= b30;
            matrix_b[3][1] <= b31;
            matrix_b[3][2] <= b32;
            matrix_b[3][3] <= b33;
            
            // Reset row index
            row_idx <= 2'd0;
        end else if (en) begin
            // Stream out row by row
            b0_out <= matrix_b[row_idx][0];
            b1_out <= matrix_b[row_idx][1];
            b2_out <= matrix_b[row_idx][2];
            b3_out <= matrix_b[row_idx][3];
            
            // Increment row index
            row_idx <= row_idx + 2'd1;
        end
    end

endmodule
module output_buffer(
    input wire clk,
    input wire rst,
    input wire capture,
    input wire [31:0] c00_in,
    input wire [31:0] c01_in,
    input wire [31:0] c02_in,
    input wire [31:0] c03_in,
    input wire [31:0] c10_in,
    input wire [31:0] c11_in,
    input wire [31:0] c12_in,
    input wire [31:0] c13_in,
    input wire [31:0] c20_in,
    input wire [31:0] c21_in,
    input wire [31:0] c22_in,
    input wire [31:0] c23_in,
    input wire [31:0] c30_in,
    input wire [31:0] c31_in,
    input wire [31:0] c32_in,
    input wire [31:0] c33_in,
    output reg [31:0] c00_out,
    output reg [31:0] c01_out,
    output reg [31:0] c02_out,
    output reg [31:0] c03_out,
    output reg [31:0] c10_out,
    output reg [31:0] c11_out,
    output reg [31:0] c12_out,
    output reg [31:0] c13_out,
    output reg [31:0] c20_out,
    output reg [31:0] c21_out,
    output reg [31:0] c22_out,
    output reg [31:0] c23_out,
    output reg [31:0] c30_out,
    output reg [31:0] c31_out,
    output reg [31:0] c32_out,
    output reg [31:0] c33_out
);

    always @(posedge clk) begin
        if (rst) begin
            c00_out <= 32'd0;
            c01_out <= 32'd0;
            c02_out <= 32'd0;
            c03_out <= 32'd0;
            c10_out <= 32'd0;
            c11_out <= 32'd0;
            c12_out <= 32'd0;
            c13_out <= 32'd0;
            c20_out <= 32'd0;
            c21_out <= 32'd0;
            c22_out <= 32'd0;
            c23_out <= 32'd0;
            c30_out <= 32'd0;
            c31_out <= 32'd0;
            c32_out <= 32'd0;
            c33_out <= 32'd0;
        end else if (capture) begin
            c00_out <= c00_in;
            c01_out <= c01_in;
            c02_out <= c02_in;
            c03_out <= c03_in;
            c10_out <= c10_in;
            c11_out <= c11_in;
            c12_out <= c12_in;
            c13_out <= c13_in;
            c20_out <= c20_in;
            c21_out <= c21_in;
            c22_out <= c22_in;
            c23_out <= c23_in;
            c30_out <= c30_in;
            c31_out <= c31_in;
            c32_out <= c32_in;
            c33_out <= c33_in;
        end
    end

endmodule
