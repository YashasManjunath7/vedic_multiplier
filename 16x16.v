module vedic_16x16(a, b, product);
    input [15:0] a, b;
    output [31:0] product;

    wire [15:0] p0, p1, p2, p3;
    wire [23:0] sum1, sum2;

    vedic_4x4 v0(a[7:0], b[7:0], p0);  // Lower 8 bits
    vedic_4x4 v1(a[15:8], b[7:0], p1); // Upper A, lower B
    vedic_4x4 v2(a[7:0], b[15:8], p2); // Lower A, upper B
    vedic_4x4 v3(a[15:8], b[15:8], p3); // Upper 8 bits

    assign sum1 = {8'b0, p0[15:8]} + p1[15:0];
    assign sum2 = {8'b0, sum1[23:16]} + p2[15:0];

    assign product = {p3, sum2[15:0], p0[7:0]};
endmodule
