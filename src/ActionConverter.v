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
            6'b000000: 
            begin
                $display("%0t: (ActionConverter: 25)", $time);
                out = none;
            end
            6'b100000: 
            begin
                $display("%0t: (ActionConverter: 30)", $time);
                out = j;
            end
            6'b010000: 
            begin
                $display("%0t: (ActionConverter: 34)", $time);
                out = k;
            end
            6'b001000: 
            begin
                $display("%0t: (ActionConverter: 39)", $time);
                out = p;
            end
            6'b000100: 
            begin
                $display("%0t: (ActionConverter: 45)", $time);
                out = w;
            end
            6'b000010: 
            begin
                out = mf;
                $display("%0t: (ActionConverter: 50) out = 0x%0h", $time, out);
            end
            6'b000001: 
            begin
                $display("%0t: (ActionConverter: 55)", $time);
                out = mb;
            end
        endcase
    end
endmodule