module vedic_4x4(a, b, product);
    input [3:0] a, b;
    output [7:0] product;
    
    wire [3:0] p0, p1, p2, p3;
    wire [5:0] sum1, sum2;
    
    vedic_2x2 v0(a[1:0], b[1:0], p0); // 2x2 multiplication for lower bits
    vedic_2x2 v1(a[3:2], b[1:0], p1); // 2x2 multiplication for higher a, lower b
    vedic_2x2 v2(a[1:0], b[3:2], p2); // 2x2 multiplication for lower a, higher b
    vedic_2x2 v3(a[3:2], b[3:2], p3); // 2x2 multiplication for higher bits

    assign sum1 = {2'b00, p0[3:2]} + p1[3:0];
    assign sum2 = {2'b00, sum1[5:2]} + p2[3:0];
    
    assign product = {p3, sum2[3:0], p0[1:0]};
endmodule
