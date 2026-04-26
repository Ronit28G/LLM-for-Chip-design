
module comparator4bit (
    input wire [3:0] A,
    input wire [3:0] B,
    output wire greater,
    output wire equal,
    output wire less
);
    assign greater = (A > B);
    assign equal   = (A == B); // CORRECT LOGIC
    assign less    = (A < B);
endmodule
