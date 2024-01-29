`timescale 1ns / 1ps

// Active low enable.
module Player (
    hlt,
    pos,
    act,
    op_act,
    op_pos,
    en,
    sw,
    rst,
    clk
);
    output [1:0] hlt;
    output [1:0] pos;
    input [2:0] act;
    input [2:0] op_act;
    input [1:0] op_pos;
    input en;
    input sw;
    input rst;
    input clk;

    reg [1:0] hlt;
    reg [1:0] pos;

    reg [2:0] cur_act;
    reg [2:0] prev_act;

    parameter no_hearts = 2'b00;
    parameter three_hearts = 2'b11;

    parameter none = 3'b000;
    parameter j = 3'b001;
    parameter k = 3'b010;
    parameter p = 3'b011;
    parameter w = 3'b100;
    parameter mf = 3'b101;
    parameter mb = 3'b110;

    parameter hm = 2'b00;
    parameter mid = 2'b01;
    parameter frnt = 2'b10;

    always @ (posedge clk)
    begin
        if (rst)
        begin
            hlt = three_hearts;
            prev_act = none;
            cur_act = none;
            /*
            $display(
                "%0t: (Player:58) prev_act = 0x%0h, cur_act = 0x%0h", 
                $time, 
                prev_act, 
                cur_act
            );
             */
            pos = hm;
        end
        else
        begin
            if (!en && sw)
            begin
                prev_act = cur_act;
                cur_act = act;

                if (act == w && prev_act == w && hlt < 3)
                begin
                    hlt = hlt + 1;
                end
                else if (act == mf && pos != frnt)
                begin
                    pos = pos + 1;
                end
                else if (act == mb && pos != hm)
                begin
                    pos = pos - 1;
                end
                
                if (op_act == p && pos == op_pos && pos == frnt)
                begin
                    if (act == p)
                    begin
                        pos = pos - 1;
                    end
                    else if (act == w || act == k || act == mf)
                    begin
                        hlt = (hlt >= 2) ? (hlt - 2) : 0;
                    end
                end
                else if (op_act == k && 
                    (pos == 2 && op_pos != 0 || op_pos == 2 && pos != 0))
                begin
                    if (act == k)
                    begin
                        pos = pos - 1;
                    end
                    else if (act == w || act == mf 
                        || (act == p && !(pos == op_pos && pos == frnt)))
                    begin
                        hlt = hlt - 1;
                    end
                end
            end
        end
    end
endmodule
