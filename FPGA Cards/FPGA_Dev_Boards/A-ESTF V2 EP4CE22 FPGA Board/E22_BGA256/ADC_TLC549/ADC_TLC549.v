//视飓芯微电子
//电话 15815519071 QQ 906606596
//Email 906606596@qq.com
//TLC549AD采样程序 在数码管上显示 
//TLC549AD sampling program on the digital tube display

module ADC_TLC549
(
clk,     //系统50MHZ时钟
ioclk,   //AD TLC549的时钟 AD TLC549 CLK
data,    //AD TLC549的数据口 AD TLC549 DATA
cs,      //AD TLC549的片选择 AD TLC549 CS

U2_138_A,   //数码管的位选输出 
U2_138_select,  //数码管138使能控制 Digital tube enable control
U3_138_select,   //点阵138使能控制 dot array  enable control
segdata  //数码管的7段码  
); 

input clk,data ; 
output cs,ioclk; 
output[7:0]segdata; 

output[2:0] U2_138_A;        //数码管的位选使能输出 
output  U2_138_select;     //数码管138使能控制 Digital tube enable control
output  U3_138_select;     //点阵138使能控制 dot array  enable control
///////////////////////////////
reg cs,ioclk,clk1k,clk1ms; 
reg[15:0] count; 
reg[24:0]count1ms; 
reg[3:0] cnt; 
reg[2:0]number; 
reg[1:0] state; 
//reg[3:0] segcs; 
reg[2:0] U2_138_A; 
reg ledcs; 
reg [7:0]segdata; 
reg[7:0]dataout; 
reg[16:0]tenvalue; 
parameter sample=2'b00, 
          display=2'b01; 
			 
assign  U2_138_select = 1 ;   //数码管138工作    Digital tube  work
assign  U3_138_select = 0 ;   //点阵138不工作   dot array not work
/**********产生200K的信号*********/ 
always@(posedge clk) 
  begin 
    if(count<=300)  
      count<=count+1'b1;     
    else 
      begin  
      count<=0;  
      ioclk<=~ioclk;  
      end 
 end 
/*******获取1MS的信号*********/ 
always@(posedge clk) 
  begin  
    if(count1ms>25'd1000_0)//1ms的时间 
      begin 
      clk1ms<=~clk1ms; 
      count1ms<=0; 
      end 
    else 
      count1ms<=count1ms+1; 
  end 
/*********AD采样程序**************/ 
always@(negedge ioclk) 
   begin 
     case(state) 
      sample: 
       begin 
        cs<=0; 
        dataout[7:0]<={dataout[6:0],data};  
        if(cnt>4'd7)  
           begin 
           cnt<=0; 
           state<=display;   
           end   
        else 
           begin 
           cnt<=cnt+1; 
           state<=sample; 
           end 
        end 
       display:
          begin 
           cs<=1;//关AD片选  
           tenvalue<=(tendata((dataout>>4)&8'b0000_1111)*16+ tendata(dataout&8'b0000_1111))*129;// 
           //得到采集的数据   Get AD data
           state<=sample; 
          end 
      default: state<=display; 
    endcase 
  end 
/***********2进制转十进制函数*************/ 
function[7:0] tendata;//返回一个4位的数字 
input[7:0]   datain; 
begin 
 case(datain) 
    4'b00000000: tendata=4'd0;//0 
    4'b00000001: tendata=4'd1;//1 
 	4'bd00000010: tendata=4'd2;//2 
    4'b00000011: tendata=4'd3;//3 
    4'b00000100: tendata=4'd4;//4 
    4'b00000101: tendata=4'd5;//5 
    4'b00000110: tendata=4'd6;//6 
    4'bd00000111: tendata=4'd7;//7 
    4'b00001000: tendata=4'd8;//8 
    4'b00001001: tendata=4'd9;//9 
    4'b00001010: tendata=4'd10;// 
    4'b00001011: tendata=4'd11;// 
    4'b00001100: tendata=4'd12; 
    4'b00001101: tendata=4'd13; 
    4'b00001110: tendata=4'd14; 
    4'b00001111: tendata=4'd15; 
   default:tendata=4'bzzzz_zzzz; 
 endcase 
end 
endfunction 
 
 
 
 
/*********十进制转LED段选函数*********/ 
function[7:0] leddata;//返回一个8位的数字 
input[3:0]    datain; 
begin 
  case(datain) 
    4'd0: leddata=8'b11000000;//0 
    4'd1: leddata=8'b11111001;//1 
    4'd2: leddata=8'b10100100;//2 
    4'd3: leddata=8'b10110000;//3 
    4'd4: leddata=8'b10011001;//4 
    4'd5: leddata=8'b10010010;//5 
    4'd6: leddata=8'b10000010;//6 
    4'd7: leddata=8'b11111000;//7 
    4'd8: leddata=8'b10000000;//8 
    4'd9: leddata=8'b10010000;//9 
    4'd10: leddata=8'b10111111;//- 
    4'd11: leddata=8'b01111111;//. 
    default:leddata=8'bzzzz_zzzz; 
   endcase 
end 
endfunction 
 
 
/********扫描函数*************/ 
always@(posedge clk1ms) 
 begin 
    if(number==5) number<=0; 
    else  
    begin  
	    number<=number+1; 
	    case(number)  
	     4'd0: 
	        begin 
	        segdata<=leddata((tenvalue/10)%10);//个位  A bit
	        U2_138_A<=4'b000;  
	        end 
	     4'd1: 
	        begin 
	        segdata<=leddata((tenvalue/100)%10);//十位 ten bit
	        U2_138_A<=4'b001; 
	        end 
	     4'd2: 
	        begin 
	        segdata<=leddata((tenvalue/1000)%10); //hundred bit  
	        U2_138_A<=4'b010; 
	        end 
	     4'd3: 
	        begin 
	        segdata<=leddata(tenvalue/10000);//千位  thousand bit
	        U2_138_A<=4'b0011; 
	        end 
	     4'd4: 
	        begin 
	        segdata<=leddata(4'd11);//.   显示小数点  Display decimal point
	        U2_138_A<=4'b0011; 
	        end 
		endcase 
	end 
end     
  
endmodule
