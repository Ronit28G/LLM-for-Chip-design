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

    initial begin
        // Test pattern 1: A = 0000, B = 0000
        A = 4'b0000; B = 4'b0000;
        #10 $display("Test 1: A = %b, B = %b", A, B);

        // Test pattern 2: A = 0000, B = 0001
        A = 4'b0000; B = 4'b0001;
        #10 $display("Test 2: A = %b, B = %b", A, B);

        // Test pattern 3: A = 0001, B = 0000
        A = 4'b0001; B = 4'b0000;
        #10 $display("Test 3: A = %b, B = %b", A, B);

        // Test pattern 4: A = 1111, B = 1111
        A = 4'b1111; B = 4'b1111;
        #10 $display("Test 4: A = %b, B = %b", A, B);

        // Test pattern 5: A = 1111, B = 0111
        A = 4'b1111; B = 4'b0111;
        #10 $display("Test 5: A = %b, B = %b", A, B);

        // Test pattern 6: A = 0111, B = 1111
        A = 4'b0111; B = 4'b1111;
        #10 $display("Test 6: A = %b, B = %b", A, B);

        // Test pattern 7: A = 1000, B = 1000
        A = 4'b1000; B = 4'b1000;
        #10 $display("Test 7: A = %b, B = %b", A, B);

        // Test pattern 8: A = 1000, B = 0111
        A = 4'b1000; B = 4'b0111;
        #10 $display("Test 8: A = %b, B = %b", A, B);

        // Test pattern 9: A = 0111, B = 1000
        A = 4'b0111; B = 4'b1000;
        #10 $display("Test 9: A = %b, B = %b", A, B);

        // Test pattern 10: Random value test case
        A = 4'b1010; B = 4'b0101;
        #10 $display("Test 10: A = %b, B = %b", A, B);

        // Test pattern 11: Random value test case
        A = 4'b1100; B = 4'b0011;
        #10 $display("Test 11: A = %b, B = %b", A, B);

        // Finish simulation
        $finish;
    end

endmodule