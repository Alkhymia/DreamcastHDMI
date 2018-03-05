`include "config.inc"

module startup (input clock, input reset, output reg ready);

    reg [31:0] counter;

    initial begin
        ready <= 0;
        counter <= 0;
    end

    always @ (posedge clock) // on positive clock edge
    begin
        if (~reset) begin
            ready <= 0;
            counter <= 0;
        end else begin
            counter <= #1 counter + 1; // increment counter
            
            if (counter == `PIXEL_CLK * `STARTUP_TIME_IN_MILLIS / 1000) begin
                ready <= 1;
            end
        end
    end
    
endmodule // end of module counter