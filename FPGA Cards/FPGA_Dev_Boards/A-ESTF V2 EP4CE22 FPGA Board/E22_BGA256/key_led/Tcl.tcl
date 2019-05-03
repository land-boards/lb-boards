#���ڲ�ʹ�õĹܽŴ���--������̬
set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"
#��ɾ�����йܽŷ���
remove_all_instance_assignments -name *

#gloabl clk 
#set_location_assignment PIN_12 -to clkin
#led
set_location_assignment PIN_16 -to Led[0] 
set_location_assignment PIN_17 -to Led[1]
set_location_assignment PIN_18 -to Led[2]
#key
set_location_assignment PIN_29 -to Key[0] 
set_location_assignment PIN_34 -to Key[1]
set_location_assignment PIN_33 -to Key[2]