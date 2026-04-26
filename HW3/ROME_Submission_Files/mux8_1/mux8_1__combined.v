module mux2_1 (
    input in1,
    input in2,
    input select,
    output out
);

    assign out = select ? in2 : in1;

endmodule
module mux4_1(input [1:0] sel, input [3:0] in, output out);
    // Declare intermediate wires for the outputs of the first stage 2-to-1 multiplexers
    wire w0, w1;

    // First stage: two 2-to-1 multiplexers
    // u0 selects between in[0] and in[1] based on sel[0]
    mux2_1 u0 (
        .in1(in[0]),
        .in2(in[1]),
        .select(sel[0]),
        .out(w0)
    );

    // u1 selects between in[2] and in[3] based on sel[0]
    mux2_1 u1 (
        .in1(in[2]),
        .in2(in[3]),
        .select(sel[0]),
        .out(w1)
    );

    // Second stage: one 2-to-1 multiplexer
    // u2 selects between the outputs of the first stage (w0 and w1) based on sel[1]
    mux2_1 u2 (
        .in1(w0),
        .in2(w1),
        .select(sel[1]),
        .out(out) // Connects to the module's output port
    );

endmodule
module mux8_1(input [2:0] sel, input [7:0] in, output reg out);
    // Declare intermediate wires for the outputs of the two 4-to-1 multiplexers
    wire w_mux4_0; // Output of the first 4-to-1 mux (for in[0] to in[3])
    wire w_mux4_1; // Output of the second 4-to-1 mux (for in[4] to in[7])
    wire final_mux2_out; // Output of the final 2-to-1 multiplexer

    // First stage: two 4-to-1 multiplexers
    // u0 selects from in[0] to in[3] based on sel[1:0]
    mux4_1 u0 (
        .sel(sel[1:0]), // Use the lower two bits of sel for 4-to-1 selection
        .in(in[3:0]),   // Connect the first four inputs (in[0], in[1], in[2], in[3])
        .out(w_mux4_0)  // Output to intermediate wire w_mux4_0
    );

    // u1 selects from in[4] to in[7] based on sel[1:0]
    mux4_1 u1 (
        .sel(sel[1:0]), // Use the lower two bits of sel for 4-to-1 selection
        .in(in[7:4]),   // Connect the next four inputs (in[4], in[5], in[6], in[7])
        .out(w_mux4_1)  // Output to intermediate wire w_mux4_1
    );

    // Second stage: one 2-to-1 multiplexer
    // u2 selects between the outputs of the first stage (w_mux4_0 and w_mux4_1) based on sel[2]
    mux2_1 u2 (
        .in1(w_mux4_0),    // Input 1 of the 2-to-1 mux (output from the first 4-to-1 mux)
        .in2(w_mux4_1),    // Input 2 of the 2-to-1 mux (output from the second 4-to-1 mux)
        .select(sel[2]),   // The most significant bit of sel determines which 4-to-1 output to select
        .out(final_mux2_out) // Output to an intermediate wire
    );

    // Assign the combinatorial output to the 'reg' output port
    always @* begin
        out = final_mux2_out;
    end

endmodule
