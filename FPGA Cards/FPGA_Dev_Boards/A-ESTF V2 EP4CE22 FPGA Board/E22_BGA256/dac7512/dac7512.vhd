--视飓芯微电子
--电话 15815519071 QQ 906606596
--Email 906606596@qq.com
--dac7512DA输出，锯齿波形成
--实验结果可以通过LED11观察
--dac7512DA output, sawtooth wave formation
--The experimental results can be observed by LED11
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity dac7512 is
	port
	(
		clkin,resetin:in std_logic;--时钟，复位信号输入 CLK 50M
		sync_out:out std_logic;--dac7512帧同步信号，低有效 Dac7512 frame sync signal, low effective
		sclk_out:out std_logic;--dac7512时钟信号   Dac7512 clock signal
		da_data_out:out std_logic--dac7512数据位输出  Dac7512 data bit output
	);
end dac7512;

architecture behave of dac7512 is
	component gen_div is--分频元件调用声明
	generic(div_param:integer:=2);--默认是4分频
	port
	(
		clk:in std_logic;
		bclk:out std_logic;
		resetb:in std_logic
	);
	end component;	
----
signal sclk_out_tmp:std_logic;
signal sync_out_tmp:std_logic;
signal data_out:std_logic_vector(15 downto 0);--需要转换模拟信号的数字量,修改该值的DB11～DB0可改变输出的模拟量
--- need to convert analog signal to digital quantity, modify the value of DB11 ~ DB0 can change the output analog
----
begin
----
sclk_out<=sclk_out_tmp;--da7512的时钟，1MHz
sync_out<=sync_out_tmp;--da7512片选
----
gen_1M: --分频产生1MHz脉冲
		gen_div generic map(20)--40分频的,产生1MHz脉冲  40 frequency divider, 1MHz pulse generation
		port map--分频元件例化
		(
			clk=>clkin,
			resetb=>not resetin,
			bclk=>sclk_out_tmp
		);
---
	process(sclk_out_tmp,resetin)
	variable cnt:integer range 0 to 32:=0;
	begin
		if resetin='0' then
			sync_out_tmp<='1';
			da_data_out<='0';
			cnt:=0;
			data_out<=X"0000";--正常工作模式，修改该值的DB11～DB0可改变输出的模拟量
			--Normal operating mode, modify the value of DB11 ~ DB0 can change the output analog
		elsif rising_edge(sclk_out_tmp) then
			cnt:=cnt+1;
			if cnt=1 then
				sync_out_tmp<='1';--帧同步无效
			elsif cnt>=2 and cnt<18 then
				sync_out_tmp<='0';----帧同步有效
				da_data_out<=data_out(17-cnt);--移位输出，MSB
			elsif cnt=18 then
				sync_out_tmp<='1';
				cnt:=0;--循环转换数据
				data_out<=data_out+'1';--自增该值的DB11～DB0来改变输出的模拟量(DB15-DB12固定为0--正常工作模式),锯齿波
				--Increase the value of the DB11 ~ DB0 to change the analog output (DB15-DB12 fixed to 0-- normal mode), sawtooth wave
				if data_out=X"0FFE" then
					data_out<=X"0000";
				end if;
			end if;
		end if;
	end process;
end behave;