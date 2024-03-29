`timescale 1ns / 1ps

module FrequencyDivider (
    out,
    in
);
    output out;
    input in;
    
    reg out;
    
    reg [25:0] counter = 0;
    always @ (posedge in)
    begin
        if (counter == 20_000_000 - 1)
        begin
            counter <= 0;
            out <= ~out;
        end
        else
        begin
            counter <= counter + 1;
        end
    end
endmodule
