--深圳市21EDA电子
--开发板型号:A-C8V4
--www.21eda.com
--学习点亮一个LED简单的实验。
--我们的开发板LED灯对应的I/O为0时，LED灯亮。
--本实验。按下板上一个按键key1时来控制LED灯。
--不按键，灯不亮，按下就亮。
--视频教程适合我们21EDA电子的所有学习板

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity KEY_LED is
port (
key_in  : in std_logic ;   --定义一个KEY INPUT
led_out : out std_logic    --定义一个LED OUTPUT
);
end KEY_LED;

architecture key_led_arch of KEY_LED is
begin
led_out <= key_in  ; --如果没有按键，LED口对应的状态时高电平。
                     --按下按键后，LED口对应的状态时低电平，灯就会亮
end architecture;
