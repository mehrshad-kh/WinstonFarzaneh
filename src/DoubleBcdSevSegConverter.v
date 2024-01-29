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
    input [2:0] data_in_1;
    input [2:0] data_in_2;
    input clk;
    
    reg present_state = 1'b0;
    reg [4:0] dgt_slct;
    reg [7:0] data_out;

    always @ (posedge clk)
    begin
        case (present_state)
            1'b0:
            begin
                case (data_in_1)
                    3'b000: data_out = 8'b00111111;
                    3'b001: data_out = 8'b00000110;
                    3'b010: data_out = 8'b01011011;
                    3'b011: data_out = 8'b01001111;
                    3'b100: data_out = 8'b01100110;
                    3'b101: data_out = 8'b01101101;
                    3'b110: data_out = 8'b01111101;
                    3'b111: data_out = 8'b00000111;
                endcase
                dgt_slct = 5'b00001;
            end
            1'b1:
            begin
                case (data_in_2)
                    3'b000: data_out = 8'b00111111;
                    3'b001: data_out = 8'b00000110;
                    3'b010: data_out = 8'b01011011;
                    3'b011: data_out = 8'b01001111;
                    3'b100: data_out = 8'b01100110;
                    3'b101: data_out = 8'b01101101;
                    3'b110: data_out = 8'b01111101;
                    3'b111: data_out = 8'b00000111;
                endcase
                dgt_slct = 5'b01000;
            end
        endcase
        present_state = ~present_state;
    end
endmodule
