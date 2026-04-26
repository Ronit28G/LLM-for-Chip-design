module tb_binary_to_bcd_converter;

    // Testbench Signals
    reg [4:0] binary_input;
    wire [7:0] bcd_output;

    // Instantiate the module under test
    binary_to_bcd_converter uut (
        .binary_input(binary_input),
        .bcd_output(bcd_output)
    );

    integer passed_tests;
    integer failed_tests;

    initial begin
        passed_tests = 0;
        failed_tests = 0;

        // Test 1: Minimum input value
        binary_input = 5'b00000; // Expect BCD 00
        #10;
        $display("Test 1: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        #10;
        if (bcd_output == 8'b00000000) begin
            $display("Test 1 Passed: ✓");
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 1 Failed: ✗ (Expected: 00000000, Got: %b)", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test 2: Maximum input value
        binary_input = 5'b11111; // Expect BCD 31
        #10;
        $display("Test 2: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        #10;
        if (bcd_output == 8'b00110001) begin
            $display("Test 2 Passed: ✓");
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 2 Failed: ✗ (Expected: 00110001, Got: %b)", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test 3: Boundary value just below mid-range
        binary_input = 5'b01111; // Expect BCD 15
        #10;
        $display("Test 3: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        #10;
        if (bcd_output == 8'b00010101) begin
            $display("Test 3 Passed: ✓");
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 3 Failed: ✗ (Expected: 00010101, Got: %b)", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test 4: Boundary value just above mid-range
        binary_input = 5'b10000; // Expect BCD 16
        #10;
        $display("Test 4: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        #10;
        if (bcd_output == 8'b00010110) begin
            $display("Test 4 Passed: ✓");
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 4 Failed: ✗ (Expected: 00010110, Got: %b)", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test 5: Typical use case
        binary_input = 5'b01010; // Expect BCD 10
        #10;
        $display("Test 5: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        #10;
        if (bcd_output == 8'b00010000) begin
            $display("Test 5 Passed: ✓");
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 5 Failed: ✗ (Expected: 00010000, Got: %b)", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test 6: Edge case where binary value is equal to 5
        binary_input = 5'b00101; // Expect BCD 05
        #10;
        $display("Test 6: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        #10;
        if (bcd_output == 8'b00000101) begin
            $display("Test 6 Passed: ✓");
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 6 Failed: ✗ (Expected: 00000101, Got: %b)", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test 7: Random value 1
        binary_input = 5'b00111; // Expect BCD 07
        #10;
        $display("Test 7: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        #10;
        if (bcd_output == 8'b00000111) begin
            $display("Test 7 Passed: ✓");
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 7 Failed: ✗ (Expected: 00000111, Got: %b)", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test 8: Random value 2
        binary_input = 5'b01001; // Expect BCD 09
        #10;
        $display("Test 8: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        #10;
        if (bcd_output == 8'b00001001) begin
            $display("Test 8 Passed: ✓");
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 8 Failed: ✗ (Expected: 00001001, Got: %b)", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test 9: Random value 3
        binary_input = 5'b01100; // Expect BCD 12
        #10;
        $display("Test 9: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        #10;
        if (bcd_output == 8'b00011000) begin
            $display("Test 9 Passed: ✓");
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 9 Failed: ✗ (Expected: 00011000, Got: %b)", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test 10: Random value 4
        binary_input = 5'b10101; // Expect BCD 21
        #10;
        $display("Test 10: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        #10;
        if (bcd_output == 8'b00100001) begin
            $display("Test 10 Passed: ✓");
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 10 Failed: ✗ (Expected: 00100001, Got: %b)", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test Summary
        $display("Test Summary: Total Tests = %0d, Passed = %0d, Failed = %0d", passed_tests + failed_tests, passed_tests, failed_tests);
        $finish;
    end

endmodule