module tb_binary_to_bcd_converter;

    // Testbench Signals
    reg [4:0] binary_input;
    wire [7:0] bcd_output;

    // Instantiate the module under test
    binary_to_bcd_converter uut (
        .binary_input(binary_input),
        .bcd_output(bcd_output)
    );

    initial begin
        // Test Patterns
        // Corner cases, boundary values, typical and edge cases, as well as random values

        // Test 1: Minimum input value
        binary_input = 5'b00000; // Expect BCD 00
        #10;
        $display("Test 1: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test 2: Maximum input value
        binary_input = 5'b11111; // Expect BCD 31
        #10;
        $display("Test 2: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test 3: Boundary value just below mid-range
        binary_input = 5'b01111; // Expect BCD 15
        #10;
        $display("Test 3: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test 4: Boundary value just above mid-range
        binary_input = 5'b10000; // Expect BCD 16
        #10;
        $display("Test 4: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test 5: Typical use case
        binary_input = 5'b01010; // Expect BCD 10
        #10;
        $display("Test 5: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test 6: Edge case where binary value is equal to 5
        binary_input = 5'b00101; // Expect BCD 05
        #10;
        $display("Test 6: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test 7: Random value 1
        binary_input = 5'b00111; // Expect BCD 07
        #10;
        $display("Test 7: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test 8: Random value 2
        binary_input = 5'b01001; // Expect BCD 09
        #10;
        $display("Test 8: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test 9: Random value 3
        binary_input = 5'b01100; // Expect BCD 12
        #10;
        $display("Test 9: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test 10: Random value 4
        binary_input = 5'b10101; // Expect BCD 21
        #10;
        $display("Test 10: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        $finish;
    end

endmodule