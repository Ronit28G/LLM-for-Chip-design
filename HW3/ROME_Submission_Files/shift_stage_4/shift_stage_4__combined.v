module shift_stage_1(input wire [31:0] in, input wire sel, output wire [31:0] out);
  assign out = sel ? {in[30:0], 1'b0} : in;
endmodule
module shift_stage_2(input wire [31:0] in, input wire sel, output wire [31:0] out);
  assign out = sel ? {in[29:0], in[31:30]} : in;
endmodule
module shift_stage_4(input wire [31:0] in, input wire sel, output wire [31:0] out);
  assign out = sel ? {in[27:0], in[31:28]} : in;
endmodule
