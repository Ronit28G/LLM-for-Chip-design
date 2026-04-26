module shift_stage_2(input wire [31:0] in, input wire sel, output wire [31:0] out);
  assign out = sel ? {in[29:0], in[31:30]} : in;
endmodule
