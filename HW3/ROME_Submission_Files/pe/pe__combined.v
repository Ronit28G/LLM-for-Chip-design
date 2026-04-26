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
