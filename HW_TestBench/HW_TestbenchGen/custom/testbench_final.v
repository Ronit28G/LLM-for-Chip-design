module testbench;
    // Declare signals
    reg [3:0] A, B;
    wire greater, equal, less;

    // Instantiate the module under test
    comparator4bit uut (
        .A(A),
        .B(B),
        .greater(greater),
        .equal(equal),
        .less(less)
    );

    integer passed_tests = 0;
    integer failed_tests = 0;

    initial begin
        // Test pattern 1: A = 0000, B = 0000
        A = 4'b0000; B = 4'b0000;
        #10 $display("Test 1: A = %b, B = %b", A, B);
        #10;
        if (greater === 0 && equal === 1 && less === 0) begin
            $display("Test 1: greater ✓, equal ✓, less ✓");
            passed_tests = passed_tests + 3;
        end else begin
            if (greater !== 0) $display("Test 1: greater ✗ (actual: %b, expected: 0)", greater);
            if (equal !== 1) $display("Test 1: equal ✗ (actual: %b, expected: 1)", equal);
            if (less !== 0) $display("Test 1: less ✗ (actual: %b, expected: 0)", less);
            failed_tests = failed_tests + (greater !== 0) + (equal !== 1) + (less !== 0);
        end

        // Test pattern 2: A = 0000, B = 0001
        A = 4'b0000; B = 4'b0001;
        #10 $display("Test 2: A = %b, B = %b", A, B);
        #10;
        if (greater === 0 && equal === 0 && less === 1) begin
            $display("Test 2: greater ✓, equal ✓, less ✓");
            passed_tests = passed_tests + 3;
        end else begin
            if (greater !== 0) $display("Test 2: greater ✗ (actual: %b, expected: 0)", greater);
            if (equal !== 0) $display("Test 2: equal ✗ (actual: %b, expected: 0)", equal);
            if (less !== 1) $display("Test 2: less ✗ (actual: %b, expected: 1)", less);
            failed_tests = failed_tests + (greater !== 0) + (equal !== 0) + (less !== 1);
        end

        // Test pattern 3: A = 0001, B = 0000
        A = 4'b0001; B = 4'b0000;
        #10 $display("Test 3: A = %b, B = %b", A, B);
        #10;
        if (greater === 1 && equal === 0 && less === 0) begin
            $display("Test 3: greater ✓, equal ✓, less ✓");
            passed_tests = passed_tests + 3;
        end else begin
            if (greater !== 1) $display("Test 3: greater ✗ (actual: %b, expected: 1)", greater);
            if (equal !== 0) $display("Test 3: equal ✗ (actual: %b, expected: 0)", equal);
            if (less !== 0) $display("Test 3: less ✗ (actual: %b, expected: 0)", less);
            failed_tests = failed_tests + (greater !== 1) + (equal !== 0) + (less !== 0);
        end

        // Test pattern 4: A = 1111, B = 1111
        A = 4'b1111; B = 4'b1111;
        #10 $display("Test 4: A = %b, B = %b", A, B);
        #10;
        if (greater === 0 && equal === 1 && less === 0) begin
            $display("Test 4: greater ✓, equal ✓, less ✓");
            passed_tests = passed_tests + 3;
        end else begin
            if (greater !== 0) $display("Test 4: greater ✗ (actual: %b, expected: 0)", greater);
            if (equal !== 1) $display("Test 4: equal ✗ (actual: %b, expected: 1)", equal);
            if (less !== 0) $display("Test 4: less ✗ (actual: %b, expected: 0)", less);
            failed_tests = failed_tests + (greater !== 0) + (equal !== 1) + (less !== 0);
        end

        // Test pattern 5: A = 1111, B = 0111
        A = 4'b1111; B = 4'b0111;
        #10 $display("Test 5: A = %b, B = %b", A, B);
        #10;
        if (greater === 1 && equal === 0 && less === 0) begin
            $display("Test 5: greater ✓, equal ✓, less ✓");
            passed_tests = passed_tests + 3;
        end else begin
            if (greater !== 1) $display("Test 5: greater ✗ (actual: %b, expected: 1)", greater);
            if (equal !== 0) $display("Test 5: equal ✗ (actual: %b, expected: 0)", equal);
            if (less !== 0) $display("Test 5: less ✗ (actual: %b, expected: 0)", less);
            failed_tests = failed_tests + (greater !== 1) + (equal !== 0) + (less !== 0);
        end

        // Test pattern 6: A = 0111, B = 1111
        A = 4'b0111; B = 4'b1111;
        #10 $display("Test 6: A = %b, B = %b", A, B);
        #10;
        if (greater === 0 && equal === 0 && less === 1) begin
            $display("Test 6: greater ✓, equal ✓, less ✓");
            passed_tests = passed_tests + 3;
        end else begin
            if (greater !== 0) $display("Test 6: greater ✗ (actual: %b, expected: 0)", greater);
            if (equal !== 0) $display("Test 6: equal ✗ (actual: %b, expected: 0)", equal);
            if (less !== 1) $display("Test 6: less ✗ (actual: %b, expected: 1)", less);
            failed_tests = failed_tests + (greater !== 0) + (equal !== 0) + (less !== 1);
        end

        // Test pattern 7: A = 1000, B = 1000
        A = 4'b1000; B = 4'b1000;
        #10 $display("Test 7: A = %b, B = %b", A, B);
        #10;
        if (greater === 0 && equal === 1 && less === 0) begin
            $display("Test 7: greater ✓, equal ✓, less ✓");
            passed_tests = passed_tests + 3;
        end else begin
            if (greater !== 0) $display("Test 7: greater ✗ (actual: %b, expected: 0)", greater);
            if (equal !== 1) $display("Test 7: equal ✗ (actual: %b, expected: 1)", equal);
            if (less !== 0) $display("Test 7: less ✗ (actual: %b, expected: 0)", less);
            failed_tests = failed_tests + (greater !== 0) + (equal !== 1) + (less !== 0);
        end

        // Test pattern 8: A = 1000, B = 0111
        A = 4'b1000; B = 4'b0111;
        #10 $display("Test 8: A = %b, B = %b", A, B);
        #10;
        if (greater === 1 && equal === 0 && less === 0) begin
            $display("Test 8: greater ✓, equal ✓, less ✓");
            passed_tests = passed_tests + 3;
        end else begin
            if (greater !== 1) $display("Test 8: greater ✗ (actual: %b, expected: 1)", greater);
            if (equal !== 0) $display("Test 8: equal ✗ (actual: %b, expected: 0)", equal);
            if (less !== 0) $display("Test 8: less ✗ (actual: %b, expected: 0)", less);
            failed_tests = failed_tests + (greater !== 1) + (equal !== 0) + (less !== 0);
        end

        // Test pattern 9: A = 0111, B = 1000
        A = 4'b0111; B = 4'b1000;
        #10 $display("Test 9: A = %b, B = %b", A, B);
        #10;
        if (greater === 0 && equal === 0 && less === 1) begin
            $display("Test 9: greater ✓, equal ✓, less ✓");
            passed_tests = passed_tests + 3;
        end else begin
            if (greater !== 0) $display("Test 9: greater ✗ (actual: %b, expected: 0)", greater);
            if (equal !== 0) $display("Test 9: equal ✗ (actual: %b, expected: 0)", equal);
            if (less !== 1) $display("Test 9: less ✗ (actual: %b, expected: 1)", less);
            failed_tests = failed_tests + (greater !== 0) + (equal !== 0) + (less !== 1);
        end

        // Test pattern 10: Random value test case
        A = 4'b1010; B = 4'b0101;
        #10 $display("Test 10: A = %b, B = %b", A, B);
        #10;
        if (greater === 1 && equal === 0 && less === 0) begin
            $display("Test 10: greater ✓, equal ✓, less ✓");
            passed_tests = passed_tests + 3;
        end else begin
            if (greater !== 1) $display("Test 10: greater ✗ (actual: %b, expected: 1)", greater);
            if (equal !== 0) $display("Test 10: equal ✗ (actual: %b, expected: 0)", equal);
            if (less !== 0) $display("Test 10: less ✗ (actual: %b, expected: 0)", less);
            failed_tests = failed_tests + (greater !== 1) + (equal !== 0) + (less !== 0);
        end

        // Test pattern 11: Random value test case
        A = 4'b1100; B = 4'b0011;
        #10 $display("Test 11: A = %b, B = %b", A, B);
        #10;
        if (greater === 1 && equal === 0 && less === 0) begin
            $display("Test 11: greater ✓, equal ✓, less ✓");
            passed_tests = passed_tests + 3;
        end else begin
            if (greater !== 1) $display("Test 11: greater ✗ (actual: %b, expected: 1)", greater);
            if (equal !== 0) $display("Test 11: equal ✗ (actual: %b, expected: 0)", equal);
            if (less !== 0) $display("Test 11: less ✗ (actual: %b, expected: 0)", less);
            failed_tests = failed_tests + (greater !== 1) + (equal !== 0) + (less !== 0);
        end

        // Test summary
        $display("Test Summary:");
        $display("Total tests run: %d", passed_tests + failed_tests);
        $display("Passed: %d", passed_tests);
        $display("Failed: %d", failed_tests);

        // Finish simulation
        $finish;
    end

endmodule