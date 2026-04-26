module testbench;
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    wire carry;
    integer passed_tests = 0;
    integer failed_tests = 0;

    // Instantiate the 4-bit adder module
    adder4bit uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        // Test Case 1: Corner Case - Minimum Inputs
        a = 4'b0000; b = 4'b0000;
        #10 $display("Test 1: a=%b, b=%b", a, b);
        #10;
        if (sum === 4'b0000 && carry === 1'b0) begin
            $display("Test 1 sum ✓: %b (Expected: 0000), carry ✓: %b (Expected: 0)", sum, carry);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 1 sum ✗: %b (Expected: 0000), carry ✗: %b (Expected: 0)", sum, carry);
            failed_tests = failed_tests + 1;
        end

        // Test Case 2: Corner Case - Maximum Inputs Without Carry
        a = 4'b0111; b = 4'b0111;
        #10 $display("Test 2: a=%b, b=%b", a, b);
        #10;
        if (sum === 4'b1110 && carry === 1'b0) begin
            $display("Test 2 sum ✓: %b (Expected: 1110), carry ✓: %b (Expected: 0)", sum, carry);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 2 sum ✗: %b (Expected: 1110), carry ✗: %b (Expected: 0)", sum, carry);
            failed_tests = failed_tests + 1;
        end

        // Test Case 3: Corner Case - Maximum Inputs With Carry
        a = 4'b1111; b = 4'b1111;
        #10 $display("Test 3: a=%b, b=%b", a, b);
        #10;
        if (sum === 4'b1110 && carry === 1'b1) begin
            $display("Test 3 sum ✓: %b (Expected: 1110), carry ✓: %b (Expected: 1)", sum, carry);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 3 sum ✗: %b (Expected: 1110), carry ✗: %b (Expected: 1)", sum, carry);
            failed_tests = failed_tests + 1;
        end

        // Test Case 4: Boundary Value - Carry Transition
        a = 4'b1000; b = 4'b1000;
        #10 $display("Test 4: a=%b, b=%b", a, b);
        #10;
        if (sum === 4'b0000 && carry === 1'b1) begin
            $display("Test 4 sum ✓: %b (Expected: 0000), carry ✓: %b (Expected: 1)", sum, carry);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 4 sum ✗: %b (Expected: 0000), carry ✗: %b (Expected: 1)", sum, carry);
            failed_tests = failed_tests + 1;
        end

        // Test Case 5: Boundary Value - Near Maximum
        a = 4'b1110; b = 4'b0001;
        #10 $display("Test 5: a=%b, b=%b", a, b);
        #10;
        if (sum === 4'b1111 && carry === 1'b0) begin
            $display("Test 5 sum ✓: %b (Expected: 1111), carry ✓: %b (Expected: 0)", sum, carry);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 5 sum ✗: %b (Expected: 1111), carry ✗: %b (Expected: 0)", sum, carry);
            failed_tests = failed_tests + 1;
        end

        // Test Case 6: Typical Use Case - Random Mid-Range
        a = 4'b0101; b = 4'b0011;
        #10 $display("Test 6: a=%b, b=%b", a, b);
        #10;
        if (sum === 4'b1000 && carry === 1'b0) begin
            $display("Test 6 sum ✓: %b (Expected: 1000), carry ✓: %b (Expected: 0)", sum, carry);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 6 sum ✗: %b (Expected: 1000), carry ✗: %b (Expected: 0)", sum, carry);
            failed_tests = failed_tests + 1;
        end

        // Test Case 7: Typical Use Case - Equal Inputs
        a = 4'b1010; b = 4'b1010;
        #10 $display("Test 7: a=%b, b=%b", a, b);
        #10;
        if (sum === 4'b0100 && carry === 1'b1) begin
            $display("Test 7 sum ✓: %b (Expected: 0100), carry ✓: %b (Expected: 1)", sum, carry);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 7 sum ✗: %b (Expected: 0100), carry ✗: %b (Expected: 1)", sum, carry);
            failed_tests = failed_tests + 1;
        end

        // Test Case 8: Edge Case - One Input Zero
        a = 4'b0000; b = 4'b1111;
        #10 $display("Test 8: a=%b, b=%b", a, b);
        #10;
        if (sum === 4'b1111 && carry === 1'b0) begin
            $display("Test 8 sum ✓: %b (Expected: 1111), carry ✓: %b (Expected: 0)", sum, carry);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 8 sum ✗: %b (Expected: 1111), carry ✗: %b (Expected: 0)", sum, carry);
            failed_tests = failed_tests + 1;
        end

        // Test Case 9: Edge Case - One Input Maximum
        a = 4'b1111; b = 4'b0000;
        #10 $display("Test 9: a=%b, b=%b", a, b);
        #10;
        if (sum === 4'b1111 && carry === 1'b0) begin
            $display("Test 9 sum ✓: %b (Expected: 1111), carry ✓: %b (Expected: 0)", sum, carry);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 9 sum ✗: %b (Expected: 1111), carry ✗: %b (Expected: 0)", sum, carry);
            failed_tests = failed_tests + 1;
        end

        // Test Case 10: Random Value Test
        a = 4'b1100; b = 4'b0110;
        #10 $display("Test 10: a=%b, b=%b", a, b);
        #10;
        if (sum === 4'b0010 && carry === 1'b1) begin
            $display("Test 10 sum ✓: %b (Expected: 0010), carry ✓: %b (Expected: 1)", sum, carry);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 10 sum ✗: %b (Expected: 0010), carry ✗: %b (Expected: 1)", sum, carry);
            failed_tests = failed_tests + 1;
        end

        // Test Case 11: Random Value Test
        a = 4'b0011; b = 4'b1101;
        #10 $display("Test 11: a=%b, b=%b", a, b);
        #10;
        if (sum === 4'b0000 && carry === 1'b1) begin
            $display("Test 11 sum ✓: %b (Expected: 0000), carry ✓: %b (Expected: 1)", sum, carry);
            passed_tests = passed_tests + 1;
        end else begin
            $display("Test 11 sum ✗: %b (Expected: 0000), carry ✗: %b (Expected: 1)", sum, carry);
            failed_tests = failed_tests + 1;
        end

        // Test Summary
        $display("Total tests run: 11");
        $display("Tests passed: %d", passed_tests);
        $display("Tests failed: %d", failed_tests);

        #10 $finish;
    end
endmodule