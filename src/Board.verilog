`timescale 1ns / 1ps

module Board (
    plr_1_hlt,
    plr_2_hlt,
    plr_1_pos,
    plr_2_pos,
    plr_1_lst,
    plr_2_lst,
    plr_1_act,
    plr_2_act,
    sw,
    rst,
    clk
);
    output [1:0] plr_1_hlt;
    output [1:0] plr_2_hlt;
    output [1:0] plr_1_pos;
    output [1:0] plr_2_pos;
    output plr_1_lst;
    output plr_2_lst;
    input [2:0] plr_1_act;
    input [2:0] plr_2_act;
    input sw;
    input rst;
    input clk;

    wire en;
    wire [1:0] plr_1_pos;
    wire [1:0] plr_2_pos;

    parameter no_hearts = 2'b00;

    Player plr_1 (
        .hlt(plr_1_hlt),
        .pos(plr_1_pos),
        .act(plr_1_act),
        .op_act(plr_2_act),
        .op_pos(plr_2_pos),
        .en(en),
        .sw(sw),
        .rst(rst),
        .clk(clk)
    );

    Player plr_2 (
        .hlt(plr_2_hlt),
        .pos(plr_2_pos),
        .act(plr_2_act),
        .op_act(plr_1_act),
        .op_pos(plr_1_pos),
        .en(en),
        .sw(sw),
        .rst(rst),
        .clk(clk)
    );

    assign plr_1_lst = (plr_1_hlt == no_hearts) ? 1'b1 : 1'b0;
    assign plr_2_lst = (plr_2_hlt == no_hearts) ? 1'b1 : 1'b0;
    assign en = plr_1_lst ^ plr_2_lst;
endmodule
