//按键控制Led灯，
//使用的是K11 K12 K13
//key control Led,
//USE K11 K12 K13

module key_b
	(
		Key,
		Led
	);
	input [3:0] Key;  //USE K11 K12 K13
	output [3:0] Led;
	
	reg [3:0] Led;
	
	always @ (Key,Led)
		case(Key)
			4'b1110:Led=4'b0000;
			4'b1101:Led=4'b1000;
			4'b1011:Led=4'b1100;
			4'b0111:Led=4'b1110;

			default:Led=4'b1111;
		endcase  
endmodule