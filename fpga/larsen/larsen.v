// Create a Larsen Scanner
/* module */
module top (hwclk, led1, led2, led3, led4, led5, led6, led7, led8 );
    /* I/O */
    input hwclk;
    output led1;
    output led2;
    output led3;
    output led4;
    output led5;
    output led6;
    output led7;
    output led8;

    /* Counter register */
    reg [31:0] clkdiv = 32'b0;
    reg [3:0] counter = 4'b0;

    wire clk = clkdiv[18];
    // Start with just 1 bit set, but we'll change it to a pair later.
    reg [7:0] scanner = 8'b0000_0001;
    reg direction = 1'b0;

    /* LED drivers */
    //assign led1 = scanner[0];
    assign led1 = scanner[0];
    assign led2 = scanner[1];
    assign led3 = scanner[2];
    assign led4 = scanner[3];
    assign led5 = scanner[4];
    assign led6 = scanner[5];
    assign led7 = scanner[6];
    assign led8 = scanner[7];

    /* always */
    always @ (posedge hwclk) begin
        clkdiv <= clkdiv + 1;
    end

    always @ (posedge clk) begin
        if (direction == 0) begin
            scanner <= scanner << 1;
        end
        else begin
            scanner <= scanner >> 1;
        end

        if (counter == 0) begin
            direction <= 1'b0;
            counter <= counter + 4'b1;
            scanner <= 8'b0000_0011;
        end
        else if (counter == 7) begin
            direction <= 1'b1;
            counter <= counter + 4'b1;
            scanner <= 8'b1100_0000;
        end
        else if (counter == 13) begin
            counter <= 4'b0;
        end
        else begin
            counter <= counter + 4'b1;
        end
    end
endmodule
