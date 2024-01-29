`timescale 1ns / 1ps

module DoubleBcdSevSegConverter (
    dgt_slct, 
    data_out, 
    data_in_1,
    data_in_2,
    clk
);
    output [4:0] dgt_slct;
    output [7:0] data_out;
    input [3:0] data_in_1;
    input [3:0] data_in_2;
    input clk;
    
    reg slct = 1'b0;
    reg [4:0] dgt_slct;
    reg [7:0] data_out;

    always @ (posedge clk)
    begin
        case (slct)
            1'b0:
            begin
                // POSSIBLE PROBLEM.
                // Moved digit selection before case.

                // Select the left-most digit.
                dgt_slct = 5'b01000;
                case (data_in_1)
                    4'b0000: data_out = 8'b00111111;
                    4'b0001: data_out = 8'b00000110;
                    4'b0010: data_out = 8'b01011011;
                    4'b0011: data_out = 8'b01001111;
                    4'b0100: data_out = 8'b01100110;
                    4'b0101: data_out = 8'b01101101;
                    4'b0110: data_out = 8'b01111101;
                    4'b0111: data_out = 8'b00000111;
                    4'b1000: data_out = 8'b01111111;
                    4'b1001: data_out = 8'b01101111;
                endcase
            end
            1'b1:
            begin
                // Select the right-most digit.
                dgt_slct = 5'b00001;
                case (data_in_2)
                    4'b0000: data_out = 8'b00111111;
                    4'b0001: data_out = 8'b00000110;
                    4'b0010: data_out = 8'b01011011;
                    4'b0011: data_out = 8'b01001111;
                    4'b0100: data_out = 8'b01100110;
                    4'b0101: data_out = 8'b01101101;
                    4'b0110: data_out = 8'b01111101;
                    4'b0111: data_out = 8'b00000111;
                    4'b1000: data_out = 8'b01111111;
                    4'b1001: data_out = 8'b01101111;
                endcase
            end
        endcase
        slct = ~slct;
    end
endmodule
