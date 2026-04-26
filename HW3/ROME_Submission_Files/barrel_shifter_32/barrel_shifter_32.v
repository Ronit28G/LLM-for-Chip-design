module barrel_shifter_32(input wire [31:0] inputData, input wire [4:0] shiftVal, output wire [31:0] outputData);
  wire [31:0] stage0_out;
  wire [31:0] stage1_out;
  wire [31:0] stage2_out;
  wire [31:0] stage3_out;
  
  assign stage0_out = shiftVal[0] ? {inputData[30:0], 1'b0} : inputData;
  assign stage1_out = shiftVal[1] ? {stage0_out[29:0], 2'b00} : stage0_out;
  assign stage2_out = shiftVal[2] ? {stage1_out[27:0], 4'b0000} : stage1_out;
  assign stage3_out = shiftVal[3] ? {stage2_out[23:0], 8'b00000000} : stage2_out;
  assign outputData = shiftVal[4] ? {stage3_out[15:0], 16'b0000000000000000} : stage3_out;
endmodule
