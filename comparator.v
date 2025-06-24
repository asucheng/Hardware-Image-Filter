`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2025 10:09:25 PM
// Design Name: 
// Module Name: comparator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module comparator(
    input  [7:0] input1,
    input  [7:0] input2,
    output [7:0] max,
    output [7:0] min
    );
    
    reg [7:0] max_reg; 
    reg [7:0] min_reg;
    
    always @(*) begin 
        if (input1 > input2) begin
            max_reg <= input1;
            min_reg <= input2;
        end else begin 
            max_reg <= input2;
            min_reg <= input1;
        end 
    end
    
    assign max = max_reg;
    assign min = min_reg;
    
endmodule
