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
