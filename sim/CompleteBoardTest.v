`timescale 1ns / 1ps

module CompleteBoardTest ();
    wire [7:0] player_1_health;
    wire [7:0] player_2_health;
    wire [4:0] player_1_health_digit_select;
    wire [4:0] player_2_health_digit_select;
    wire [2:0] player_1_position;
    wire [2:0] player_2_position;
    wire player_1_lost;
    wire player_2_lost;

    reg [5:0] player_1_action;
    reg [5:0] player_2_action;
    reg switch;
    reg reset;
    reg clock;
    
    parameter none = 6'b000000;
    parameter j = 6'b100000;
    parameter k = 6'b010000;
    parameter p = 6'b001000;
    parameter w = 6'b000100;
    parameter mf = 6'b000010;
    parameter mb = 6'b000001;;

    CompleteBoard uut (
        .plr_1_hlt(player_1_health),
        .plr_2_hlt(player_2_health),
        .plr_1_hlt_dgt_slct(player_1_health_digit_select),
        .plr_2_hlt_dgt_slct(player_2_health_digit_select),
        .plr_1_pos(player_1_position),
        .plr_2_pos(player_2_position),
        .plr_1_lst(player_1_lost),
        .plr_2_lst(player_2_lost),
        .plr_1_act(player_1_action),
        .plr_2_act(player_2_action),
        .sw(switch),
        .rst(reset),
        .clk(clock)
    );

    initial
    begin
        clock = 1'b0;

        repeat (100)
        begin
            #25 clock = ~clock;
        end
    end

    initial
    begin
        switch = 1'b1;
        
        // Reset.
        reset = 1'b0;
        #1;

        reset = 1'b1;
        #1;

        reset = 1'b0;
        #1;

        // Action 1.
        player_1_action = mf;
        player_2_action = mf;
        #53;

        // Action 2.
        player_1_action = mf;
        player_2_action = mf;
        #53;

        // Action 3.
        player_1_action = p;
        player_2_action = p;
        #53;

        // Action 4.
        player_1_action = k;
        player_2_action = mf;
        #53;

        // Action 5.
        player_1_action = mf;
        player_2_action = p;
        #53;

        // Action 6.
        player_1_action = w;
        player_2_action = w;
        #53;

        // Action 7.
        player_1_action = w;
        player_2_action = w;
        #50;

        // Action 8.
        player_1_action = p;
        player_2_action = k;
        #53;

        // Action 9.
        player_1_action = j;
        player_2_action = p;
        #45;

        $finish;
    end
endmodule
