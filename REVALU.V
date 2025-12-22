`timescale 1ns / 1ps

module dkgp8 (
    input [7:0] A, B,
    input [2:0] SEL,
    output [7:0] RESULT,
    output COUT
);
    wire [7:0] sum_out, logic_out;
    wire carry_out;

    dkgp_adder_8bit adder (
        .A(A), .B(B),
        .SUM(sum_out),
        .COUT(carry_out)
    );

    logic_unit logic_inst (
        .A(A), .B(B), .op(SEL[1:0]),
        .OUT(logic_out)
    );

    assign RESULT = (SEL[2] == 1'b0) ? sum_out : logic_out;
    assign COUT   = (SEL[2] == 1'b0) ? carry_out : 1'b0;
endmodule


module dkgp1bit_db (
    input p, q, r, s,       // p = A, q = B, r = Cin, s = 0
    output a, b, c, d       // c = Sum, d = Carry
);
    assign a = p ^ r;                       // Garbage
    assign b = q;                           // Garbage
    assign c = p ^ q ^ r;                   // Sum
    assign d = (p & q) | (r & (p ^ q));     // Carry
endmodule


module dkgp_adder_8bit (
    input [7:0] A, B,
    output [7:0] SUM,
    output COUT
);
    wire [7:0] carry;

    // LSB adder
    dkgp1bit_db FA0 (
        .p(A[0]), .q(B[0]), .r(1'b0), .s(1'b0),
        .a(), .b(), .c(SUM[0]), .d(carry[0])
    );

    // Bits 1-7
    genvar i;
    generate
        for (i = 1; i < 8; i = i + 1) begin : adder_loop
            dkgp1bit_db FA (
                .p(A[i]), .q(B[i]), .r(carry[i-1]), .s(1'b0),
                .a(), .b(), .c(SUM[i]), .d(carry[i])
            );
        end
    endgenerate

    assign COUT = carry[7];
endmodule

module logic_unit (
    input [7:0] A, B,
    input [1:0] op,     // 00=AND, 01=OR, 10=XOR, 11=NOT A
    output reg [7:0] OUT
);
    always @(*) begin
        case(op)
            2'b00: OUT = A & B;
            2'b01: OUT = A | B;
            2'b10: OUT = A ^ B;
            2'b11: OUT = ~A;
            default: OUT = 8'b0;
        endcase
    end
endmodule
