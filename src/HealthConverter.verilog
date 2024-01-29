`timescale 1ns / 1ps

module HealthConverter (
    out,
    in
);
    output [2:0] out;
    input [1:0] in;

    reg [2:0] out;

    parameter no_hearts = 2'b00;
    parameter one_heart = 2'b01;
    parameter two_hearts = 2'b10;
    parameter three_hearts = 2'b11;

    always @ (in)
    begin
        case (in)
            no_hearts: out = 3'b000;
            one_heart: out = 3'b100;
            two_hearts: out = 3'b110;
            three_hearts: out = 3'b111;
        endcase
    end
endmodule
