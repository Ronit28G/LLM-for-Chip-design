module mux64_1(input [5:0] sel, input [63:0] in, output reg out);
    // Declare intermediate wires for the outputs of the two 32-to-1 multiplexers
    wire w_mux32_0; // Output of the first 32-to-1 mux (for in[0] to in[31])
    wire w_mux32_1; // Output of the second 32-to-1 mux (for in[32] to in[63])
    wire final_mux2_out; // Output of the final 2-to-1 multiplexer

    // First stage: two 32-to-1 multiplexers
    // u0 selects from in[0] to in[31] based on sel[4:0]
    mux32_1 u0 (
        .sel(sel[4:0]),     // Use the lower five bits of sel for 32-to-1 selection
        .in(in[31:0]),      // Connect the first thirty-two inputs
        .out(w_mux32_0)     // Output to intermediate wire
    );

    // u1 selects from in[32] to in[63] based on sel[4:0]
    mux32_1 u1 (
        .sel(sel[4:0]),     // Use the lower five bits of sel for 32-to-1 selection
        .in(in[63:32]),     // Connect the next thirty-two inputs
        .out(w_mux32_1)     // Output to intermediate wire
    );

    // Second stage: one 2-to-1 multiplexer
    // u2 selects between the outputs of the first stage based on sel[5]
    mux2_1 u2 (
        .in1(w_mux32_0),    // Input 1 (output from the first 32-to-1 mux)
        .in2(w_mux32_1),    // Input 2 (output from the second 32-to-1 mux)
        .select(sel[5]),    // The most significant bit determines which 32-to-1 output to select
        .out(final_mux2_out) // Output to intermediate wire
    );

    // Assign the combinatorial output to the 'reg' output port
    always @* begin
        out = final_mux2_out;
    end

endmodule
