module mux2_1 (
    input in1,
    input in2,
    input select,
    output out
);

    assign out = select ? in2 : in1;

endmodule
