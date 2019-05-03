#对于不使用的管脚处理--输入三态
set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"
#先删除所有管脚分配
remove_all_instance_assignments -name *

#gloabl clk and reset
set_location_assignment PIN_12 -to clkin
set_location_assignment PIN_27 -to resetin 

#set_location_assignment PIN_1 -to kbdata
#set_location_assignment PIN_2 -to kbclk

#set_location_assignment PIN_16 -to hsync
#set_location_assignment PIN_15 -to vsync


#set_location_assignment PIN_19 -to r
#set_location_assignment PIN_18 -to g
#set_location_assignment PIN_17 -to b

#set_location_assignment PIN_82 -to lcd_data[0]
#set_location_assignment PIN_83 -to lcd_data[1]
#set_location_assignment PIN_84 -to lcd_data[2]
#set_location_assignment PIN_85 -to lcd_data[3]
#set_location_assignment PIN_86 -to lcd_data[4]
#set_location_assignment PIN_87 -to lcd_data[5]
#set_location_assignment PIN_88 -to lcd_data[6]
#set_location_assignment PIN_89 -to lcd_data[7]

#set_location_assignment PIN_81 -to lcd_e
#set_location_assignment PIN_6 -to lcd_rw
#set_location_assignment PIN_5 -to lcd_rs

#set_location_assignment PIN_50 -to txd_out

#dac0832
#set_location_assignment PIN_38 -to data_out[0]
#set_location_assignment PIN_37 -to data_out[1]
#set_location_assignment PIN_36 -to data_out[2]
#set_location_assignment PIN_35 -to data_out[3]
#set_location_assignment PIN_20 -to data_out[4]
#set_location_assignment PIN_29 -to data_out[5]
#set_location_assignment PIN_30 -to data_out[6]
#set_location_assignment PIN_33 -to data_out[7]

#set_location_assignment PIN_21 -to ile_sig
#set_location_assignment PIN_34 -to ctl_sig

set_location_assignment PIN_42 -to sync_out
set_location_assignment PIN_41 -to sclk_out
set_location_assignment PIN_44 -to da_data_out








