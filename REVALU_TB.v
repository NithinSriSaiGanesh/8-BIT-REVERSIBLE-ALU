`timescale 1ns / 1ps
module tb_dkgp8;

    reg [7:0] A, B;
    reg [2:0] SEL;
    wire [7:0] RESULT;
    wire COUT;

    dkgp8 uut (
        .A(A), .B(B), .SEL(SEL),
        .RESULT(RESULT), .COUT(COUT)
    );

    initial begin
        $display("Time  SEL   A       B       | RESULT    COUT");
        $display("--------------------------------------------------");

        // Test ADD (SEL=000)
        A=8'd13; B=8'd3; SEL=3'b000; #10;
        $display("%4dns %b  %08b %08b | %08b   %b", $time, SEL, A, B, RESULT, COUT);

        // Test ADD with carry (SEL=000)
        A=8'd255; B=8'd1; SEL=3'b000; #10;
        $display("%4dns %b  %08b %08b | %08b   %b", $time, SEL, A, B, RESULT, COUT);

        // Test AND (SEL=100)
        A=8'b10101010; B=8'b11001100; SEL=3'b100; #10;
        $display("%4dns %b  %08b %08b | %08b   %b", $time, SEL, A, B, RESULT, COUT);

        // Test OR (SEL=101)
        A=8'b10101010; B=8'b11001100; SEL=3'b101; #10;
        $display("%4dns %b  %08b %08b | %08b   %b", $time, SEL, A, B, RESULT, COUT);

        // Test XOR (SEL=110)
        A=8'b10101010; B=8'b11001100; SEL=3'b110; #10;
        $display("%4dns %b  %08b %08b | %08b   %b", $time, SEL, A, B, RESULT, COUT);

        // Test NOT A (SEL=111)
        A=8'b10101010; B=8'b11001100; SEL=3'b111; #10;
        $display("%4dns %b  %08b %08b | %08b   %b", $time, SEL, A, B, RESULT, COUT);

        $finish;
    end
endmodule

