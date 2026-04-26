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
