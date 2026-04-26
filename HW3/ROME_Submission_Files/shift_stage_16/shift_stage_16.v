module shift_stage_16(input wire [31:0] in, input wire sel, output wire [31:0] out);
  assign out = sel ? {in[15:0], in[31:16]} : in;
endmodule
