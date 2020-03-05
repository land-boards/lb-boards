module countpro(sys_clk,led);

input sys_clk;
output [2:0] led;
reg	[25:0] count;
reg [2:0] led;

always @(posedge sys_clk)
	begin
		count <= count + 1;
		if( count == 26'b11_1111_1111_1111_1111_1111_1110 )
			begin
			led <= ~led; 
			end
		else 
			led <= led;
	end
	
endmodule