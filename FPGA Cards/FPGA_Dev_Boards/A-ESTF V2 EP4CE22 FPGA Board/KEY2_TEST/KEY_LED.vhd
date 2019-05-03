
--www.21eda.net

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity KEY_LED is
port (
key_in  : in std_logic ;   --KEY INPUT
led_out : out std_logic    --LED OUTPUT
);
end KEY_LED;

architecture key_led_arch of KEY_LED is
begin
led_out <= key_in  ; 
                     
end architecture;
