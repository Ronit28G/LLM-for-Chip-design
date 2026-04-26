module mux16_1(input [3:0] sel, input [15:0] in, output reg out);
    // Declare intermediate wires for the outputs of the two 8-to-1 multiplexers
    wire w_mux8_0; // Output of the first 8-to-1 mux (for in[0] to in[7])
    wire w_mux8_1; // Output of the second 8-to-1 mux (for in[8] to in[15])
    wire final_mux2_out; // Output of the final 2-to-1 multiplexer

    // First stage: two 8-to-1 multiplexers
    // u0 selects from in[0] to in[7] based on sel[2:0]
    mux8_1 u0 (
        .sel(sel[2:0]),     // Use the lower three bits of sel for 8-to-1 selection
        .in(in[7:0]),       // Connect the first eight inputs
        .out(w_mux8_0)      // Output to intermediate wire
    );

    // u1 selects from in[8] to in[15] based on sel[2:0]
    mux8_1 u1 (
        .sel(sel[2:0]),     // Use the lower three bits of sel for 8-to-1 selection
        .in(in[15:8]),      // Connect the next eight inputs
        .out(w_mux8_1)      // Output to intermediate wire
    );

    // Second stage: one 2-to-1 multiplexer
    // u2 selects between the outputs of the first stage based on sel[3]
    mux2_1 u2 (
        .in1(w_mux8_0),     // Input 1 (output from the first 8-to-1 mux)
        .in2(w_mux8_1),     // Input 2 (output from the second 8-to-1 mux)
        .select(sel[3]),    // The most significant bit determines which 8-to-1 output to select
        .out(final_mux2_out) // Output to intermediate wire
    );

    // Assign the combinatorial output to the 'reg' output port
    always @* begin
        out = final_mux2_out;
    end

endmodule
