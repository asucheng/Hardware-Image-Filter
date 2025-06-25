# Hardware Median Filter

This project implements a median filter in RTL, designed to be synthesized for FPGA deployment. However, due to the lack of FPGA hardware access, all results are demonstrated using RTL simulation via a testbench.

## Design 

A **median filter** determines the median value from a sequence of numbers. In this project, the filter operates on a 3×3 window of 9 pixels. The median is computed using a **partial sorting** approach: three medians are first calculated from three separate groups of three pixels each, and then the final output is obtained by taking the median of those three intermediate medians.

The design consists of two main modules:

-   **Register module**: Passes the input value to the output on the rising edge of the clock, conditioned on an enable signal.
    
-   **Comparator module**: Takes two input operands and outputs both the maximum and minimum values.
    

These modules are integrated in the top-level file `median_filter.v`, where all necessary wires are declared to interconnect the registers and comparators.

## Pipeline and Control
The median filter accepts pixel values serially and is structured as a **7-stage pipeline**:

-   **Stages 1 and 2**: Controlled by `enable_1`, used to load the first two pixels.
    
-   **Stage 3**: Loads the third pixel, controlled
 by `enable_2`
    
-   **Stages 4 to 7**: Controlled by `enable_2`, which is activated after `enable_1` has been asserted twice. In these stages, the median values of each 3-pixel group are computed and then compared to find the final median.
    

Overall, the filter requires **11 clock cycles** to produce a median output from 9 serially input pixels. The following animation illustrates how a sequence of 9 values flows through the pipeline and is processed by the filter.

![median_filter](https://github.com/user-attachments/assets/ca6de3ff-3436-4f4f-b5bb-c8cbdf4cc955)

## RTL Simulation
The simulation input is a sequence of values from 1 to 9 in a mixed order. The output, represented by the signal `o_med`, should be the median value **5**, which is produced after **11 clock cycles**.

![simulation](https://github.com/user-attachments/assets/d846ca25-eb1a-4fd8-935b-61925483a8a0)




More work coming soon...
