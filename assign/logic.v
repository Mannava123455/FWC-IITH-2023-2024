module logicc(
	input x,y,z,w,
	output r
);
assign r=(((!x||y)&&z)||(!w));
endmodule

