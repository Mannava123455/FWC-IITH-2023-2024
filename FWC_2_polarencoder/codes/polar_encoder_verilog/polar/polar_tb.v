module polar_tb;
reg clk=0,rst,message;
wire result_s;
always #5 clk=~clk;
initial 
begin
reset=0;

#20
reset=1;
message=10000'b1;
#1000 $finish;
end
endmodule

