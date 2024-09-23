module vedic_32x32_tb;
    reg [31:0] a, b;
    wire [63:0] product;

    vedic_32x32 uut (
        .a(a),
        .b(b),
        .product(product)
    );

    initial begin
        $monitor("Time: %0t | a = %h | b = %h | product = %h", $time, a, b, product);

        // Test 1
        a = 32'h00000002;
        b = 32'h00000003;
        #10;

        // Test 2
        a = 32'hFFFFFFFF;
        b = 32'h00000001;
        #10;

        // Test 3
        a = 32'h12345678;
        b = 32'h87654321;
        #10;

        // Test 4
        a = 32'hABCDEF01;
        b = 32'h01020304;
        #10;

        // Stop the simulation
        $stop;
    end
endmodule
