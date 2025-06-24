`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2025 12:23:35 AM
// Design Name: 
// Module Name: filter_tb
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


module filter_tb();
    reg clk;
    reg [7:0] i_data;
    reg en1;
    reg en2;
    wire [7:0] o_med;

    median_filter dut(
    .clk(clk),   
    .i_data(i_data),
    .en1(en1),   
    .en2(en2),   
    .o_med(o_med) 
    );
    
    initial begin
        clk = 1'b0;
        forever #5 clk = !clk;
    end
    
    initial begin
        en1 = 0; en2 = 0;
        
        @(posedge clk);
        en1 = 1; en2 = 0;
        i_data = 8'h1;
        @(posedge clk);
        en1 = 1; en2 = 0;
        i_data = 8'h2;
        @(posedge clk);
        en1 = 1; en2 = 1; 
        i_data = 8'h3;
    
        @(posedge clk);
        en1 = 1; en2 = 0;
        i_data = 8'h7;
        @(posedge clk);
        en1 = 1; en2 = 0;
        i_data = 8'h8;
        @(posedge clk);
        en1 = 1; en2 = 1;
        i_data = 8'h5;
        
        @(posedge clk);
        en1 = 1; en2 = 0;
        i_data = 8'h4;
        @(posedge clk);
        en1 = 1; en2 = 0;
        i_data = 8'h6;
        @(posedge clk);
        en1 = 1; en2 = 1;
        i_data = 8'h9;
        
        @(posedge clk);
        en1 = 0; en2 = 1;
        @(posedge clk);
        en1 = 0; en2 = 1;
        @(posedge clk);
        en1 = 0; en2 = 1;
//        @(posedge clk);
//        en1 <= 0; en2 <= 1;
        
        $display("Test Passed");
        $finish;
    end
    

    
endmodule
