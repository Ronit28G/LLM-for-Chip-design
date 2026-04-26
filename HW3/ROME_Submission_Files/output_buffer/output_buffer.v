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
