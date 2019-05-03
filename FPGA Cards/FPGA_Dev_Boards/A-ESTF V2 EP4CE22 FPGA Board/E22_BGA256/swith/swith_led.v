//视飓芯微电子
//电话 15815519071 QQ 906606596
//Email 906606596@qq.com
//拨码开关的 1 2 3 4 5 6 7 8作为输入
//本实验采用拨码开关来控制LED灯

// dial switch 12345678 as input
// this experiment adopts dial switch to control the LED lights

module swith_led(
		switch,
		led
		);					    // 模块名led
		
input	[7:0] 	switch;		    //拨码开关 swith input
output	[7:0]	led;			//LED灯输出显示 led output

assign led =	switch;			//把拨码开关的数据在LED灯上面显示  swith to led

endmodule