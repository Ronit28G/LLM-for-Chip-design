module shift_stage_8(input wire [31:0] in, input wire sel, output wire [31:0] out);
  assign out = sel ? {in[23:0], in[31:24]} : in;
endmodule
