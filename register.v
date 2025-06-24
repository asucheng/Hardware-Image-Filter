`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2025 10:11:08 PM
// Design Name: 
// Module Name: register
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


module register(
    input clk,
    input en,
    input  [7:0] d,
    output [7:0] q
    );
    
    reg [7:0] out_q;
    
    always @(posedge clk) begin 
        if (en) 
            out_q <= d;
    end
    
    assign q = out_q;
    
endmodule
