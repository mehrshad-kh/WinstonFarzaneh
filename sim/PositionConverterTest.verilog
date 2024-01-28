`timescale 1ns / 1ps

module PositionConverterTest ();
    reg [1:0] in;

    wire [2:0] out;

    parameter hm = 2'b00;
    parameter mid = 2'b01;
    parameter frnt = 2'b10;

    PositionConverter uut (
        .out(out),
        .in(in)
    );

    initial
    begin
        in = hm;
        #50;

        in = frnt;
        #50;

        in = hm;
        #50;

        in = mid;
        #50;

        $finish;
    end
endmodule
