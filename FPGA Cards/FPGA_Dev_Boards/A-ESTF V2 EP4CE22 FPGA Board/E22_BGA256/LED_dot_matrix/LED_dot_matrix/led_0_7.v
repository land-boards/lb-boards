//视飓芯微电子
//电话 15815519071 QQ 906606596
//Email 906606596@qq.com
//本实验学习点阵模块的使用
//其实原理和使用动态数码管的原理一样的
//在点阵上面显示一个心
//This experiment to study the use of dot matrix module
//In fact, the principle and the use of the principle of dynamic digital tube
//Show a Peach  on the dot matrix
module led_0_7 (clk,rst,dataout,U2_138_select,U3_138_select ,U3_138_A);

input clk,rst;         //系统时钟50M输入 从E1脚输入。 CLK 50M
output[7:0] dataout;   //点阵的段码输出 dot array data output
output[2:0] U3_138_A;   //点阵的行选使能输出 dot array 138 address select enable output
output  U2_138_select;  //数码管使能控制 Digital tube enable control
output  U3_138_select;  //点阵使能控制  dot array  enable control
   
reg[7:0] dataout;     
reg[2:0] U3_138_A;

reg[15:0] cnt_scan;//扫描频率计数器
reg[2:0] dataout_buf;

assign  U2_138_select = 0 ;  //禁止数码管工作  Digital tube  not work 
assign  U3_138_select = 1 ;  //点阵工作 dot array  work

always@(posedge clk or negedge  rst)
begin
	if(!rst) begin
		cnt_scan<=0;
		
	 end
	else begin
		cnt_scan<=cnt_scan+1;
		end
end

always @(cnt_scan)
begin
   case(cnt_scan[15:13])
       3'b000 :
          U3_138_A = 3'b000;
       3'b001 :
          U3_138_A = 3'b001;
       3'b010 :
          U3_138_A = 3'b010;
       3'b011 :
          U3_138_A = 3'b011;
       3'b100 :
          U3_138_A = 3'b100;
       3'b101 :
          U3_138_A = 3'b101;
       3'b110 :
          U3_138_A = 3'b110;
       3'b111 :
          U3_138_A = 3'b111;
    endcase
end

always@(U3_138_A) //对应138 有8种状态 There are 8 states corresponding to the 138
begin
	case(U3_138_A)
		3'b000:
			dataout_buf=0;
		3'b001:
			dataout_buf=1;
		3'b010:
			dataout_buf=2;
		3'b011:
			dataout_buf=3;	
		3'b100:
			dataout_buf=4;
		3'b101:
			dataout_buf=5;
		3'b110:
			dataout_buf=6;
		3'b111:
			dataout_buf=7;

	 endcase
end

always@(dataout_buf)
begin
//在点阵上面显示一个桃心需要的点阵代码
	case(dataout_buf)
		3'b000:
			dataout=8'b11101111;
		3'b001:
		dataout=8'b11110111;
		3'b010:
		dataout=8'b10010001;
	   3'b011:
		dataout=8'b01100110;
	   3'b100:
		dataout=8'b01111110;
		3'b101:
		dataout=8'b10111101;
		3'b110:
		dataout=8'b11011011;
		3'b111:
			dataout=8'b11100111;
			
			

		
		
	 endcase
end

endmodule 