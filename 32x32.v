module vedic_32x32(a, b, product);
    input [31:0] a, b;
    output [63:0] product;

    wire [31:0] p0, p1, p2, p3;
    wire [47:0] sum1, sum2;

    vedic_16x16 v0(a[15:0], b[15:0], p0);  // Lower 16 bits
    vedic_16x16 v1(a[31:16], b[15:0], p1); // Upper A, lower B
    vedic_16x16 v2(a[15:0], b[31:16], p2); // Lower A, upper B
    vedic_16x16 v3(a[31:16], b[31:16], p3); // Upper 16 bits

    assign sum1 = {16'b0, p0[31:16]} + p1[31:0];
    assign sum2 = {16'b0, sum1[47:32]} + p2[31:0];

    assign product = {p3, sum2[31:0], p0[15:0]};
endmodule
