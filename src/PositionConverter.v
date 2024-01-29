`timescale 1ns / 1ps

module PositionConverter (
    out,
    in
);
    output [2:0] out;
    input [1:0] in;

    reg [2:0] out;

    parameter hm = 2'b00;
    parameter mid = 2'b01;
    parameter frnt = 2'b10;

    always @ (in)
    begin
        case (in)
            hm: 
            begin
                $display("%0t: (PositionConverter: 21)", $time);
                out = 3'b100;
            end
            mid: 
            begin
                $display("%0t: (PositionConverter: 26)", $time);
                out = 3'b010;
            end
            frnt:
            begin
                $display("%0t: (PositionConverter: 31)", $time);
                out = 3'b001;
            end
        endcase
    end
endmodule
