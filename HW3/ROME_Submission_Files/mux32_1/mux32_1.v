module mux32_1(input [4:0] sel, input [31:0] in, output reg out);
    // Declare intermediate wires for the outputs of the two 16-to-1 multiplexers
    wire w_mux16_0; // Output of the first 16-to-1 mux (for in[0] to in[15])
    wire w_mux16_1; // Output of the second 16-to-1 mux (for in[16] to in[31])
    wire final_mux2_out; // Output of the final 2-to-1 multiplexer

    // First stage: two 16-to-1 multiplexers
    // u0 selects from in[0] to in[15] based on sel[3:0]
    mux16_1 u0 (
        .sel(sel[3:0]),     // Use the lower four bits of sel for 16-to-1 selection
        .in(in[15:0]),      // Connect the first sixteen inputs
        .out(w_mux16_0)     // Output to intermediate wire
    );

    // u1 selects from in[16] to in[31] based on sel[3:0]
    mux16_1 u1 (
        .sel(sel[3:0]),     // Use the lower four bits of sel for 16-to-1 selection
        .in(in[31:16]),     // Connect the next sixteen inputs
        .out(w_mux16_1)     // Output to intermediate wire
    );

    // Second stage: one 2-to-1 multiplexer
    // u2 selects between the outputs of the first stage based on sel[4]
    mux2_1 u2 (
        .in1(w_mux16_0),    // Input 1 (output from the first 16-to-1 mux)
        .in2(w_mux16_1),    // Input 2 (output from the second 16-to-1 mux)
        .select(sel[4]),    // The most significant bit determines which 16-to-1 output to select
        .out(final_mux2_out) // Output to intermediate wire
    );

    // Assign the combinatorial output to the 'reg' output port
    always @* begin
        out = final_mux2_out;
    end

endmodule
