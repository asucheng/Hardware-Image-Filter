`timescale 1ns / 1ps

module median_filter(
    input       clk,
    input [7:0] i_data,
    input       en1,
    input       en2,
    output [7:0] o_med
    );
    
    
//stage1--------------------------------------
    wire [7:0] d1_d2_s2;

    register d1(
    .clk(clk),
    .en(en1),
    .d(i_data),
    .q(d1_d2_s2)
    );
    
//stage2--------------------------------------
    wire [7:0] d2_s1;

    register d2(
    .clk(clk),
    .en(en1),
    .d(d1_d2_s2),
    .q(d2_s1)
    );

//stage3--------------------------------------
    wire [7:0] s1_c0;
    wire [7:0] s2_c0;
    wire [7:0] s3_c1;
    
    wire [7:0] c0_c2;
    wire [7:0] c0_c1;
    wire [7:0] c1_c2;
    
    wire [7:0] c1_l1;
    wire [7:0] c2_h1;
    wire [7:0] c2_m1;
    
    register s1(
    .clk(clk),
    .en(en2),
    .d(d2_s1),
    .q(s1_c0)
    );
    
    register s2(
    .clk(clk),
    .en(en2),
    .d(d1_d2_s2),
    .q(s2_c0)
    );
    
    register s3(
    .clk(clk),
    .en(en2),
    .d(i_data),
    .q(s3_c1)
    );
    
    comparator c0(
    .input1(s1_c0),
    .input2(s2_c0),
    .max(c0_c2),
    .min(c0_c1)
    );
    
    comparator c1(
    .input1(s3_c1),
    .input2(c0_c1),
    .max(c1_c2),
    .min(c1_l1)
    );
    
    comparator c2(
    .input1(c0_c2),
    .input2(c1_c2),
    .max(c2_h1),
    .min(c2_m1)
    );
    
//stage4--------------------------------------
    wire [7:0] h1_h2_c3_c6;
    wire [7:0] m1_m2_c4_c7;
    wire [7:0] l1_l2_c5_c8;
    
    register h1(
    .clk(clk),
    .en(en2),
    .d(c2_h1),
    .q(h1_h2_c3_c6)
    );
    
    register m1(
    .clk(clk),
    .en(en2),
    .d(c2_m1),
    .q(m1_m2_c4_c7)
    );
    
    register l1(
    .clk(clk),
    .en(en2),
    .d(c1_l1),
    .q(l1_l2_c5_c8)
    );
 
//stage5--------------------------------------   
    wire [7:0] h2_c3;
    wire [7:0] m2_c4;
    wire [7:0] l2_c5;
    
    wire [7:0] c3_h3;
    wire [7:0] c4_mh3;
    wire [7:0] c4_ml3;
    wire [7:0] c5_l3;
    
    register h2(
    .clk(clk),
    .en(en2),
    .d(h1_h2_c3_c6),
    .q(h2_c3)
    );
    
    register m2(
    .clk(clk),
    .en(en2),
    .d(m1_m2_c4_c7),
    .q(m2_c4)
    );
    
    register l2(
    .clk(clk),
    .en(en2),
    .d(l1_l2_c5_c8),
    .q(l2_c5)
    );
    
    comparator c3(
    .input1(h2_c3),
    .input2(h1_h2_c3_c6),
    .max(),
    .min(c3_h3)
    );
    
    comparator c4(
    .input1(m2_c4),
    .input2(m1_m2_c4_c7),
    .max(c4_mh3),
    .min(c4_ml3)
    );
    
    comparator c5(
    .input1(l2_c5),
    .input2(l1_l2_c5_c8),
    .max(c5_l3),
    .min()
    );
    
//stage6-------------------------------------- 
    wire [7:0] h3_c6;
    wire [7:0] mh3_c9;
    wire [7:0] ml3_c7;
    wire [7:0] l3_c8;
    
    wire [7:0] c6_h4;
    wire [7:0] c7_c9;
    wire [7:0] c8_l4;
    wire [7:0] c9_m4;

    register h3(
    .clk(clk),
    .en(en2),
    .d(c3_h3),
    .q(h3_c6)
    );
    
    register mh3(
    .clk(clk),
    .en(en2),
    .d(c4_mh3),
    .q(mh3_c9)
    );
    
    register ml3(
    .clk(clk),
    .en(en2),
    .d(c4_ml3),
    .q(ml3_c7)
    );
    
    register l3(
    .clk(clk),
    .en(en2),
    .d(c5_l3),
    .q(l3_c8)
    );
    
    comparator c6(
    .input1(h3_c6),
    .input2(h1_h2_c3_c6),
    .max(),
    .min(c6_h4)
    );
    
    comparator c7(
    .input1(ml3_c7),
    .input2(m1_m2_c4_c7),
    .max(c7_c9),
    .min()
    );
    
    comparator c8(
    .input1(l3_c8),
    .input2(l1_l2_c5_c8),
    .max(c8_l4),
    .min()
    );
    
    comparator c9(
    .input1(c7_c9),
    .input2(mh3_c9),
    .max(),
    .min(c9_m4)
    );
    
//stage7--------------------------------------
    wire [7:0] h4_c10;
    wire [7:0] m4_c10;
    wire [7:0] l4_c11;
  
    wire [7:0] c10_c12;
    wire [7:0] c10_c11;
    wire [7:0] c11_c12;
    
     register h4(
    .clk(clk),
    .en(en2),
    .d(c6_h4),
    .q(h4_c10)
    );
    
    register m4(
    .clk(clk),
    .en(en2),
    .d(c9_m4),
    .q(m4_c10)
    );
    
    register l4(
    .clk(clk),
    .en(en2),
    .d(c8_l4),
    .q(l4_c11)
    );
    
    comparator c10(
    .input1(h4_c10),
    .input2(m4_c10),
    .max(c10_c12),
    .min(c10_c11)
    );
    
    comparator c11(
    .input1(c10_c11),
    .input2(l4_c11),
    .max(c11_c12),
    .min()
    );
    
    comparator c12(
    .input1(c10_c12),
    .input2(c11_c12),
    .max(),
    .min(o_med)
    );
    
endmodule