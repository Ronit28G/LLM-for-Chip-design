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
