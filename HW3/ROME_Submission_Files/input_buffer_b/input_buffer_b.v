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
