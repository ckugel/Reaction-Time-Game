`ifndef thirteenBitUpCount
`define thirteenBitUpCount

module thirteenBitUpCount(Enable, Clock, Reset, Done);
    input Enable;
    input Clock;
    input Reset;

    reg [12:0] count;

    output Done;

    always @(posedge Clock) begin
        if (Reset) begin
            count <= 13'h0; // Reset the counter to zero
        end else begin
            if (Enable) begin
                count <= count + 1'b1; // Increment the counter
            end
        end
    end

    assign Done = count[0] & count[1] & count[2] & count[3] & count[4] & count[5] & count[6] & count[7] & count[8] & count[9] & count[10] & count[11] & count[12];
endmodule

`endif
