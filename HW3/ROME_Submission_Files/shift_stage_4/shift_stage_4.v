module shift_stage_4(input wire [31:0] in, input wire sel, output wire [31:0] out);
  assign out = sel ? {in[27:0], in[31:28]} : in;
endmodule
