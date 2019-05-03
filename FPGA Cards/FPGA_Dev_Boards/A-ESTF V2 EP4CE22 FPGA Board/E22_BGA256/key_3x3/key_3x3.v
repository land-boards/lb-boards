//视飓芯微电子
//电话 15815519071 QQ 906606596
//Email 906606596@qq.com
//3X3矩阵按键,数码管会显示按下后不同的数值。说明检测成功。
//3X3 matrix button, digital tube will display different values after the press. Description successful detection.
module key_3x3(
  input            i_clk,
  input            i_rst_n,
  output     [2:0] U2_128_A,        //数码管138地址 138 digital tube address
  output     U2_138_select,         //数码管138选择 Digital tube 138 options
  output     U3_138_select,        //点阵138选择 dot array 138 selection
  input      [2:0] row,                 // 矩阵键盘 行 Matrix keyboard  row
  output reg [2:0] col,                 // 矩阵键盘 列 Matrix keyboard  column
  output reg [7:0] keyboard_val         // 数码管显示  Digital tube display
  
);
assign  U7_128_A = 0;       //选择一位数码管工作 Choose a digital tube
assign  U2_138_select = 1 ; //使能数码管工作 Enable digital work
assign  U3_138_select = 0 ; //禁止点阵工作 don.t let  Dot matrix work
//++++++++++++++++++++++++++++++++++++++
// 分频部分 开始
//++++++++++++++++++++++++++++++++++++++
reg [19:0] cnt;                         // 计数子

always @ (posedge i_clk, negedge i_rst_n)
  if (!i_rst_n)
    cnt <= 0;
  else
    cnt <= cnt + 1'b1;

wire key_clk = cnt[19];                // (2^20/50M = 21)ms 
//--------------------------------------
// 分频部分 结束
//--------------------------------------


//++++++++++++++++++++++++++++++++++++++
// 状态机部分 开始
//++++++++++++++++++++++++++++++++++++++
// 状态数较少，独热码编码
parameter NO_KEY_PRESSED = 6'b000_001;  // 没有按键按下  
parameter SCAN_COL0      = 6'b000_010;  // 扫描第0列 
parameter SCAN_COL1      = 6'b000_100;  // 扫描第1列 
parameter SCAN_COL2      = 6'b001_000;  // 扫描第2列 

parameter KEY_PRESSED    = 6'b010_000;  // 有按键按下

reg [5:0] current_state, next_state;    // 现态、次态

always @ (posedge key_clk, negedge i_rst_n)
  if (!i_rst_n)
    current_state <= NO_KEY_PRESSED;
  else
    current_state <= next_state;

// 根据条件转移状态
always @ *
  case (current_state)
    NO_KEY_PRESSED :                    // 没有按键按下
        if (row != 3'h7)
          next_state = SCAN_COL0;
        else
          next_state = NO_KEY_PRESSED;
    SCAN_COL0 :                         // 扫描第0列 
        if (row != 3'h7)
          next_state = KEY_PRESSED;
        else
          next_state = SCAN_COL1;
    SCAN_COL1 :                         // 扫描第1列 
        if (row != 3'h7)
          next_state = KEY_PRESSED;
        else
          next_state = SCAN_COL2;    
    SCAN_COL2 :                         // 扫描第2列
        if (row != 3'h7)
          next_state = KEY_PRESSED;
        else
          next_state = NO_KEY_PRESSED;

    KEY_PRESSED :                       // 有按键按下
        if (row != 3'h7)
          next_state = KEY_PRESSED;
        else
          next_state = NO_KEY_PRESSED;                      
  endcase

reg       key_pressed_flag;             // 键盘按下标志
reg [2:0] col_val, row_val;             // 列值、行值

// 根据次态，给相应寄存器赋值
always @ (posedge key_clk, negedge i_rst_n)
  if (!i_rst_n)
  begin
    col              <= 4'h0;
    key_pressed_flag <=    0;
  end
  else
    case (next_state)
      NO_KEY_PRESSED :                  // 没有按键按下
      begin
        col              <= 3'h0;
        key_pressed_flag <=    0;       // 清键盘按下标志
      end
      SCAN_COL0 :                       // 扫描第0列
        col <= 3'b110;
      SCAN_COL1 :                       // 扫描第1列
        col <= 3'b101;
      SCAN_COL2 :                       // 扫描第2列
        col <= 3'b011;

      KEY_PRESSED :                     // 有按键按下
      begin
        col_val          <= col;        // 锁存列值
        row_val          <= row;        // 锁存行值
        key_pressed_flag <= 1;          // 置键盘按下标志  
      end
    endcase
//--------------------------------------
// 状态机部分 结束
//--------------------------------------


//++++++++++++++++++++++++++++++++++++++
// 扫描行列值部分 开始
//++++++++++++++++++++++++++++++++++++++
always @ (posedge key_clk, negedge i_rst_n)
  if (!i_rst_n)
    keyboard_val <= 3'h0;
  else
    if (key_pressed_flag)
      case ({row_val, col_val})
 
        6'b110_101 : keyboard_val <= 8'b1010_0100; //2
        6'b011_101 : keyboard_val <= 8'b1000_0000; //8
        6'b101_101 : keyboard_val <= 8'b1001_0010; //5
		  
        6'b101_011 : keyboard_val <= 8'b1000_0010;// 6
        6'b110_011 : keyboard_val <= 8'b1011_0000;// 3
        6'b011_011 : keyboard_val <= 8'b1001_0000;// 9
        
        6'b110_110 : keyboard_val <= 8'b1111_1001; //1
		  6'b101_110 : keyboard_val <= 8'b1001_1001;// 4
		  6'b011_110 : keyboard_val <= 8'b1111_1000; //7


      
      endcase
//--------------------------------------
//  扫描行列值部分 结束
//--------------------------------------
      
endmodule
