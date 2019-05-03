--通用偶数分频器
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity  gen_div is
	generic(div_param:integer:=1);
	--分频因子,分频为2*div_param，默认2分频
	port
	(
		clk:in std_logic;--输入时钟
		bclk:out std_logic;--分频输出
		resetb:in std_logic--复位信号
	);
end gen_div;

architecture behave of gen_div is
signal tmp:std_logic;--输出暂存寄存器
signal cnt:integer range 0 to div_param:=0;--计数寄存器
begin
------------------------------
	process(clk,resetb)
	begin
		if resetb='1' then --reset有效时,bclk始终是0
			cnt<=0;
			tmp<='0';
		elsif rising_edge(clk) then
			cnt<=cnt+1;
			if cnt=div_param-1 then
				tmp<=not tmp;--取反信号
				cnt<=0;
			end if;
		end if;
	end process;
	bclk<=tmp;--输出
--------------------------------
end behave;

