`timescale 1ns / 1ps

// Same as test 1 with extra additions.
module BoardTest3 ();
    wire [1:0] player_1_health;
    wire [1:0] player_2_health;
    wire [1:0] player_1_position;
    wire [1:0] player_2_position;
    wire player_1_lost;
    wire player_2_lost;
    reg [2:0] player_1_action;
    reg [2:0] player_2_action;
    reg switch;
    reg reset;
    reg clock;
    
    Board uut (
        .plr_1_hlt(player_1_health),
        .plr_2_hlt(player_2_health),
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

    parameter none = 3'b000;
    parameter j = 3'b001;
    parameter k = 3'b010;
    parameter p = 3'b011;
    parameter w = 3'b100;
    parameter mf = 3'b101;
    parameter mb = 3'b110;

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
        reset = 0;
        #1;

        reset = 1;
        #1;

        reset = 0;
        #1;
        
        // Action 1.
        player_1_action = mf;
        player_2_action = mf;
        #53;

        switch = 1'b0;
        // Action 2.
        player_1_action = mf;
        player_2_action = mf;
        #53;

        // Reset.
        reset = 1;
        #7;

        reset = 0;
        #47;

        // Action 1.
        player_1_action = mf;
        player_2_action = mf;
        #53;

        switch = 1'b1;
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

        // Reset.
        reset = 1;
        #7;

        reset = 0;
        #47;

        // Action 1.
        player_1_action = mf;
        player_2_action = mf;
        #50;

        // Action 2.
        player_1_action = mf;
        player_2_action = mf;
        #50;

        // Action 3.
        player_1_action = w;
        player_2_action = w;
        #50;

        // Action 4.
        player_1_action = p;
        player_2_action = k;
        #53;

        // Action 5.
        player_1_action = j;
        player_2_action = p;
        #45;

        // Action 6.
        player_1_action = p;
        player_2_action = w;
        #60;

        // Action 7.
        player_1_action = p;
        player_2_action = p;
        #60;

        $finish;
    end
endmodule
