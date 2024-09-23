module vedic_2x2(a, b, product);
    input [1:0] a, b;
    output [3:0] product;
    
    wire [3:0] temp;
    
    assign temp[0] = a[0] & b[0]; // LSB multiplication
    assign temp[1] = (a[1] & b[0]) ^ (a[0] & b[1]); // cross multiplication
    assign temp[2] = (a[1] & b[0]) & (a[0] & b[1]);
    assign temp[3] = a[1] & b[1]; // MSB multiplication
    
    assign product = {temp[3], temp[2] | temp[1], temp[0]};
endmodule
