module shift_stage_1(input wire [31:0] in, input wire sel, output wire [31:0] out);
  assign out = sel ? {in[30:0], 1'b0} : in;
endmodule
