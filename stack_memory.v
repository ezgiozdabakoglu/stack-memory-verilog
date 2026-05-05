module stack_memory (
    input clk,
    input reset,
    input push,
    input pop,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full,
    output empty
);

    reg [7:0] memory [0:7];
    reg [3:0] sp;

    assign empty = (sp == 0);
    assign full  = (sp == 8);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sp <= 0;
            data_out <= 8'b00000000;
        end
        else begin
            if (push && !full && !pop) begin
                memory[sp] <= data_in;
                sp <= sp + 1;
            end
            else if (pop && !empty && !push) begin
                sp <= sp - 1;
                data_out <= memory[sp - 1];
            end
        end
    end

endmodule
