`timescale 1ns / 1ps

// Health is outputted on a multiplexed seven-segment display.
module CompleteBoard (
    hlt,
    hlt_dgt_slct,
    plr_1_pos,
    plr_2_pos,
    plr_1_wn,
    plr_2_wn,
    plr_1_act,
    plr_2_act,
    sw,
    rst,
    clk
);
    output [7:0] hlt;
    output [4:0] hlt_dgt_slct;
    output [2:0] plr_1_pos;
    output [2:0] plr_2_pos;
    output plr_1_wn;
    output plr_2_wn;
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
    wire svn_sgmnt_clk;

    Board board (
        .plr_1_hlt (intr_plr_1_hlt),
        .plr_2_hlt (intr_plr_2_hlt),
        .plr_1_pos (intr_plr_1_pos),
        .plr_2_pos (intr_plr_2_pos),
        .plr_1_wn (plr_1_wn),
        .plr_2_wn (plr_2_wn),
        .plr_1_act (intr_plr_1_act),
        .plr_2_act (intr_plr_2_act),
        .sw (sw),
        .rst (rst),
        // Change to .clk (clk) for simulation purposes.
        .clk (intr_clk)
    );

    ActionConverter plr_1_act_cnvrtr (
        .out (intr_plr_1_act),
        .in (plr_1_act)
    );

    ActionConverter plr_2_act_cnvrtr (
        .out (intr_plr_2_act),
        .in (plr_2_act)
    );

    DoubleBcdSevSegConverter hlt_cnvrtr (
        .dgt_slct (hlt_dgt_slct),
        .data_out (hlt),
        .data_in_1 ({2'b00, intr_plr_1_hlt}),
        .data_in_2 ({2'b00, intr_plr_2_hlt}),
        .clk (svn_sgmnt_clk)
    );

    FrequencyDivider frq_dvdr (
        .out (intr_clk), 
        .in (clk)
    );

    SevSegFreqDivider svn_sgmnt_frq_dvdr (
        .out (svn_sgmnt_clk),
        .in (clk)
    );

    PositionConverter plr_1_pos_cnvrtr (
        .out (plr_1_pos),
        .in (intr_plr_1_pos)
    );

    PositionConverter plr_2_pos_cnvrtr (
        .out (plr_2_pos),
        .in (intr_plr_2_pos)
    );
endmodule
