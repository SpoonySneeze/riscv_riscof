`timescale 1ns / 1ps

module data_memory(
    input wire clk,
    input wire reset,
    input wire MemWrite,
    input wire MemRead, 
    input wire [31:0] address,
    input wire [31:0] write_data,
    output wire [31:0] read_data
);

    reg [31:0] memory [0:1023];
    integer i;
    wire [9:0] word_address = address[11:2];

    assign read_data = memory[word_address];

    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < 1024; i = i + 1) begin
                memory[i] <= 32'b0;
            end
        end
        else if (MemWrite) begin
            memory[word_address] <= write_data;
        end
    end

    // --- TEMPORARY FOR HIERARCHY CHECK ---
endmodule
