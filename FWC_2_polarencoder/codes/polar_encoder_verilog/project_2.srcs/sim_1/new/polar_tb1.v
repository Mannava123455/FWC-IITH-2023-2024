`timescale 1ns / 1ps

module polar_tb1(

    );
    reg clk=0;
    reg rst=0;
    reg[199:0] message;
    wire [1023:0] result;
    
    
    
    top_polar tb2(.message(message),.result(result),.clk(clk),.rst(rst));
   
    
    always #5 clk=~clk;
    initial
        begin
        rst = 1;
        #45 rst=0; message=200'hffffffffffffffffffffffffffffffffffffffffffffffffff;
        #45 message=200'haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa;
        #200 $finish;
        end
endmodule
