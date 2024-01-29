`timescale 1ns / 1ps

module CompleteBoard2 (
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
    output [2:0] plr_1_hlt;
    output [2:0] plr_2_hlt;
    output [2:0] plr_1_pos;
    output [2:0] plr_2_pos;
    output plr_1_lst;
    output plr_2_lst;
    input [5:0] plr_1_act;
    input [5:0] plr_2_act;
    input sw;
    input rst;
    input clk;

    wire intr_clk;
    wire [2:0] intr_plr_1_act;
    wire [2:0] intr_plr_2_act;
    wire [1:0] intr_plr_1_hlt;
    wire [1:0] intr_plr_2_hlt;
    wire [1:0] intr_plr_1_pos;
    wire [1:0] intr_plr_2_pos;

    Board board (
        .plr_1_hlt(intr_plr_1_hlt),
        .plr_2_hlt(intr_plr_2_hlt),
        .plr_1_pos(intr_plr_1_pos),
        .plr_2_pos(intr_plr_2_pos),
        .plr_1_lst(plr_1_lst),
        .plr_2_lst(plr_2_lst),
        .plr_1_act(intr_plr_1_act),
        .plr_2_act(intr_plr_2_act),
        .sw(sw),
        .rst(rst),
        // Change to .clk(clk) for simulation purposes.
        .clk(intr_clk)
    );

    ActionConverter plr_1_act_cnvrtr (
        .out(intr_plr_1_act),
        .in(plr_1_act)
    );

    ActionConverter plr_2_act_cnvrtr (
        .out(intr_plr_2_act),
        .in(plr_2_act)
    );

    HealthConverter plr_1_hlt_cnvrtr (
        .out(plr_1_hlt),
        .in(intr_plr_1_hlt)
    );

    HealthConverter plr_2_hlt_cnvrtr (
        .out(plr_2_hlt),
        .in(intr_plr_2_hlt)
    );

    FrequencyDivider frq_dvdr (
        .out(intr_clk), 
        .in(clk)
    );

    PositionConverter plr_1_pos_cnvrtr (
        .out(plr_1_pos),
        .in(intr_plr_1_pos)
    );

    PositionConverter plr_2_pos_cnvrtr (
        .out(plr_2_pos),
        .in(intr_plr_2_pos)
    );
endmodule
