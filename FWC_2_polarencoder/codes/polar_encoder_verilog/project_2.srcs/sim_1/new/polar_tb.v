`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.12.2022 07:43:51
// Design Name: 
// Module Name: polar_tb
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


module polar_tb(

    );
    
    reg clk=0;
    reg rst=0;
    reg [199:0] data_in;
    wire [1023:0] data_out;
    wire flag;
    initial begin
    data_in <= 200'hffffffffffffffffffffffffffffffffffffffffffffffffff;
    #120
    data_in <= 200'haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa;
    #120
    data_in <= 200'h1;
    end
    polar tb1(.clk(clk),.rst(rst),.data_in(data_in),.data_out(data_out));
    assign flag=tb1.flag;
    initial begin
    rst=1;
    #10
    rst=0;
    end
    always #5 clk=~clk;
endmodule
