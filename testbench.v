`timescale 1ns/1ps

module stack_memory_tb;

    reg clk;
    reg reset;
    reg push;
    reg pop;
    reg [7:0] data_in;

    wire [7:0] data_out;
    wire full;
    wire empty;

    stack_memory uut (
        .clk(clk),
        .reset(reset),
        .push(push),
        .pop(pop),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("stack_memory.vcd");
        $dumpvars(0, stack_memory_tb);

        clk = 0;
        reset = 1;
        push = 0;
        pop = 0;
        data_in = 8'b00000000;

        #10;
        reset = 0;

        // Push 10
        #10;
        data_in = 8'd10;
        push = 1;
        pop = 0;

        #10;
        push = 0;

        // Push 20
        #10;
        data_in = 8'd20;
        push = 1;

        #10;
        push = 0;

        // Push 30
        #10;
        data_in = 8'd30;
        push = 1;

        #10;
        push = 0;

        // Pop -> should output 30
        #10;
        pop = 1;

        #10;
        pop = 0;

        // Pop -> should output 20
        #10;
        pop = 1;

        #10;
        pop = 0;

        // Pop -> should output 10
        #10;
        pop = 1;

        #10;
        pop = 0;

        // Try pop when empty
        #10;
        pop = 1;

        #10;
        pop = 0;

        // Fill stack completely
        #10; data_in = 8'd1; push = 1;
        #10; data_in = 8'd2;
        #10; data_in = 8'd3;
        #10; data_in = 8'd4;
        #10; data_in = 8'd5;
        #10; data_in = 8'd6;
        #10; data_in = 8'd7;
        #10; data_in = 8'd8;
        #10; push = 0;

        // Try push when full
        #10;
        data_in = 8'd99;
        push = 1;

        #10;
        push = 0;

        #20;
        $finish;
    end

endmodule
