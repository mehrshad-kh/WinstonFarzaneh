`timescale 1ns / 1ps

module ActionConverter (
    out,
    in
);
    output [2:0] out;
    input [5:0] in;

    reg [2:0] out;

    parameter none = 3'b000;
    parameter j = 3'b001;
    parameter k = 3'b010;
    parameter p = 3'b011;
    parameter w = 3'b100;
    parameter mf = 3'b101;
    parameter mb = 3'b110;

    always @ (in)
    begin
        case (in)
            6'b100000: 
                out = j;
            6'b010000: 
                out = k;
            6'b001000: 
                out = p;
            6'b000100: 
                out = w;
            6'b000010: 
                out = mf;
            6'b000001: 
                out = mb;
            default:
                out = none;
        endcase
    end
endmodule
