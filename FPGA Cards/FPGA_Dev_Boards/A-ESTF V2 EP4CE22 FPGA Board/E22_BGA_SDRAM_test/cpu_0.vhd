--Legal Notice: (C)2017 Altera Corporation. All rights reserved.  Your
--use of Altera Corporation's design tools, logic functions and other
--software and tools, and its AMPP partner logic functions, and any
--output files any of the foregoing (including device programming or
--simulation files), and any associated documentation or information are
--expressly subject to the terms and conditions of the Altera Program
--License Subscription Agreement or other applicable license agreement,
--including, without limitation, that your use is for the sole purpose
--of programming logic devices manufactured by Altera and sold by Altera
--or its authorized distributors.  Please refer to the applicable
--agreement for further details.


-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lpm;
use lpm.all;

entity cpu_0_register_bank_a_module is 
        generic (
                 lpm_file : STRING := "UNUSED"
                 );
        port (
              -- inputs:
                 signal clock : IN STD_LOGIC;
                 signal data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal rdaddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                 signal wraddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                 signal wren : IN STD_LOGIC;

              -- outputs:
                 signal q : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
              );
end entity cpu_0_register_bank_a_module;


architecture europa of cpu_0_register_bank_a_module is
  component altsyncram is
GENERIC (
      address_reg_b : STRING;
        init_file : STRING;
        maximum_depth : NATURAL;
        numwords_a : NATURAL;
        numwords_b : NATURAL;
        operation_mode : STRING;
        outdata_reg_b : STRING;
        ram_block_type : STRING;
        rdcontrol_reg_b : STRING;
        read_during_write_mode_mixed_ports : STRING;
        width_a : NATURAL;
        width_b : NATURAL;
        widthad_a : NATURAL;
        widthad_b : NATURAL
      );
    PORT (
    signal q_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        signal wren_a : IN STD_LOGIC;
        signal clock0 : IN STD_LOGIC;
        signal address_a : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        signal address_b : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        signal data_a : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
      );
  end component altsyncram;
                signal ram_q :  STD_LOGIC_VECTOR (31 DOWNTO 0);

begin

  q <= ram_q;
  the_altsyncram : altsyncram
    generic map(
      address_reg_b => "CLOCK0",
      init_file => lpm_file,
      maximum_depth => 0,
      numwords_a => 32,
      numwords_b => 32,
      operation_mode => "DUAL_PORT",
      outdata_reg_b => "UNREGISTERED",
      ram_block_type => "AUTO",
      rdcontrol_reg_b => "CLOCK0",
      read_during_write_mode_mixed_ports => "DONT_CARE",
      width_a => 32,
      width_b => 32,
      widthad_a => 5,
      widthad_b => 5
    )
    port map(
            address_a => wraddress,
            address_b => rdaddress,
            clock0 => clock,
            data_a => data,
            q_b => ram_q,
            wren_a => wren
    );


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lpm;
use lpm.all;

entity cpu_0_register_bank_b_module is 
        generic (
                 lpm_file : STRING := "UNUSED"
                 );
        port (
              -- inputs:
                 signal clock : IN STD_LOGIC;
                 signal data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal rdaddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                 signal wraddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                 signal wren : IN STD_LOGIC;

              -- outputs:
                 signal q : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
              );
end entity cpu_0_register_bank_b_module;


architecture europa of cpu_0_register_bank_b_module is
  component altsyncram is
GENERIC (
      address_reg_b : STRING;
        init_file : STRING;
        maximum_depth : NATURAL;
        numwords_a : NATURAL;
        numwords_b : NATURAL;
        operation_mode : STRING;
        outdata_reg_b : STRING;
        ram_block_type : STRING;
        rdcontrol_reg_b : STRING;
        read_during_write_mode_mixed_ports : STRING;
        width_a : NATURAL;
        width_b : NATURAL;
        widthad_a : NATURAL;
        widthad_b : NATURAL
      );
    PORT (
    signal q_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        signal wren_a : IN STD_LOGIC;
        signal clock0 : IN STD_LOGIC;
        signal address_a : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        signal address_b : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        signal data_a : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
      );
  end component altsyncram;
                signal ram_q :  STD_LOGIC_VECTOR (31 DOWNTO 0);

begin

  q <= ram_q;
  the_altsyncram : altsyncram
    generic map(
      address_reg_b => "CLOCK0",
      init_file => lpm_file,
      maximum_depth => 0,
      numwords_a => 32,
      numwords_b => 32,
      operation_mode => "DUAL_PORT",
      outdata_reg_b => "UNREGISTERED",
      ram_block_type => "AUTO",
      rdcontrol_reg_b => "CLOCK0",
      read_during_write_mode_mixed_ports => "DONT_CARE",
      width_a => 32,
      width_b => 32,
      widthad_a => 5,
      widthad_b => 5
    )
    port map(
            address_a => wraddress,
            address_b => rdaddress,
            clock0 => clock,
            data_a => data,
            q_b => ram_q,
            wren_a => wren
    );


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_oci_debug is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal dbrk_break : IN STD_LOGIC;
                 signal debugreq : IN STD_LOGIC;
                 signal hbreak_enabled : IN STD_LOGIC;
                 signal jdo : IN STD_LOGIC_VECTOR (37 DOWNTO 0);
                 signal jrst_n : IN STD_LOGIC;
                 signal ocireg_ers : IN STD_LOGIC;
                 signal ocireg_mrs : IN STD_LOGIC;
                 signal reset : IN STD_LOGIC;
                 signal st_ready_test_idle : IN STD_LOGIC;
                 signal take_action_ocimem_a : IN STD_LOGIC;
                 signal take_action_ocireg : IN STD_LOGIC;
                 signal xbrk_break : IN STD_LOGIC;

              -- outputs:
                 signal debugack : OUT STD_LOGIC;
                 signal monitor_error : OUT STD_LOGIC;
                 signal monitor_go : OUT STD_LOGIC;
                 signal monitor_ready : OUT STD_LOGIC;
                 signal oci_hbreak_req : OUT STD_LOGIC;
                 signal resetlatch : OUT STD_LOGIC;
                 signal resetrequest : OUT STD_LOGIC
              );
end entity cpu_0_nios2_oci_debug;


architecture europa of cpu_0_nios2_oci_debug is
                signal internal_debugack :  STD_LOGIC;
                signal internal_resetlatch :  STD_LOGIC;
                signal jtag_break :  STD_LOGIC;
                signal probepresent :  STD_LOGIC;
attribute ALTERA_ATTRIBUTE : string;
attribute ALTERA_ATTRIBUTE of jtag_break : signal is "SUPPRESS_DA_RULE_INTERNAL=""D101,R101""";
attribute ALTERA_ATTRIBUTE of monitor_error : signal is "SUPPRESS_DA_RULE_INTERNAL=D101";
attribute ALTERA_ATTRIBUTE of monitor_go : signal is "SUPPRESS_DA_RULE_INTERNAL=D101";
attribute ALTERA_ATTRIBUTE of monitor_ready : signal is "SUPPRESS_DA_RULE_INTERNAL=D101";
attribute ALTERA_ATTRIBUTE of probepresent : signal is "SUPPRESS_DA_RULE_INTERNAL=""D101,R101""";
attribute ALTERA_ATTRIBUTE of resetlatch : signal is "SUPPRESS_DA_RULE_INTERNAL=""D101,R101""";
attribute ALTERA_ATTRIBUTE of resetrequest : signal is "SUPPRESS_DA_RULE_INTERNAL=""D101,R101""";

begin

  process (clk, jrst_n)
  begin
    if jrst_n = '0' then
      probepresent <= std_logic'('0');
      resetrequest <= std_logic'('0');
      jtag_break <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(take_action_ocimem_a) = '1' then 
        resetrequest <= jdo(22);
        jtag_break <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(jdo(21)) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(jdo(20)) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(jtag_break))))));
        probepresent <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(jdo(19)) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(jdo(18)) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(probepresent))))));
        internal_resetlatch <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(jdo(24)) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(internal_resetlatch)))));
      elsif std_logic'(reset) = '1' then 
        jtag_break <= probepresent;
        internal_resetlatch <= std_logic'('1');
      elsif std_logic'(((NOT internal_debugack AND debugreq) AND probepresent)) = '1' then 
        jtag_break <= std_logic'('1');
      end if;
    end if;

  end process;

  process (clk, jrst_n)
  begin
    if jrst_n = '0' then
      monitor_ready <= std_logic'('0');
      monitor_error <= std_logic'('0');
      monitor_go <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((take_action_ocimem_a AND jdo(25))) = '1' then 
        monitor_ready <= std_logic'('0');
      elsif std_logic'((take_action_ocireg AND ocireg_mrs)) = '1' then 
        monitor_ready <= std_logic'('1');
      end if;
      if std_logic'((take_action_ocimem_a AND jdo(25))) = '1' then 
        monitor_error <= std_logic'('0');
      elsif std_logic'((take_action_ocireg AND ocireg_ers)) = '1' then 
        monitor_error <= std_logic'('1');
      end if;
      if std_logic'((take_action_ocimem_a AND jdo(23))) = '1' then 
        monitor_go <= std_logic'('1');
      elsif std_logic'(st_ready_test_idle) = '1' then 
        monitor_go <= std_logic'('0');
      end if;
    end if;

  end process;

  oci_hbreak_req <= ((jtag_break OR dbrk_break) OR xbrk_break) OR debugreq;
  internal_debugack <= NOT hbreak_enabled;
  --vhdl renameroo for output signals
  debugack <= internal_debugack;
  --vhdl renameroo for output signals
  resetlatch <= internal_resetlatch;

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lpm;
use lpm.all;

entity cpu_0_ociram_lpm_dram_bdp_component_module is 
        generic (
                 lpm_file : STRING := "UNUSED"
                 );
        port (
              -- inputs:
                 signal address_a : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal address_b : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal byteena_a : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal clock0 : IN STD_LOGIC;
                 signal clock1 : IN STD_LOGIC;
                 signal clocken0 : IN STD_LOGIC;
                 signal clocken1 : IN STD_LOGIC;
                 signal data_a : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal data_b : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal wren_a : IN STD_LOGIC;
                 signal wren_b : IN STD_LOGIC;

              -- outputs:
                 signal q_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal q_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
              );
end entity cpu_0_ociram_lpm_dram_bdp_component_module;


architecture europa of cpu_0_ociram_lpm_dram_bdp_component_module is
  component altsyncram is
GENERIC (
      address_aclr_a : STRING;
        address_aclr_b : STRING;
        address_reg_b : STRING;
        indata_aclr_a : STRING;
        indata_aclr_b : STRING;
        init_file : STRING;
        intended_device_family : STRING;
        lpm_type : STRING;
        numwords_a : NATURAL;
        numwords_b : NATURAL;
        operation_mode : STRING;
        outdata_aclr_a : STRING;
        outdata_aclr_b : STRING;
        outdata_reg_a : STRING;
        outdata_reg_b : STRING;
        ram_block_type : STRING;
        read_during_write_mode_mixed_ports : STRING;
        width_a : NATURAL;
        width_b : NATURAL;
        width_byteena_a : NATURAL;
        widthad_a : NATURAL;
        widthad_b : NATURAL;
        wrcontrol_aclr_a : STRING;
        wrcontrol_aclr_b : STRING
      );
    PORT (
    signal q_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        signal q_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        signal wren_a : IN STD_LOGIC;
        signal data_b : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        signal clock0 : IN STD_LOGIC;
        signal clocken0 : IN STD_LOGIC;
        signal byteena_a : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        signal clocken1 : IN STD_LOGIC;
        signal wren_b : IN STD_LOGIC;
        signal clock1 : IN STD_LOGIC;
        signal address_a : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        signal address_b : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        signal data_a : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
      );
  end component altsyncram;
                signal internal_q_a :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal internal_q_b :  STD_LOGIC_VECTOR (31 DOWNTO 0);

begin

  the_altsyncram : altsyncram
    generic map(
      address_aclr_a => "NONE",
      address_aclr_b => "NONE",
      address_reg_b => "CLOCK1",
      indata_aclr_a => "NONE",
      indata_aclr_b => "NONE",
      init_file => lpm_file,
      intended_device_family => "CYCLONEIVE",
      lpm_type => "altsyncram",
      numwords_a => 256,
      numwords_b => 256,
      operation_mode => "BIDIR_DUAL_PORT",
      outdata_aclr_a => "NONE",
      outdata_aclr_b => "NONE",
      outdata_reg_a => "UNREGISTERED",
      outdata_reg_b => "UNREGISTERED",
      ram_block_type => "AUTO",
      read_during_write_mode_mixed_ports => "OLD_DATA",
      width_a => 32,
      width_b => 32,
      width_byteena_a => 4,
      widthad_a => 8,
      widthad_b => 8,
      wrcontrol_aclr_a => "NONE",
      wrcontrol_aclr_b => "NONE"
    )
    port map(
            address_a => address_a,
            address_b => address_b,
            byteena_a => byteena_a,
            clock0 => clock0,
            clock1 => clock1,
            clocken0 => clocken0,
            clocken1 => clocken1,
            data_a => data_a,
            data_b => data_b,
            q_a => internal_q_a,
            q_b => internal_q_b,
            wren_a => wren_a,
            wren_b => wren_b
    );

  --vhdl renameroo for output signals
  q_a <= internal_q_a;
  --vhdl renameroo for output signals
  q_b <= internal_q_b;

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_ocimem is 
        port (
              -- inputs:
                 signal address : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                 signal begintransfer : IN STD_LOGIC;
                 signal byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal chipselect : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal debugaccess : IN STD_LOGIC;
                 signal jdo : IN STD_LOGIC_VECTOR (37 DOWNTO 0);
                 signal jrst_n : IN STD_LOGIC;
                 signal resetrequest : IN STD_LOGIC;
                 signal take_action_ocimem_a : IN STD_LOGIC;
                 signal take_action_ocimem_b : IN STD_LOGIC;
                 signal take_no_action_ocimem_a : IN STD_LOGIC;
                 signal write : IN STD_LOGIC;
                 signal writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

              -- outputs:
                 signal MonDReg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal oci_ram_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
              );
end entity cpu_0_nios2_ocimem;


architecture europa of cpu_0_nios2_ocimem is
component cpu_0_ociram_lpm_dram_bdp_component_module is 
           generic (
                    lpm_file : STRING := "UNUSED"
                    );
           port (
                 -- inputs:
                    signal address_a : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal address_b : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal byteena_a : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal clock0 : IN STD_LOGIC;
                    signal clock1 : IN STD_LOGIC;
                    signal clocken0 : IN STD_LOGIC;
                    signal clocken1 : IN STD_LOGIC;
                    signal data_a : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal data_b : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal wren_a : IN STD_LOGIC;
                    signal wren_b : IN STD_LOGIC;

                 -- outputs:
                    signal q_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal q_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component cpu_0_ociram_lpm_dram_bdp_component_module;

                signal MonAReg :  STD_LOGIC_VECTOR (10 DOWNTO 0);
                signal MonRd :  STD_LOGIC;
                signal MonRd1 :  STD_LOGIC;
                signal MonWr :  STD_LOGIC;
                signal avalon :  STD_LOGIC;
                signal cfgdout :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal internal_MonDReg :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal internal_oci_ram_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal module_input :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal module_input1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal module_input2 :  STD_LOGIC;
                signal module_input3 :  STD_LOGIC;
                signal module_input4 :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal module_input5 :  STD_LOGIC;
                signal sramdout :  STD_LOGIC_VECTOR (31 DOWNTO 0);
attribute ALTERA_ATTRIBUTE : string;
attribute ALTERA_ATTRIBUTE of MonDReg, MonAReg, MonRd1, MonRd, MonWr : signal is "SUPPRESS_DA_RULE_INTERNAL=""D101,D103,R101""";
  --synthesis translate_off
constant cpu_0_ociram_lpm_dram_bdp_component_lpm_file : string := "cpu_0_ociram_default_contents.hex";
--synthesis translate_on
--synthesis read_comments_as_HDL on
--constant cpu_0_ociram_lpm_dram_bdp_component_lpm_file : string := "cpu_0_ociram_default_contents.mif";
--synthesis read_comments_as_HDL off


begin

  avalon <= begintransfer AND NOT resetrequest;
  process (clk, jrst_n)
  begin
    if jrst_n = '0' then
      MonWr <= std_logic'('0');
      MonRd <= std_logic'('0');
      MonRd1 <= std_logic'('0');
      MonAReg <= std_logic_vector'("00000000000");
      internal_MonDReg <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(take_no_action_ocimem_a) = '1' then 
        MonAReg(10 DOWNTO 2) <= A_EXT (((std_logic_vector'("000000000000000000000000") & (MonAReg(10 DOWNTO 2))) + std_logic_vector'("000000000000000000000000000000001")), 9);
        MonRd <= std_logic'('1');
      elsif std_logic'(take_action_ocimem_a) = '1' then 
        MonAReg(10 DOWNTO 2) <= Std_Logic_Vector'(A_ToStdLogicVector(jdo(17)) & jdo(33 DOWNTO 26));
        MonRd <= std_logic'('1');
      elsif std_logic'(take_action_ocimem_b) = '1' then 
        MonAReg(10 DOWNTO 2) <= A_EXT (((std_logic_vector'("000000000000000000000000") & (MonAReg(10 DOWNTO 2))) + std_logic_vector'("000000000000000000000000000000001")), 9);
        internal_MonDReg <= jdo(34 DOWNTO 3);
        MonWr <= std_logic'('1');
      else
        if std_logic'(NOT avalon) = '1' then 
          MonWr <= std_logic'('0');
          MonRd <= std_logic'('0');
        end if;
        if std_logic'(MonRd1) = '1' then 
          internal_MonDReg <= A_WE_StdLogicVector((std_logic'(MonAReg(10)) = '1'), cfgdout, sramdout);
        end if;
      end if;
      MonRd1 <= MonRd;
    end if;

  end process;

  --cpu_0_ociram_lpm_dram_bdp_component, which is an nios_tdp_ram
  cpu_0_ociram_lpm_dram_bdp_component : cpu_0_ociram_lpm_dram_bdp_component_module
    generic map(
      lpm_file => cpu_0_ociram_lpm_dram_bdp_component_lpm_file
    )
    port map(
      q_a => internal_oci_ram_readdata,
      q_b => sramdout,
      address_a => module_input,
      address_b => module_input1,
      byteena_a => byteenable,
      clock0 => clk,
      clock1 => clk,
      clocken0 => module_input2,
      clocken1 => module_input3,
      data_a => writedata,
      data_b => module_input4,
      wren_a => module_input5,
      wren_b => MonWr
    );

  module_input <= address(7 DOWNTO 0);
  module_input1 <= MonAReg(9 DOWNTO 2);
  module_input2 <= std_logic'('1');
  module_input3 <= std_logic'('1');
  module_input4 <= internal_MonDReg(31 DOWNTO 0);
  module_input5 <= ((chipselect AND write) AND debugaccess) AND NOT address(8);

  cfgdout <= A_WE_StdLogicVector(((MonAReg(4 DOWNTO 2) = std_logic_vector'("000"))), std_logic_vector'("00000010000000000000000000100000"), A_WE_StdLogicVector(((MonAReg(4 DOWNTO 2) = std_logic_vector'("001"))), std_logic_vector'("00000000000000000001101100011011"), A_WE_StdLogicVector(((MonAReg(4 DOWNTO 2) = std_logic_vector'("010"))), std_logic_vector'("00000000000001000000000000000000"), A_WE_StdLogicVector(((MonAReg(4 DOWNTO 2) = std_logic_vector'("011"))), std_logic_vector'("00000000000000000000000000000000"), A_WE_StdLogicVector(((MonAReg(4 DOWNTO 2) = std_logic_vector'("100"))), std_logic_vector'("00100000000000000000000000000000"), A_WE_StdLogicVector(((MonAReg(4 DOWNTO 2) = std_logic_vector'("101"))), std_logic_vector'("00000100100000000001100000000000"), A_WE_StdLogicVector(((MonAReg(4 DOWNTO 2) = std_logic_vector'("110"))), std_logic_vector'("00000000000000000000000000000000"), std_logic_vector'("00000000000000000000000000000000"))))))));
  --vhdl renameroo for output signals
  MonDReg <= internal_MonDReg;
  --vhdl renameroo for output signals
  oci_ram_readdata <= internal_oci_ram_readdata;

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_avalon_reg is 
        port (
              -- inputs:
                 signal address : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                 signal chipselect : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal debugaccess : IN STD_LOGIC;
                 signal monitor_error : IN STD_LOGIC;
                 signal monitor_go : IN STD_LOGIC;
                 signal monitor_ready : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal write : IN STD_LOGIC;
                 signal writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

              -- outputs:
                 signal oci_ienable : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal oci_reg_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal oci_single_step_mode : OUT STD_LOGIC;
                 signal ocireg_ers : OUT STD_LOGIC;
                 signal ocireg_mrs : OUT STD_LOGIC;
                 signal take_action_ocireg : OUT STD_LOGIC
              );
end entity cpu_0_nios2_avalon_reg;


architecture europa of cpu_0_nios2_avalon_reg is
                signal internal_oci_ienable1 :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal internal_oci_single_step_mode1 :  STD_LOGIC;
                signal internal_take_action_ocireg :  STD_LOGIC;
                signal oci_reg_00_addressed :  STD_LOGIC;
                signal oci_reg_01_addressed :  STD_LOGIC;
                signal ocireg_sstep :  STD_LOGIC;
                signal take_action_oci_intr_mask_reg :  STD_LOGIC;
                signal write_strobe :  STD_LOGIC;

begin

  oci_reg_00_addressed <= to_std_logic((address = std_logic_vector'("100000000")));
  oci_reg_01_addressed <= to_std_logic((address = std_logic_vector'("100000001")));
  write_strobe <= (chipselect AND write) AND debugaccess;
  internal_take_action_ocireg <= write_strobe AND oci_reg_00_addressed;
  take_action_oci_intr_mask_reg <= write_strobe AND oci_reg_01_addressed;
  ocireg_ers <= writedata(1);
  ocireg_mrs <= writedata(0);
  ocireg_sstep <= writedata(3);
  oci_reg_readdata <= A_WE_StdLogicVector((std_logic'(oci_reg_00_addressed) = '1'), Std_Logic_Vector'(std_logic_vector'("0000000000000000000000000000") & A_ToStdLogicVector(internal_oci_single_step_mode1) & A_ToStdLogicVector(monitor_go) & A_ToStdLogicVector(monitor_ready) & A_ToStdLogicVector(monitor_error)), A_WE_StdLogicVector((std_logic'(oci_reg_01_addressed) = '1'), internal_oci_ienable1, std_logic_vector'("00000000000000000000000000000000")));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_oci_single_step_mode1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(internal_take_action_ocireg) = '1' then 
        internal_oci_single_step_mode1 <= ocireg_sstep;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_oci_ienable1 <= std_logic_vector'("00000000000000000000000000000011");
    elsif clk'event and clk = '1' then
      if std_logic'(take_action_oci_intr_mask_reg) = '1' then 
        internal_oci_ienable1 <= writedata OR NOT (std_logic_vector'("00000000000000000000000000000011"));
      end if;
    end if;

  end process;

  --vhdl renameroo for output signals
  oci_ienable <= internal_oci_ienable1;
  --vhdl renameroo for output signals
  oci_single_step_mode <= internal_oci_single_step_mode1;
  --vhdl renameroo for output signals
  take_action_ocireg <= internal_take_action_ocireg;

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_oci_break is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal dbrk_break : IN STD_LOGIC;
                 signal dbrk_goto0 : IN STD_LOGIC;
                 signal dbrk_goto1 : IN STD_LOGIC;
                 signal jdo : IN STD_LOGIC_VECTOR (37 DOWNTO 0);
                 signal jrst_n : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal take_action_break_a : IN STD_LOGIC;
                 signal take_action_break_b : IN STD_LOGIC;
                 signal take_action_break_c : IN STD_LOGIC;
                 signal take_no_action_break_a : IN STD_LOGIC;
                 signal take_no_action_break_b : IN STD_LOGIC;
                 signal take_no_action_break_c : IN STD_LOGIC;
                 signal xbrk_goto0 : IN STD_LOGIC;
                 signal xbrk_goto1 : IN STD_LOGIC;

              -- outputs:
                 signal break_readreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal dbrk_hit0_latch : OUT STD_LOGIC;
                 signal dbrk_hit1_latch : OUT STD_LOGIC;
                 signal dbrk_hit2_latch : OUT STD_LOGIC;
                 signal dbrk_hit3_latch : OUT STD_LOGIC;
                 signal trigbrktype : OUT STD_LOGIC;
                 signal trigger_state_0 : OUT STD_LOGIC;
                 signal trigger_state_1 : OUT STD_LOGIC;
                 signal xbrk_ctrl0 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal xbrk_ctrl1 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal xbrk_ctrl2 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal xbrk_ctrl3 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
              );
end entity cpu_0_nios2_oci_break;


architecture europa of cpu_0_nios2_oci_break is
                signal break_a_wpr :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal break_a_wpr_high_bits :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal break_a_wpr_low_bits :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal break_b_rr :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal break_c_rr :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal dbrk0_high_value :  STD_LOGIC;
                signal dbrk0_low_value :  STD_LOGIC;
                signal dbrk1_high_value :  STD_LOGIC;
                signal dbrk1_low_value :  STD_LOGIC;
                signal dbrk2_high_value :  STD_LOGIC;
                signal dbrk2_low_value :  STD_LOGIC;
                signal dbrk3_high_value :  STD_LOGIC;
                signal dbrk3_low_value :  STD_LOGIC;
                signal internal_trigger_state_0 :  STD_LOGIC;
                signal internal_trigger_state_1 :  STD_LOGIC;
                signal take_action_any_break :  STD_LOGIC;
                signal trigger_state :  STD_LOGIC;
                signal xbrk0_value :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal xbrk1_value :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal xbrk2_value :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal xbrk3_value :  STD_LOGIC_VECTOR (31 DOWNTO 0);
attribute ALTERA_ATTRIBUTE : string;
attribute ALTERA_ATTRIBUTE of break_readreg : signal is "SUPPRESS_DA_RULE_INTERNAL=""D101,R101""";
attribute ALTERA_ATTRIBUTE of trigbrktype : signal is "SUPPRESS_DA_RULE_INTERNAL=""D101,R101""";
attribute ALTERA_ATTRIBUTE of xbrk_ctrl0 : signal is "SUPPRESS_DA_RULE_INTERNAL=""D101,R101""";
attribute ALTERA_ATTRIBUTE of xbrk_ctrl1 : signal is "SUPPRESS_DA_RULE_INTERNAL=""D101,R101""";
attribute ALTERA_ATTRIBUTE of xbrk_ctrl2 : signal is "SUPPRESS_DA_RULE_INTERNAL=""D101,R101""";
attribute ALTERA_ATTRIBUTE of xbrk_ctrl3 : signal is "SUPPRESS_DA_RULE_INTERNAL=""D101,R101""";

begin

  break_a_wpr <= jdo(35 DOWNTO 32);
  break_a_wpr_high_bits <= break_a_wpr(3 DOWNTO 2);
  break_a_wpr_low_bits <= break_a_wpr(1 DOWNTO 0);
  break_b_rr <= jdo(33 DOWNTO 32);
  break_c_rr <= jdo(33 DOWNTO 32);
  take_action_any_break <= (take_action_break_a OR take_action_break_b) OR take_action_break_c;
  process (clk, jrst_n)
  begin
    if jrst_n = '0' then
      xbrk_ctrl0 <= std_logic_vector'("00000000");
      xbrk_ctrl1 <= std_logic_vector'("00000000");
      xbrk_ctrl2 <= std_logic_vector'("00000000");
      xbrk_ctrl3 <= std_logic_vector'("00000000");
      trigbrktype <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(take_action_any_break) = '1' then 
        trigbrktype <= std_logic'('0');
      elsif std_logic'(dbrk_break) = '1' then 
        trigbrktype <= std_logic'('1');
      end if;
      if std_logic'(take_action_break_b) = '1' then 
        if ((break_b_rr = std_logic_vector'("00"))) AND ((std_logic_vector'("00000000000000000000000000000000")>=std_logic_vector'("00000000000000000000000000000001"))) then 
          xbrk_ctrl0(0) <= jdo(27);
          xbrk_ctrl0(1) <= jdo(28);
          xbrk_ctrl0(2) <= jdo(29);
          xbrk_ctrl0(3) <= jdo(30);
          xbrk_ctrl0(4) <= jdo(21);
          xbrk_ctrl0(5) <= jdo(20);
          xbrk_ctrl0(6) <= jdo(19);
          xbrk_ctrl0(7) <= jdo(18);
        end if;
        if ((break_b_rr = std_logic_vector'("01"))) AND ((std_logic_vector'("00000000000000000000000000000000")>=std_logic_vector'("00000000000000000000000000000010"))) then 
          xbrk_ctrl1(0) <= jdo(27);
          xbrk_ctrl1(1) <= jdo(28);
          xbrk_ctrl1(2) <= jdo(29);
          xbrk_ctrl1(3) <= jdo(30);
          xbrk_ctrl1(4) <= jdo(21);
          xbrk_ctrl1(5) <= jdo(20);
          xbrk_ctrl1(6) <= jdo(19);
          xbrk_ctrl1(7) <= jdo(18);
        end if;
        if ((break_b_rr = std_logic_vector'("10"))) AND ((std_logic_vector'("00000000000000000000000000000000")>=std_logic_vector'("00000000000000000000000000000011"))) then 
          xbrk_ctrl2(0) <= jdo(27);
          xbrk_ctrl2(1) <= jdo(28);
          xbrk_ctrl2(2) <= jdo(29);
          xbrk_ctrl2(3) <= jdo(30);
          xbrk_ctrl2(4) <= jdo(21);
          xbrk_ctrl2(5) <= jdo(20);
          xbrk_ctrl2(6) <= jdo(19);
          xbrk_ctrl2(7) <= jdo(18);
        end if;
        if ((break_b_rr = std_logic_vector'("11"))) AND ((std_logic_vector'("00000000000000000000000000000000")>=std_logic_vector'("00000000000000000000000000000100"))) then 
          xbrk_ctrl3(0) <= jdo(27);
          xbrk_ctrl3(1) <= jdo(28);
          xbrk_ctrl3(2) <= jdo(29);
          xbrk_ctrl3(3) <= jdo(30);
          xbrk_ctrl3(4) <= jdo(21);
          xbrk_ctrl3(5) <= jdo(20);
          xbrk_ctrl3(6) <= jdo(19);
          xbrk_ctrl3(7) <= jdo(18);
        end if;
      end if;
    end if;

  end process;

  dbrk_hit0_latch <= std_logic'('0');
  dbrk0_low_value <= std_logic'('0');
  dbrk0_high_value <= std_logic'('0');
  dbrk_hit1_latch <= std_logic'('0');
  dbrk1_low_value <= std_logic'('0');
  dbrk1_high_value <= std_logic'('0');
  dbrk_hit2_latch <= std_logic'('0');
  dbrk2_low_value <= std_logic'('0');
  dbrk2_high_value <= std_logic'('0');
  dbrk_hit3_latch <= std_logic'('0');
  dbrk3_low_value <= std_logic'('0');
  dbrk3_high_value <= std_logic'('0');
  xbrk0_value <= std_logic_vector'("00000000000000000000000000000000");
  xbrk1_value <= std_logic_vector'("00000000000000000000000000000000");
  xbrk2_value <= std_logic_vector'("00000000000000000000000000000000");
  xbrk3_value <= std_logic_vector'("00000000000000000000000000000000");
  process (clk, jrst_n)
  begin
    if jrst_n = '0' then
      break_readreg <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(take_action_any_break) = '1' then 
        break_readreg <= jdo(31 DOWNTO 0);
      elsif std_logic'(take_no_action_break_a) = '1' then 
        case break_a_wpr_high_bits is
            when std_logic_vector'("00") => 
                case break_a_wpr_low_bits is -- synthesis full_case
                    when std_logic_vector'("00") => 
                        break_readreg <= xbrk0_value;
                    -- when std_logic_vector'("00") 
                
                    when std_logic_vector'("01") => 
                        break_readreg <= xbrk1_value;
                    -- when std_logic_vector'("01") 
                
                    when std_logic_vector'("10") => 
                        break_readreg <= xbrk2_value;
                    -- when std_logic_vector'("10") 
                
                    when std_logic_vector'("11") => 
                        break_readreg <= xbrk3_value;
                    -- when std_logic_vector'("11") 
                
                    when others => 
                    -- when others 
                
                end case; -- break_a_wpr_low_bits
            -- when std_logic_vector'("00") 
        
            when std_logic_vector'("01") => 
                break_readreg <= std_logic_vector'("00000000000000000000000000000000");
            -- when std_logic_vector'("01") 
        
            when std_logic_vector'("10") => 
                case break_a_wpr_low_bits is -- synthesis full_case
                    when std_logic_vector'("00") => 
                        break_readreg <= std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(dbrk0_low_value));
                    -- when std_logic_vector'("00") 
                
                    when std_logic_vector'("01") => 
                        break_readreg <= std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(dbrk1_low_value));
                    -- when std_logic_vector'("01") 
                
                    when std_logic_vector'("10") => 
                        break_readreg <= std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(dbrk2_low_value));
                    -- when std_logic_vector'("10") 
                
                    when std_logic_vector'("11") => 
                        break_readreg <= std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(dbrk3_low_value));
                    -- when std_logic_vector'("11") 
                
                    when others => 
                    -- when others 
                
                end case; -- break_a_wpr_low_bits
            -- when std_logic_vector'("10") 
        
            when std_logic_vector'("11") => 
                case break_a_wpr_low_bits is -- synthesis full_case
                    when std_logic_vector'("00") => 
                        break_readreg <= std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(dbrk0_high_value));
                    -- when std_logic_vector'("00") 
                
                    when std_logic_vector'("01") => 
                        break_readreg <= std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(dbrk1_high_value));
                    -- when std_logic_vector'("01") 
                
                    when std_logic_vector'("10") => 
                        break_readreg <= std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(dbrk2_high_value));
                    -- when std_logic_vector'("10") 
                
                    when std_logic_vector'("11") => 
                        break_readreg <= std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(dbrk3_high_value));
                    -- when std_logic_vector'("11") 
                
                    when others => 
                    -- when others 
                
                end case; -- break_a_wpr_low_bits
            -- when std_logic_vector'("11") 
        
            when others => 
            -- when others 
        
        end case; -- break_a_wpr_high_bits
      elsif std_logic'(take_no_action_break_b) = '1' then 
        break_readreg <= jdo(31 DOWNTO 0);
      elsif std_logic'(take_no_action_break_c) = '1' then 
        break_readreg <= jdo(31 DOWNTO 0);
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      trigger_state <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((internal_trigger_state_1 AND ((xbrk_goto0 OR dbrk_goto0)))) = '1' then 
        trigger_state <= std_logic'('0');
      elsif std_logic'((internal_trigger_state_0 AND ((xbrk_goto1 OR dbrk_goto1)))) = '1' then 
        trigger_state <= Vector_To_Std_Logic(-SIGNED(std_logic_vector'("00000000000000000000000000000001")));
      end if;
    end if;

  end process;

  internal_trigger_state_0 <= NOT trigger_state;
  internal_trigger_state_1 <= trigger_state;
  --vhdl renameroo for output signals
  trigger_state_0 <= internal_trigger_state_0;
  --vhdl renameroo for output signals
  trigger_state_1 <= internal_trigger_state_1;

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_oci_xbrk is 
        port (
              -- inputs:
                 signal D_valid : IN STD_LOGIC;
                 signal E_valid : IN STD_LOGIC;
                 signal F_pc : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
                 signal clk : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal trigger_state_0 : IN STD_LOGIC;
                 signal trigger_state_1 : IN STD_LOGIC;
                 signal xbrk_ctrl0 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal xbrk_ctrl1 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal xbrk_ctrl2 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal xbrk_ctrl3 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);

              -- outputs:
                 signal xbrk_break : OUT STD_LOGIC;
                 signal xbrk_goto0 : OUT STD_LOGIC;
                 signal xbrk_goto1 : OUT STD_LOGIC;
                 signal xbrk_traceoff : OUT STD_LOGIC;
                 signal xbrk_traceon : OUT STD_LOGIC;
                 signal xbrk_trigout : OUT STD_LOGIC
              );
end entity cpu_0_nios2_oci_xbrk;


architecture europa of cpu_0_nios2_oci_xbrk is
                signal D_cpu_addr_en :  STD_LOGIC;
                signal E_cpu_addr_en :  STD_LOGIC;
                signal E_xbrk_goto0 :  STD_LOGIC;
                signal E_xbrk_goto1 :  STD_LOGIC;
                signal E_xbrk_traceoff :  STD_LOGIC;
                signal E_xbrk_traceon :  STD_LOGIC;
                signal E_xbrk_trigout :  STD_LOGIC;
                signal cpu_i_address :  STD_LOGIC_VECTOR (26 DOWNTO 0);
                signal xbrk0_armed :  STD_LOGIC;
                signal xbrk0_break_hit :  STD_LOGIC;
                signal xbrk0_goto0_hit :  STD_LOGIC;
                signal xbrk0_goto1_hit :  STD_LOGIC;
                signal xbrk0_toff_hit :  STD_LOGIC;
                signal xbrk0_ton_hit :  STD_LOGIC;
                signal xbrk0_tout_hit :  STD_LOGIC;
                signal xbrk1_armed :  STD_LOGIC;
                signal xbrk1_break_hit :  STD_LOGIC;
                signal xbrk1_goto0_hit :  STD_LOGIC;
                signal xbrk1_goto1_hit :  STD_LOGIC;
                signal xbrk1_toff_hit :  STD_LOGIC;
                signal xbrk1_ton_hit :  STD_LOGIC;
                signal xbrk1_tout_hit :  STD_LOGIC;
                signal xbrk2_armed :  STD_LOGIC;
                signal xbrk2_break_hit :  STD_LOGIC;
                signal xbrk2_goto0_hit :  STD_LOGIC;
                signal xbrk2_goto1_hit :  STD_LOGIC;
                signal xbrk2_toff_hit :  STD_LOGIC;
                signal xbrk2_ton_hit :  STD_LOGIC;
                signal xbrk2_tout_hit :  STD_LOGIC;
                signal xbrk3_armed :  STD_LOGIC;
                signal xbrk3_break_hit :  STD_LOGIC;
                signal xbrk3_goto0_hit :  STD_LOGIC;
                signal xbrk3_goto1_hit :  STD_LOGIC;
                signal xbrk3_toff_hit :  STD_LOGIC;
                signal xbrk3_ton_hit :  STD_LOGIC;
                signal xbrk3_tout_hit :  STD_LOGIC;
                signal xbrk_break_hit :  STD_LOGIC;
                signal xbrk_goto0_hit :  STD_LOGIC;
                signal xbrk_goto1_hit :  STD_LOGIC;
                signal xbrk_toff_hit :  STD_LOGIC;
                signal xbrk_ton_hit :  STD_LOGIC;
                signal xbrk_tout_hit :  STD_LOGIC;

begin

  cpu_i_address <= F_pc & std_logic_vector'("00");
  D_cpu_addr_en <= D_valid;
  E_cpu_addr_en <= E_valid;
  xbrk0_break_hit <= std_logic'('0');
  xbrk0_ton_hit <= std_logic'('0');
  xbrk0_toff_hit <= std_logic'('0');
  xbrk0_tout_hit <= std_logic'('0');
  xbrk0_goto0_hit <= std_logic'('0');
  xbrk0_goto1_hit <= std_logic'('0');
  xbrk1_break_hit <= std_logic'('0');
  xbrk1_ton_hit <= std_logic'('0');
  xbrk1_toff_hit <= std_logic'('0');
  xbrk1_tout_hit <= std_logic'('0');
  xbrk1_goto0_hit <= std_logic'('0');
  xbrk1_goto1_hit <= std_logic'('0');
  xbrk2_break_hit <= std_logic'('0');
  xbrk2_ton_hit <= std_logic'('0');
  xbrk2_toff_hit <= std_logic'('0');
  xbrk2_tout_hit <= std_logic'('0');
  xbrk2_goto0_hit <= std_logic'('0');
  xbrk2_goto1_hit <= std_logic'('0');
  xbrk3_break_hit <= std_logic'('0');
  xbrk3_ton_hit <= std_logic'('0');
  xbrk3_toff_hit <= std_logic'('0');
  xbrk3_tout_hit <= std_logic'('0');
  xbrk3_goto0_hit <= std_logic'('0');
  xbrk3_goto1_hit <= std_logic'('0');
  xbrk_break_hit <= (((xbrk0_break_hit) OR (xbrk1_break_hit)) OR (xbrk2_break_hit)) OR (xbrk3_break_hit);
  xbrk_ton_hit <= (((xbrk0_ton_hit) OR (xbrk1_ton_hit)) OR (xbrk2_ton_hit)) OR (xbrk3_ton_hit);
  xbrk_toff_hit <= (((xbrk0_toff_hit) OR (xbrk1_toff_hit)) OR (xbrk2_toff_hit)) OR (xbrk3_toff_hit);
  xbrk_tout_hit <= (((xbrk0_tout_hit) OR (xbrk1_tout_hit)) OR (xbrk2_tout_hit)) OR (xbrk3_tout_hit);
  xbrk_goto0_hit <= (((xbrk0_goto0_hit) OR (xbrk1_goto0_hit)) OR (xbrk2_goto0_hit)) OR (xbrk3_goto0_hit);
  xbrk_goto1_hit <= (((xbrk0_goto1_hit) OR (xbrk1_goto1_hit)) OR (xbrk2_goto1_hit)) OR (xbrk3_goto1_hit);
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      xbrk_break <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(E_cpu_addr_en) = '1' then 
        xbrk_break <= xbrk_break_hit;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_xbrk_traceon <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(E_cpu_addr_en) = '1' then 
        E_xbrk_traceon <= xbrk_ton_hit;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_xbrk_traceoff <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(E_cpu_addr_en) = '1' then 
        E_xbrk_traceoff <= xbrk_toff_hit;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_xbrk_trigout <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(E_cpu_addr_en) = '1' then 
        E_xbrk_trigout <= xbrk_tout_hit;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_xbrk_goto0 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(E_cpu_addr_en) = '1' then 
        E_xbrk_goto0 <= xbrk_goto0_hit;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_xbrk_goto1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(E_cpu_addr_en) = '1' then 
        E_xbrk_goto1 <= xbrk_goto1_hit;
      end if;
    end if;

  end process;

  xbrk_traceon <= std_logic'('0');
  xbrk_traceoff <= std_logic'('0');
  xbrk_trigout <= std_logic'('0');
  xbrk_goto0 <= std_logic'('0');
  xbrk_goto1 <= std_logic'('0');
  xbrk0_armed <= ((xbrk_ctrl0(4) AND trigger_state_0)) OR ((xbrk_ctrl0(5) AND trigger_state_1));
  xbrk1_armed <= ((xbrk_ctrl1(4) AND trigger_state_0)) OR ((xbrk_ctrl1(5) AND trigger_state_1));
  xbrk2_armed <= ((xbrk_ctrl2(4) AND trigger_state_0)) OR ((xbrk_ctrl2(5) AND trigger_state_1));
  xbrk3_armed <= ((xbrk_ctrl3(4) AND trigger_state_0)) OR ((xbrk_ctrl3(5) AND trigger_state_1));

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_oci_dbrk is 
        port (
              -- inputs:
                 signal E_st_data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal av_ld_data_aligned_filtered : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal clk : IN STD_LOGIC;
                 signal d_address : IN STD_LOGIC_VECTOR (26 DOWNTO 0);
                 signal d_read : IN STD_LOGIC;
                 signal d_waitrequest : IN STD_LOGIC;
                 signal d_write : IN STD_LOGIC;
                 signal debugack : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_d_address : OUT STD_LOGIC_VECTOR (26 DOWNTO 0);
                 signal cpu_d_read : OUT STD_LOGIC;
                 signal cpu_d_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_d_wait : OUT STD_LOGIC;
                 signal cpu_d_write : OUT STD_LOGIC;
                 signal cpu_d_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal dbrk_break : OUT STD_LOGIC;
                 signal dbrk_goto0 : OUT STD_LOGIC;
                 signal dbrk_goto1 : OUT STD_LOGIC;
                 signal dbrk_traceme : OUT STD_LOGIC;
                 signal dbrk_traceoff : OUT STD_LOGIC;
                 signal dbrk_traceon : OUT STD_LOGIC;
                 signal dbrk_trigout : OUT STD_LOGIC
              );
end entity cpu_0_nios2_oci_dbrk;


architecture europa of cpu_0_nios2_oci_dbrk is
                signal dbrk0_armed :  STD_LOGIC;
                signal dbrk0_break_pulse :  STD_LOGIC;
                signal dbrk0_goto0 :  STD_LOGIC;
                signal dbrk0_goto1 :  STD_LOGIC;
                signal dbrk0_traceme :  STD_LOGIC;
                signal dbrk0_traceoff :  STD_LOGIC;
                signal dbrk0_traceon :  STD_LOGIC;
                signal dbrk0_trigout :  STD_LOGIC;
                signal dbrk1_armed :  STD_LOGIC;
                signal dbrk1_break_pulse :  STD_LOGIC;
                signal dbrk1_goto0 :  STD_LOGIC;
                signal dbrk1_goto1 :  STD_LOGIC;
                signal dbrk1_traceme :  STD_LOGIC;
                signal dbrk1_traceoff :  STD_LOGIC;
                signal dbrk1_traceon :  STD_LOGIC;
                signal dbrk1_trigout :  STD_LOGIC;
                signal dbrk2_armed :  STD_LOGIC;
                signal dbrk2_break_pulse :  STD_LOGIC;
                signal dbrk2_goto0 :  STD_LOGIC;
                signal dbrk2_goto1 :  STD_LOGIC;
                signal dbrk2_traceme :  STD_LOGIC;
                signal dbrk2_traceoff :  STD_LOGIC;
                signal dbrk2_traceon :  STD_LOGIC;
                signal dbrk2_trigout :  STD_LOGIC;
                signal dbrk3_armed :  STD_LOGIC;
                signal dbrk3_break_pulse :  STD_LOGIC;
                signal dbrk3_goto0 :  STD_LOGIC;
                signal dbrk3_goto1 :  STD_LOGIC;
                signal dbrk3_traceme :  STD_LOGIC;
                signal dbrk3_traceoff :  STD_LOGIC;
                signal dbrk3_traceon :  STD_LOGIC;
                signal dbrk3_trigout :  STD_LOGIC;
                signal dbrk_break_pulse :  STD_LOGIC;
                signal dbrk_data :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal internal_cpu_d_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal internal_cpu_d_write :  STD_LOGIC;
                signal internal_cpu_d_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal internal_dbrk_break :  STD_LOGIC;

begin

  cpu_d_address <= d_address;
  internal_cpu_d_readdata <= av_ld_data_aligned_filtered;
  cpu_d_read <= d_read;
  internal_cpu_d_writedata <= E_st_data;
  internal_cpu_d_write <= d_write;
  cpu_d_wait <= d_waitrequest;
  dbrk_data <= A_WE_StdLogicVector((std_logic'(internal_cpu_d_write) = '1'), internal_cpu_d_writedata, internal_cpu_d_readdata);
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_dbrk_break <= std_logic'('0');
    elsif clk'event and clk = '1' then
      internal_dbrk_break <= A_WE_StdLogic((std_logic'(internal_dbrk_break) = '1'), NOT debugack, dbrk_break_pulse);
    end if;

  end process;

  dbrk0_armed <= std_logic'('0');
  dbrk0_trigout <= std_logic'('0');
  dbrk0_break_pulse <= std_logic'('0');
  dbrk0_traceoff <= std_logic'('0');
  dbrk0_traceon <= std_logic'('0');
  dbrk0_traceme <= std_logic'('0');
  dbrk0_goto0 <= std_logic'('0');
  dbrk0_goto1 <= std_logic'('0');
  dbrk1_armed <= std_logic'('0');
  dbrk1_trigout <= std_logic'('0');
  dbrk1_break_pulse <= std_logic'('0');
  dbrk1_traceoff <= std_logic'('0');
  dbrk1_traceon <= std_logic'('0');
  dbrk1_traceme <= std_logic'('0');
  dbrk1_goto0 <= std_logic'('0');
  dbrk1_goto1 <= std_logic'('0');
  dbrk2_armed <= std_logic'('0');
  dbrk2_trigout <= std_logic'('0');
  dbrk2_break_pulse <= std_logic'('0');
  dbrk2_traceoff <= std_logic'('0');
  dbrk2_traceon <= std_logic'('0');
  dbrk2_traceme <= std_logic'('0');
  dbrk2_goto0 <= std_logic'('0');
  dbrk2_goto1 <= std_logic'('0');
  dbrk3_armed <= std_logic'('0');
  dbrk3_trigout <= std_logic'('0');
  dbrk3_break_pulse <= std_logic'('0');
  dbrk3_traceoff <= std_logic'('0');
  dbrk3_traceon <= std_logic'('0');
  dbrk3_traceme <= std_logic'('0');
  dbrk3_goto0 <= std_logic'('0');
  dbrk3_goto1 <= std_logic'('0');
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      dbrk_trigout <= std_logic'('0');
      dbrk_break_pulse <= std_logic'('0');
      dbrk_traceoff <= std_logic'('0');
      dbrk_traceon <= std_logic'('0');
      dbrk_traceme <= std_logic'('0');
      dbrk_goto0 <= std_logic'('0');
      dbrk_goto1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      dbrk_trigout <= ((dbrk0_trigout OR dbrk1_trigout) OR dbrk2_trigout) OR dbrk3_trigout;
      dbrk_break_pulse <= ((dbrk0_break_pulse OR dbrk1_break_pulse) OR dbrk2_break_pulse) OR dbrk3_break_pulse;
      dbrk_traceoff <= ((dbrk0_traceoff OR dbrk1_traceoff) OR dbrk2_traceoff) OR dbrk3_traceoff;
      dbrk_traceon <= ((dbrk0_traceon OR dbrk1_traceon) OR dbrk2_traceon) OR dbrk3_traceon;
      dbrk_traceme <= ((dbrk0_traceme OR dbrk1_traceme) OR dbrk2_traceme) OR dbrk3_traceme;
      dbrk_goto0 <= ((dbrk0_goto0 OR dbrk1_goto0) OR dbrk2_goto0) OR dbrk3_goto0;
      dbrk_goto1 <= ((dbrk0_goto1 OR dbrk1_goto1) OR dbrk2_goto1) OR dbrk3_goto1;
    end if;

  end process;

  --vhdl renameroo for output signals
  cpu_d_readdata <= internal_cpu_d_readdata;
  --vhdl renameroo for output signals
  cpu_d_write <= internal_cpu_d_write;
  --vhdl renameroo for output signals
  cpu_d_writedata <= internal_cpu_d_writedata;
  --vhdl renameroo for output signals
  dbrk_break <= internal_dbrk_break;

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_oci_itrace is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal dbrk_traceoff : IN STD_LOGIC;
                 signal dbrk_traceon : IN STD_LOGIC;
                 signal jdo : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal jrst_n : IN STD_LOGIC;
                 signal take_action_tracectrl : IN STD_LOGIC;
                 signal trc_enb : IN STD_LOGIC;
                 signal xbrk_traceoff : IN STD_LOGIC;
                 signal xbrk_traceon : IN STD_LOGIC;
                 signal xbrk_wrap_traceoff : IN STD_LOGIC;

              -- outputs:
                 signal dct_buffer : OUT STD_LOGIC_VECTOR (29 DOWNTO 0);
                 signal dct_count : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal itm : OUT STD_LOGIC_VECTOR (35 DOWNTO 0);
                 signal trc_ctrl : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal trc_on : OUT STD_LOGIC
              );
end entity cpu_0_nios2_oci_itrace;


architecture europa of cpu_0_nios2_oci_itrace is
                signal advanced_exception :  STD_LOGIC;
                signal dct_code :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal dct_is_taken :  STD_LOGIC;
                signal excaddr :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal instr_retired :  STD_LOGIC;
                signal internal_dct_buffer :  STD_LOGIC_VECTOR (29 DOWNTO 0);
                signal internal_dct_count :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal internal_trc_ctrl :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal internal_trc_on :  STD_LOGIC;
                signal is_cond_dct :  STD_LOGIC;
                signal is_dct :  STD_LOGIC;
                signal is_exception :  STD_LOGIC;
                signal is_fast_tlb_miss_exception :  STD_LOGIC;
                signal is_idct :  STD_LOGIC;
                signal not_in_debug_mode :  STD_LOGIC;
                signal pending_excaddr :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal pending_exctype :  STD_LOGIC;
                signal pending_frametype :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal record_dct_outcome_in_sync :  STD_LOGIC;
                signal record_itrace :  STD_LOGIC;
                signal retired_pcb :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal sync_code :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal sync_interval :  STD_LOGIC_VECTOR (6 DOWNTO 0);
                signal sync_pending :  STD_LOGIC;
                signal sync_timer :  STD_LOGIC_VECTOR (6 DOWNTO 0);
                signal sync_timer_next :  STD_LOGIC_VECTOR (6 DOWNTO 0);
                signal synced :  STD_LOGIC;
                signal trc_clear :  STD_LOGIC;
                signal trc_ctrl_reg :  STD_LOGIC_VECTOR (10 DOWNTO 0);
attribute ALTERA_ATTRIBUTE : string;
attribute ALTERA_ATTRIBUTE of dct_buffer : signal is "SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of dct_count : signal is "SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of itm : signal is "SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of pending_exctype : signal is "SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of pending_frametype : signal is "SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of sync_timer : signal is "SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of trc_clear : signal is "SUPPRESS_DA_RULE_INTERNAL=D101";
attribute ALTERA_ATTRIBUTE of trc_ctrl_reg : signal is "SUPPRESS_DA_RULE_INTERNAL=""D101,D103,R101""";

begin

  is_cond_dct <= std_logic'('0');
  is_dct <= std_logic'('0');
  dct_is_taken <= std_logic'('0');
  is_idct <= std_logic'('0');
  retired_pcb <= std_logic_vector'("00000000000000000000000000000000");
  not_in_debug_mode <= std_logic'('0');
  instr_retired <= std_logic'('0');
  advanced_exception <= std_logic'('0');
  is_exception <= std_logic'('0');
  is_fast_tlb_miss_exception <= std_logic'('0');
  excaddr <= std_logic_vector'("00000000000000000000000000000000");
  sync_code <= internal_trc_ctrl(3 DOWNTO 2);
  sync_interval <= Std_Logic_Vector'(A_ToStdLogicVector((sync_code(1) AND sync_code(0))) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector((sync_code(1) AND NOT sync_code(0))) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector((NOT sync_code(1) AND sync_code(0))) & std_logic_vector'("00"));
  sync_pending <= to_std_logic(((std_logic_vector'("0000000000000000000000000") & (sync_timer)) = std_logic_vector'("00000000000000000000000000000000")));
  record_dct_outcome_in_sync <= dct_is_taken AND sync_pending;
  sync_timer_next <= A_EXT (A_WE_StdLogicVector((std_logic'(sync_pending) = '1'), (std_logic_vector'("00000000000000000000000000") & (sync_timer)), (((std_logic_vector'("00000000000000000000000000") & (sync_timer)) - std_logic_vector'("000000000000000000000000000000001")))), 7);
  record_itrace <= internal_trc_on AND internal_trc_ctrl(4);
  synced <= to_std_logic((pending_frametype /= std_logic_vector'("1010")));
  dct_code <= Std_Logic_Vector'(A_ToStdLogicVector(is_cond_dct) & A_ToStdLogicVector(dct_is_taken));
  process (clk, jrst_n)
  begin
    if jrst_n = '0' then
      trc_clear <= std_logic'('0');
    elsif clk'event and clk = '1' then
      trc_clear <= (NOT trc_enb AND take_action_tracectrl) AND jdo(4);
    end if;

  end process;

  process (clk, jrst_n)
  begin
    if jrst_n = '0' then
      itm <= std_logic_vector'("000000000000000000000000000000000000");
      internal_dct_buffer <= std_logic_vector'("000000000000000000000000000000");
      internal_dct_count <= std_logic_vector'("0000");
      sync_timer <= std_logic_vector'("0000000");
      pending_frametype <= std_logic_vector'("0000");
      pending_exctype <= std_logic'('0');
      pending_excaddr <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'((trc_clear OR ((NOT(or_reduce(std_logic_vector'("00000000000000000000000000000000"))) AND NOT(or_reduce(std_logic_vector'("00000000000000000000000000000000"))))))) = '1' then 
        itm <= std_logic_vector'("000000000000000000000000000000000000");
        internal_dct_buffer <= std_logic_vector'("000000000000000000000000000000");
        internal_dct_count <= std_logic_vector'("0000");
        sync_timer <= std_logic_vector'("0000000");
        pending_frametype <= std_logic_vector'("0000");
        pending_exctype <= std_logic'('0');
        pending_excaddr <= std_logic_vector'("00000000000000000000000000000000");
      elsif std_logic'((instr_retired OR advanced_exception)) = '1' then 
        if std_logic'(NOT record_itrace) = '1' then 
          pending_frametype <= std_logic_vector'("1010");
        elsif std_logic'(is_exception) = '1' then 
          pending_frametype <= std_logic_vector'("0010");
          pending_excaddr <= excaddr;
          if std_logic'(is_fast_tlb_miss_exception) = '1' then 
            pending_exctype <= std_logic'('1');
          else
            pending_exctype <= std_logic'('0');
          end if;
        elsif std_logic'(is_idct) = '1' then 
          pending_frametype <= std_logic_vector'("1001");
        elsif std_logic'(record_dct_outcome_in_sync) = '1' then 
          pending_frametype <= std_logic_vector'("1000");
        else
          pending_frametype <= std_logic_vector'("0000");
        end if;
        if std_logic'((to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (internal_dct_count)) /= std_logic_vector'("00000000000000000000000000000000")))) AND ((((NOT record_itrace OR is_idct) OR is_exception) OR record_dct_outcome_in_sync)))) = '1' then 
          itm <= Std_Logic_Vector'(std_logic_vector'("0001") & internal_dct_buffer & std_logic_vector'("00"));
          internal_dct_buffer <= std_logic_vector'("000000000000000000000000000000");
          internal_dct_count <= std_logic_vector'("0000");
          sync_timer <= sync_timer_next;
        else
          if std_logic'((((record_itrace AND ((is_dct AND to_std_logic(((internal_dct_count /= std_logic_vector'("1111"))))))) AND NOT record_dct_outcome_in_sync) AND NOT advanced_exception)) = '1' then 
            internal_dct_buffer <= dct_code & internal_dct_buffer(29 DOWNTO 2);
            internal_dct_count <= A_EXT (((std_logic_vector'("00000000000000000000000000000") & (internal_dct_count)) + std_logic_vector'("000000000000000000000000000000001")), 4);
          end if;
          if std_logic'(((record_itrace AND synced) AND to_std_logic(((pending_frametype = std_logic_vector'("0010")))))) = '1' then 
            itm <= Std_Logic_Vector'(std_logic_vector'("0010") & pending_excaddr(31 DOWNTO 1) & A_ToStdLogicVector(pending_exctype));
          elsif std_logic'((record_itrace AND to_std_logic(((pending_frametype /= std_logic_vector'("0000")))))) = '1' then 
            itm <= pending_frametype & retired_pcb;
            sync_timer <= sync_interval;
          elsif std_logic'(((record_itrace AND synced) AND is_dct)) = '1' then 
            if internal_dct_count = std_logic_vector'("1111") then 
              itm <= Std_Logic_Vector'(std_logic_vector'("0001") & dct_code & internal_dct_buffer);
              internal_dct_buffer <= std_logic_vector'("000000000000000000000000000000");
              internal_dct_count <= std_logic_vector'("0000");
              sync_timer <= sync_timer_next;
            else
              itm <= std_logic_vector'("000000000000000000000000000000000000");
            end if;
          else
            itm <= std_logic_vector'("000000000000000000000000000000000000");
          end if;
        end if;
      else
        itm <= std_logic_vector'("000000000000000000000000000000000000");
      end if;
    end if;

  end process;

  process (clk, jrst_n)
  begin
    if jrst_n = '0' then
      trc_ctrl_reg(0) <= std_logic'('0');
      trc_ctrl_reg(1) <= std_logic'('0');
      trc_ctrl_reg(3 DOWNTO 2) <= std_logic_vector'("00");
      trc_ctrl_reg(4) <= std_logic'('0');
      trc_ctrl_reg(7 DOWNTO 5) <= std_logic_vector'("000");
      trc_ctrl_reg(8) <= std_logic'('0');
      trc_ctrl_reg(9) <= std_logic'('0');
      trc_ctrl_reg(10) <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(take_action_tracectrl) = '1' then 
        trc_ctrl_reg(0) <= jdo(5);
        trc_ctrl_reg(1) <= jdo(6);
        trc_ctrl_reg(3 DOWNTO 2) <= jdo(8 DOWNTO 7);
        trc_ctrl_reg(4) <= jdo(9);
        trc_ctrl_reg(9) <= jdo(14);
        trc_ctrl_reg(10) <= jdo(2);
        if true then 
          trc_ctrl_reg(7 DOWNTO 5) <= jdo(12 DOWNTO 10);
        end if;
        if ((std_logic_vector'("00000000000000000000000000000000") AND std_logic_vector'("00000000000000000000000000000000"))) /= std_logic_vector'("00000000000000000000000000000000") then 
          trc_ctrl_reg(8) <= jdo(13);
        end if;
      elsif std_logic'(xbrk_wrap_traceoff) = '1' then 
        trc_ctrl_reg(1) <= std_logic'('0');
        trc_ctrl_reg(0) <= std_logic'('0');
      elsif std_logic'((dbrk_traceoff OR xbrk_traceoff)) = '1' then 
        trc_ctrl_reg(1) <= std_logic'('0');
      elsif std_logic'((trc_ctrl_reg(0) AND ((dbrk_traceon OR xbrk_traceon)))) = '1' then 
        trc_ctrl_reg(1) <= std_logic'('1');
      end if;
    end if;

  end process;

  internal_trc_ctrl <= A_EXT (A_WE_StdLogicVector((std_logic'(((or_reduce(std_logic_vector'("00000000000000000000000000000000")) OR or_reduce(std_logic_vector'("00000000000000000000000000000000"))))) = '1'), (std_logic_vector'("000000000000000") & (Std_Logic_Vector'(std_logic_vector'("000000") & trc_ctrl_reg))), std_logic_vector'("00000000000000000000000000000000")), 16);
  internal_trc_on <= internal_trc_ctrl(1) AND ((internal_trc_ctrl(9) OR not_in_debug_mode));
  --vhdl renameroo for output signals
  dct_buffer <= internal_dct_buffer;
  --vhdl renameroo for output signals
  dct_count <= internal_dct_count;
  --vhdl renameroo for output signals
  trc_ctrl <= internal_trc_ctrl;
  --vhdl renameroo for output signals
  trc_on <= internal_trc_on;

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_oci_td_mode is 
        port (
              -- inputs:
                 signal ctrl : IN STD_LOGIC_VECTOR (8 DOWNTO 0);

              -- outputs:
                 signal td_mode : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
              );
end entity cpu_0_nios2_oci_td_mode;


architecture europa of cpu_0_nios2_oci_td_mode is
                signal ctrl_bits_for_mux :  STD_LOGIC_VECTOR (2 DOWNTO 0);

begin

  ctrl_bits_for_mux <= ctrl(7 DOWNTO 5);
  process (ctrl_bits_for_mux)
  begin
      case ctrl_bits_for_mux is
          when std_logic_vector'("000") => 
              td_mode <= std_logic_vector'("0000");
          -- when std_logic_vector'("000") 
      
          when std_logic_vector'("001") => 
              td_mode <= std_logic_vector'("1000");
          -- when std_logic_vector'("001") 
      
          when std_logic_vector'("010") => 
              td_mode <= std_logic_vector'("0100");
          -- when std_logic_vector'("010") 
      
          when std_logic_vector'("011") => 
              td_mode <= std_logic_vector'("1100");
          -- when std_logic_vector'("011") 
      
          when std_logic_vector'("100") => 
              td_mode <= std_logic_vector'("0010");
          -- when std_logic_vector'("100") 
      
          when std_logic_vector'("101") => 
              td_mode <= std_logic_vector'("1010");
          -- when std_logic_vector'("101") 
      
          when std_logic_vector'("110") => 
              td_mode <= std_logic_vector'("0101");
          -- when std_logic_vector'("110") 
      
          when std_logic_vector'("111") => 
              td_mode <= std_logic_vector'("1111");
          -- when std_logic_vector'("111") 
      
          when others => 
          -- when others 
      
      end case; -- ctrl_bits_for_mux

  end process;


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_oci_dtrace is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_d_address : IN STD_LOGIC_VECTOR (26 DOWNTO 0);
                 signal cpu_d_read : IN STD_LOGIC;
                 signal cpu_d_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_d_wait : IN STD_LOGIC;
                 signal cpu_d_write : IN STD_LOGIC;
                 signal cpu_d_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal jrst_n : IN STD_LOGIC;
                 signal trc_ctrl : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

              -- outputs:
                 signal atm : OUT STD_LOGIC_VECTOR (35 DOWNTO 0);
                 signal dtm : OUT STD_LOGIC_VECTOR (35 DOWNTO 0)
              );
end entity cpu_0_nios2_oci_dtrace;


architecture europa of cpu_0_nios2_oci_dtrace is
component cpu_0_nios2_oci_td_mode is 
           port (
                 -- inputs:
                    signal ctrl : IN STD_LOGIC_VECTOR (8 DOWNTO 0);

                 -- outputs:
                    signal td_mode : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
                 );
end component cpu_0_nios2_oci_td_mode;

                signal cpu_d_address_0_padded :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_d_readdata_0_padded :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_d_writedata_0_padded :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal module_input6 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
                signal record_load_addr :  STD_LOGIC;
                signal record_load_data :  STD_LOGIC;
                signal record_store_addr :  STD_LOGIC;
                signal record_store_data :  STD_LOGIC;
                signal td_mode_trc_ctrl :  STD_LOGIC_VECTOR (3 DOWNTO 0);
attribute ALTERA_ATTRIBUTE : string;
attribute ALTERA_ATTRIBUTE of atm : signal is "SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of dtm : signal is "SUPPRESS_DA_RULE_INTERNAL=R101";

begin

  cpu_d_writedata_0_padded <= cpu_d_writedata OR std_logic_vector'("00000000000000000000000000000000");
  cpu_d_readdata_0_padded <= cpu_d_readdata OR std_logic_vector'("00000000000000000000000000000000");
  cpu_d_address_0_padded <= (std_logic_vector'("00000") & (cpu_d_address)) OR std_logic_vector'("00000000000000000000000000000000");
  --cpu_0_nios2_oci_trc_ctrl_td_mode, which is an e_instance
  cpu_0_nios2_oci_trc_ctrl_td_mode : cpu_0_nios2_oci_td_mode
    port map(
      td_mode => td_mode_trc_ctrl,
      ctrl => module_input6
    );

  module_input6 <= trc_ctrl(8 DOWNTO 0);

  (record_load_addr, record_store_addr, record_load_data, record_store_data) <= td_mode_trc_ctrl;
  process (clk, jrst_n)
  begin
    if jrst_n = '0' then
      atm <= std_logic_vector'("000000000000000000000000000000000000");
      dtm <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if (std_logic_vector'("00000000000000000000000000000000")) /= std_logic_vector'("00000000000000000000000000000000") then 
        if std_logic'(((cpu_d_write AND NOT cpu_d_wait) AND record_store_addr)) = '1' then 
          atm <= Std_Logic_Vector'(std_logic_vector'("0101") & cpu_d_address_0_padded);
        elsif std_logic'(((cpu_d_read AND NOT cpu_d_wait) AND record_load_addr)) = '1' then 
          atm <= Std_Logic_Vector'(std_logic_vector'("0100") & cpu_d_address_0_padded);
        else
          atm <= Std_Logic_Vector'(std_logic_vector'("0000") & cpu_d_address_0_padded);
        end if;
        if std_logic'(((cpu_d_write AND NOT cpu_d_wait) AND record_store_data)) = '1' then 
          dtm <= Std_Logic_Vector'(std_logic_vector'("0111") & cpu_d_writedata_0_padded);
        elsif std_logic'(((cpu_d_read AND NOT cpu_d_wait) AND record_load_data)) = '1' then 
          dtm <= Std_Logic_Vector'(std_logic_vector'("0110") & cpu_d_readdata_0_padded);
        else
          dtm <= Std_Logic_Vector'(std_logic_vector'("0000") & cpu_d_readdata_0_padded);
        end if;
      else
        atm <= std_logic_vector'("000000000000000000000000000000000000");
        dtm <= std_logic_vector'("000000000000000000000000000000000000");
      end if;
    end if;

  end process;


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_oci_compute_tm_count is 
        port (
              -- inputs:
                 signal atm_valid : IN STD_LOGIC;
                 signal dtm_valid : IN STD_LOGIC;
                 signal itm_valid : IN STD_LOGIC;

              -- outputs:
                 signal compute_tm_count : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
              );
end entity cpu_0_nios2_oci_compute_tm_count;


architecture europa of cpu_0_nios2_oci_compute_tm_count is
                signal switch_for_mux :  STD_LOGIC_VECTOR (2 DOWNTO 0);

begin

  switch_for_mux <= Std_Logic_Vector'(A_ToStdLogicVector(itm_valid) & A_ToStdLogicVector(atm_valid) & A_ToStdLogicVector(dtm_valid));
  process (switch_for_mux)
  begin
      case switch_for_mux is
          when std_logic_vector'("000") => 
              compute_tm_count <= std_logic_vector'("00");
          -- when std_logic_vector'("000") 
      
          when std_logic_vector'("001") => 
              compute_tm_count <= std_logic_vector'("01");
          -- when std_logic_vector'("001") 
      
          when std_logic_vector'("010") => 
              compute_tm_count <= std_logic_vector'("01");
          -- when std_logic_vector'("010") 
      
          when std_logic_vector'("011") => 
              compute_tm_count <= std_logic_vector'("10");
          -- when std_logic_vector'("011") 
      
          when std_logic_vector'("100") => 
              compute_tm_count <= std_logic_vector'("01");
          -- when std_logic_vector'("100") 
      
          when std_logic_vector'("101") => 
              compute_tm_count <= std_logic_vector'("10");
          -- when std_logic_vector'("101") 
      
          when std_logic_vector'("110") => 
              compute_tm_count <= std_logic_vector'("10");
          -- when std_logic_vector'("110") 
      
          when std_logic_vector'("111") => 
              compute_tm_count <= std_logic_vector'("11");
          -- when std_logic_vector'("111") 
      
          when others => 
          -- when others 
      
      end case; -- switch_for_mux

  end process;


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_oci_fifowp_inc is 
        port (
              -- inputs:
                 signal free2 : IN STD_LOGIC;
                 signal free3 : IN STD_LOGIC;
                 signal tm_count : IN STD_LOGIC_VECTOR (1 DOWNTO 0);

              -- outputs:
                 signal fifowp_inc : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
              );
end entity cpu_0_nios2_oci_fifowp_inc;


architecture europa of cpu_0_nios2_oci_fifowp_inc is

begin

  process (free2, free3, tm_count)
  begin
      if std_logic'((free3 AND to_std_logic((((std_logic_vector'("000000000000000000000000000000") & (tm_count)) = std_logic_vector'("00000000000000000000000000000011")))))) = '1' then 
        fifowp_inc <= std_logic_vector'("0011");
      elsif std_logic'((free2 AND to_std_logic((((std_logic_vector'("000000000000000000000000000000") & (tm_count))>=std_logic_vector'("00000000000000000000000000000010")))))) = '1' then 
        fifowp_inc <= std_logic_vector'("0010");
      elsif (std_logic_vector'("000000000000000000000000000000") & (tm_count))>=std_logic_vector'("00000000000000000000000000000001") then 
        fifowp_inc <= std_logic_vector'("0001");
      else
        fifowp_inc <= std_logic_vector'("0000");
      end if;

  end process;


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_oci_fifocount_inc is 
        port (
              -- inputs:
                 signal empty : IN STD_LOGIC;
                 signal free2 : IN STD_LOGIC;
                 signal free3 : IN STD_LOGIC;
                 signal tm_count : IN STD_LOGIC_VECTOR (1 DOWNTO 0);

              -- outputs:
                 signal fifocount_inc : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
              );
end entity cpu_0_nios2_oci_fifocount_inc;


architecture europa of cpu_0_nios2_oci_fifocount_inc is

begin

  process (empty, free2, free3, tm_count)
  begin
      if std_logic'(empty) = '1' then 
        fifocount_inc <= std_logic_vector'("000") & (tm_count(1 DOWNTO 0));
      elsif std_logic'((free3 AND to_std_logic((((std_logic_vector'("000000000000000000000000000000") & (tm_count)) = std_logic_vector'("00000000000000000000000000000011")))))) = '1' then 
        fifocount_inc <= std_logic_vector'("00010");
      elsif std_logic'((free2 AND to_std_logic((((std_logic_vector'("000000000000000000000000000000") & (tm_count))>=std_logic_vector'("00000000000000000000000000000010")))))) = '1' then 
        fifocount_inc <= std_logic_vector'("00001");
      elsif (std_logic_vector'("000000000000000000000000000000") & (tm_count))>=std_logic_vector'("00000000000000000000000000000001") then 
        fifocount_inc <= std_logic_vector'("00000");
      else
        fifocount_inc <= A_REP(std_logic'('1'), 5);
      end if;

  end process;


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_oci_fifo is 
        port (
              -- inputs:
                 signal atm : IN STD_LOGIC_VECTOR (35 DOWNTO 0);
                 signal clk : IN STD_LOGIC;
                 signal dbrk_traceme : IN STD_LOGIC;
                 signal dbrk_traceoff : IN STD_LOGIC;
                 signal dbrk_traceon : IN STD_LOGIC;
                 signal dct_buffer : IN STD_LOGIC_VECTOR (29 DOWNTO 0);
                 signal dct_count : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal dtm : IN STD_LOGIC_VECTOR (35 DOWNTO 0);
                 signal itm : IN STD_LOGIC_VECTOR (35 DOWNTO 0);
                 signal jrst_n : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal test_ending : IN STD_LOGIC;
                 signal test_has_ended : IN STD_LOGIC;
                 signal trc_on : IN STD_LOGIC;

              -- outputs:
                 signal tw : OUT STD_LOGIC_VECTOR (35 DOWNTO 0)
              );
end entity cpu_0_nios2_oci_fifo;


architecture europa of cpu_0_nios2_oci_fifo is
component cpu_0_nios2_oci_compute_tm_count is 
           port (
                 -- inputs:
                    signal atm_valid : IN STD_LOGIC;
                    signal dtm_valid : IN STD_LOGIC;
                    signal itm_valid : IN STD_LOGIC;

                 -- outputs:
                    signal compute_tm_count : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
                 );
end component cpu_0_nios2_oci_compute_tm_count;

component cpu_0_nios2_oci_fifowp_inc is 
           port (
                 -- inputs:
                    signal free2 : IN STD_LOGIC;
                    signal free3 : IN STD_LOGIC;
                    signal tm_count : IN STD_LOGIC_VECTOR (1 DOWNTO 0);

                 -- outputs:
                    signal fifowp_inc : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
                 );
end component cpu_0_nios2_oci_fifowp_inc;

component cpu_0_nios2_oci_fifocount_inc is 
           port (
                 -- inputs:
                    signal empty : IN STD_LOGIC;
                    signal free2 : IN STD_LOGIC;
                    signal free3 : IN STD_LOGIC;
                    signal tm_count : IN STD_LOGIC_VECTOR (1 DOWNTO 0);

                 -- outputs:
                    signal fifocount_inc : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
                 );
end component cpu_0_nios2_oci_fifocount_inc;

component cpu_0_oci_test_bench is 
           port (
                 -- inputs:
                    signal dct_buffer : IN STD_LOGIC_VECTOR (29 DOWNTO 0);
                    signal dct_count : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal test_ending : IN STD_LOGIC;
                    signal test_has_ended : IN STD_LOGIC
                 );
end component cpu_0_oci_test_bench;

                signal atm_valid :  STD_LOGIC;
                signal compute_tm_count_tm_count :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal dtm_valid :  STD_LOGIC;
                signal empty :  STD_LOGIC;
                signal fifo_0 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_0_enable :  STD_LOGIC;
                signal fifo_0_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_1 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_10 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_10_enable :  STD_LOGIC;
                signal fifo_10_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_11 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_11_enable :  STD_LOGIC;
                signal fifo_11_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_12 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_12_enable :  STD_LOGIC;
                signal fifo_12_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_13 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_13_enable :  STD_LOGIC;
                signal fifo_13_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_14 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_14_enable :  STD_LOGIC;
                signal fifo_14_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_15 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_15_enable :  STD_LOGIC;
                signal fifo_15_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_1_enable :  STD_LOGIC;
                signal fifo_1_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_2 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_2_enable :  STD_LOGIC;
                signal fifo_2_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_3 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_3_enable :  STD_LOGIC;
                signal fifo_3_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_4 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_4_enable :  STD_LOGIC;
                signal fifo_4_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_5 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_5_enable :  STD_LOGIC;
                signal fifo_5_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_6 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_6_enable :  STD_LOGIC;
                signal fifo_6_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_7 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_7_enable :  STD_LOGIC;
                signal fifo_7_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_8 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_8_enable :  STD_LOGIC;
                signal fifo_8_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_9 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_9_enable :  STD_LOGIC;
                signal fifo_9_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifo_read_mux :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fifocount :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal fifocount_inc_fifocount :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal fifohead :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal fiforp :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal fifowp :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal fifowp1 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal fifowp2 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal fifowp_inc_fifowp :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal free2 :  STD_LOGIC;
                signal free3 :  STD_LOGIC;
                signal itm_valid :  STD_LOGIC;
                signal ovf_pending :  STD_LOGIC;
                signal ovr_pending_atm :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal ovr_pending_dtm :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal tm_count :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal tm_count_ge1 :  STD_LOGIC;
                signal tm_count_ge2 :  STD_LOGIC;
                signal tm_count_ge3 :  STD_LOGIC;
                signal trc_this :  STD_LOGIC;
attribute ALTERA_ATTRIBUTE : string;
attribute ALTERA_ATTRIBUTE of fifocount : signal is "SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of fiforp : signal is "SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of fifowp : signal is "SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of ovf_pending : signal is "SUPPRESS_DA_RULE_INTERNAL=R101";

begin

  trc_this <= (trc_on OR ((dbrk_traceon AND NOT dbrk_traceoff))) OR dbrk_traceme;
  itm_valid <= or_reduce(itm(35 DOWNTO 32));
  atm_valid <= or_reduce(atm(35 DOWNTO 32)) AND trc_this;
  dtm_valid <= or_reduce(dtm(35 DOWNTO 32)) AND trc_this;
  free2 <= NOT fifocount(4);
  free3 <= NOT fifocount(4) AND nand_reduce(fifocount(3 DOWNTO 0));
  empty <= NOT or_reduce(fifocount);
  fifowp1 <= A_EXT (((std_logic_vector'("00000000000000000000000000000") & (fifowp)) + std_logic_vector'("000000000000000000000000000000001")), 4);
  fifowp2 <= A_EXT (((std_logic_vector'("00000000000000000000000000000") & (fifowp)) + std_logic_vector'("000000000000000000000000000000010")), 4);
  --cpu_0_nios2_oci_compute_tm_count_tm_count, which is an e_instance
  cpu_0_nios2_oci_compute_tm_count_tm_count : cpu_0_nios2_oci_compute_tm_count
    port map(
      compute_tm_count => compute_tm_count_tm_count,
      atm_valid => atm_valid,
      dtm_valid => dtm_valid,
      itm_valid => itm_valid
    );


  tm_count <= compute_tm_count_tm_count;
  --cpu_0_nios2_oci_fifowp_inc_fifowp, which is an e_instance
  cpu_0_nios2_oci_fifowp_inc_fifowp : cpu_0_nios2_oci_fifowp_inc
    port map(
      fifowp_inc => fifowp_inc_fifowp,
      free2 => free2,
      free3 => free3,
      tm_count => tm_count
    );


  --cpu_0_nios2_oci_fifocount_inc_fifocount, which is an e_instance
  cpu_0_nios2_oci_fifocount_inc_fifocount : cpu_0_nios2_oci_fifocount_inc
    port map(
      fifocount_inc => fifocount_inc_fifocount,
      empty => empty,
      free2 => free2,
      free3 => free3,
      tm_count => tm_count
    );


  --the_cpu_0_oci_test_bench, which is an e_instance
  the_cpu_0_oci_test_bench : cpu_0_oci_test_bench
    port map(
      dct_buffer => dct_buffer,
      dct_count => dct_count,
      test_ending => test_ending,
      test_has_ended => test_has_ended
    );


  process (clk, jrst_n)
  begin
    if jrst_n = '0' then
      fiforp <= std_logic_vector'("0000");
      fifowp <= std_logic_vector'("0000");
      fifocount <= std_logic_vector'("00000");
      ovf_pending <= std_logic'('1');
    elsif clk'event and clk = '1' then
      fifowp <= A_EXT (((std_logic_vector'("0") & (fifowp)) + (std_logic_vector'("0") & (fifowp_inc_fifowp))), 4);
      fifocount <= A_EXT (((std_logic_vector'("0") & (fifocount)) + (std_logic_vector'("0") & (fifocount_inc_fifocount))), 5);
      if std_logic'(NOT empty) = '1' then 
        fiforp <= A_EXT (((std_logic_vector'("00000000000000000000000000000") & (fiforp)) + std_logic_vector'("000000000000000000000000000000001")), 4);
      end if;
      if std_logic'(((NOT trc_this OR ((NOT free2 AND tm_count(1)))) OR ((NOT free3 AND (and_reduce(tm_count)))))) = '1' then 
        ovf_pending <= std_logic'('1');
      elsif std_logic'((atm_valid OR dtm_valid)) = '1' then 
        ovf_pending <= std_logic'('0');
      end if;
    end if;

  end process;

  fifohead <= fifo_read_mux;
  tw <= A_WE_StdLogicVector(((std_logic_vector'("00000000000000000000000000000000")) /= std_logic_vector'("00000000000000000000000000000000")), ((A_WE_StdLogicVector((std_logic'(empty) = '1'), std_logic_vector'("0000"), fifohead(35 DOWNTO 32))) & fifohead(31 DOWNTO 0)), itm);
  fifo_0_enable <= (((to_std_logic(((fifowp = std_logic_vector'("0000")))) AND tm_count_ge1)) OR (((free2 AND to_std_logic(((fifowp1 = std_logic_vector'("0000"))))) AND tm_count_ge2))) OR (((free3 AND to_std_logic(((fifowp2 = std_logic_vector'("0000"))))) AND tm_count_ge3));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_0 <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(fifo_0_enable) = '1' then 
        fifo_0 <= fifo_0_mux;
      end if;
    end if;

  end process;

  fifo_0_mux <= A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0000")))) AND itm_valid))) = '1'), itm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0000")))) AND atm_valid))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0000")))) AND dtm_valid))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0000")))) AND (((free2 AND itm_valid) AND atm_valid))))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0000")))) AND (((free2 AND itm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0000")))) AND (((free2 AND atm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, ovr_pending_dtm))))));
  fifo_1_enable <= (((to_std_logic(((fifowp = std_logic_vector'("0001")))) AND tm_count_ge1)) OR (((free2 AND to_std_logic(((fifowp1 = std_logic_vector'("0001"))))) AND tm_count_ge2))) OR (((free3 AND to_std_logic(((fifowp2 = std_logic_vector'("0001"))))) AND tm_count_ge3));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_1 <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(fifo_1_enable) = '1' then 
        fifo_1 <= fifo_1_mux;
      end if;
    end if;

  end process;

  fifo_1_mux <= A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0001")))) AND itm_valid))) = '1'), itm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0001")))) AND atm_valid))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0001")))) AND dtm_valid))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0001")))) AND (((free2 AND itm_valid) AND atm_valid))))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0001")))) AND (((free2 AND itm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0001")))) AND (((free2 AND atm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, ovr_pending_dtm))))));
  fifo_2_enable <= (((to_std_logic(((fifowp = std_logic_vector'("0010")))) AND tm_count_ge1)) OR (((free2 AND to_std_logic(((fifowp1 = std_logic_vector'("0010"))))) AND tm_count_ge2))) OR (((free3 AND to_std_logic(((fifowp2 = std_logic_vector'("0010"))))) AND tm_count_ge3));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_2 <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(fifo_2_enable) = '1' then 
        fifo_2 <= fifo_2_mux;
      end if;
    end if;

  end process;

  fifo_2_mux <= A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0010")))) AND itm_valid))) = '1'), itm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0010")))) AND atm_valid))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0010")))) AND dtm_valid))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0010")))) AND (((free2 AND itm_valid) AND atm_valid))))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0010")))) AND (((free2 AND itm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0010")))) AND (((free2 AND atm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, ovr_pending_dtm))))));
  fifo_3_enable <= (((to_std_logic(((fifowp = std_logic_vector'("0011")))) AND tm_count_ge1)) OR (((free2 AND to_std_logic(((fifowp1 = std_logic_vector'("0011"))))) AND tm_count_ge2))) OR (((free3 AND to_std_logic(((fifowp2 = std_logic_vector'("0011"))))) AND tm_count_ge3));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_3 <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(fifo_3_enable) = '1' then 
        fifo_3 <= fifo_3_mux;
      end if;
    end if;

  end process;

  fifo_3_mux <= A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0011")))) AND itm_valid))) = '1'), itm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0011")))) AND atm_valid))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0011")))) AND dtm_valid))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0011")))) AND (((free2 AND itm_valid) AND atm_valid))))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0011")))) AND (((free2 AND itm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0011")))) AND (((free2 AND atm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, ovr_pending_dtm))))));
  fifo_4_enable <= (((to_std_logic(((fifowp = std_logic_vector'("0100")))) AND tm_count_ge1)) OR (((free2 AND to_std_logic(((fifowp1 = std_logic_vector'("0100"))))) AND tm_count_ge2))) OR (((free3 AND to_std_logic(((fifowp2 = std_logic_vector'("0100"))))) AND tm_count_ge3));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_4 <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(fifo_4_enable) = '1' then 
        fifo_4 <= fifo_4_mux;
      end if;
    end if;

  end process;

  fifo_4_mux <= A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0100")))) AND itm_valid))) = '1'), itm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0100")))) AND atm_valid))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0100")))) AND dtm_valid))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0100")))) AND (((free2 AND itm_valid) AND atm_valid))))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0100")))) AND (((free2 AND itm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0100")))) AND (((free2 AND atm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, ovr_pending_dtm))))));
  fifo_5_enable <= (((to_std_logic(((fifowp = std_logic_vector'("0101")))) AND tm_count_ge1)) OR (((free2 AND to_std_logic(((fifowp1 = std_logic_vector'("0101"))))) AND tm_count_ge2))) OR (((free3 AND to_std_logic(((fifowp2 = std_logic_vector'("0101"))))) AND tm_count_ge3));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_5 <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(fifo_5_enable) = '1' then 
        fifo_5 <= fifo_5_mux;
      end if;
    end if;

  end process;

  fifo_5_mux <= A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0101")))) AND itm_valid))) = '1'), itm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0101")))) AND atm_valid))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0101")))) AND dtm_valid))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0101")))) AND (((free2 AND itm_valid) AND atm_valid))))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0101")))) AND (((free2 AND itm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0101")))) AND (((free2 AND atm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, ovr_pending_dtm))))));
  fifo_6_enable <= (((to_std_logic(((fifowp = std_logic_vector'("0110")))) AND tm_count_ge1)) OR (((free2 AND to_std_logic(((fifowp1 = std_logic_vector'("0110"))))) AND tm_count_ge2))) OR (((free3 AND to_std_logic(((fifowp2 = std_logic_vector'("0110"))))) AND tm_count_ge3));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_6 <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(fifo_6_enable) = '1' then 
        fifo_6 <= fifo_6_mux;
      end if;
    end if;

  end process;

  fifo_6_mux <= A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0110")))) AND itm_valid))) = '1'), itm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0110")))) AND atm_valid))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0110")))) AND dtm_valid))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0110")))) AND (((free2 AND itm_valid) AND atm_valid))))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0110")))) AND (((free2 AND itm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0110")))) AND (((free2 AND atm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, ovr_pending_dtm))))));
  fifo_7_enable <= (((to_std_logic(((fifowp = std_logic_vector'("0111")))) AND tm_count_ge1)) OR (((free2 AND to_std_logic(((fifowp1 = std_logic_vector'("0111"))))) AND tm_count_ge2))) OR (((free3 AND to_std_logic(((fifowp2 = std_logic_vector'("0111"))))) AND tm_count_ge3));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_7 <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(fifo_7_enable) = '1' then 
        fifo_7 <= fifo_7_mux;
      end if;
    end if;

  end process;

  fifo_7_mux <= A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0111")))) AND itm_valid))) = '1'), itm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0111")))) AND atm_valid))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("0111")))) AND dtm_valid))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0111")))) AND (((free2 AND itm_valid) AND atm_valid))))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0111")))) AND (((free2 AND itm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("0111")))) AND (((free2 AND atm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, ovr_pending_dtm))))));
  fifo_8_enable <= (((to_std_logic(((fifowp = std_logic_vector'("1000")))) AND tm_count_ge1)) OR (((free2 AND to_std_logic(((fifowp1 = std_logic_vector'("1000"))))) AND tm_count_ge2))) OR (((free3 AND to_std_logic(((fifowp2 = std_logic_vector'("1000"))))) AND tm_count_ge3));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_8 <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(fifo_8_enable) = '1' then 
        fifo_8 <= fifo_8_mux;
      end if;
    end if;

  end process;

  fifo_8_mux <= A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1000")))) AND itm_valid))) = '1'), itm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1000")))) AND atm_valid))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1000")))) AND dtm_valid))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1000")))) AND (((free2 AND itm_valid) AND atm_valid))))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1000")))) AND (((free2 AND itm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1000")))) AND (((free2 AND atm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, ovr_pending_dtm))))));
  fifo_9_enable <= (((to_std_logic(((fifowp = std_logic_vector'("1001")))) AND tm_count_ge1)) OR (((free2 AND to_std_logic(((fifowp1 = std_logic_vector'("1001"))))) AND tm_count_ge2))) OR (((free3 AND to_std_logic(((fifowp2 = std_logic_vector'("1001"))))) AND tm_count_ge3));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_9 <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(fifo_9_enable) = '1' then 
        fifo_9 <= fifo_9_mux;
      end if;
    end if;

  end process;

  fifo_9_mux <= A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1001")))) AND itm_valid))) = '1'), itm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1001")))) AND atm_valid))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1001")))) AND dtm_valid))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1001")))) AND (((free2 AND itm_valid) AND atm_valid))))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1001")))) AND (((free2 AND itm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1001")))) AND (((free2 AND atm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, ovr_pending_dtm))))));
  fifo_10_enable <= (((to_std_logic(((fifowp = std_logic_vector'("1010")))) AND tm_count_ge1)) OR (((free2 AND to_std_logic(((fifowp1 = std_logic_vector'("1010"))))) AND tm_count_ge2))) OR (((free3 AND to_std_logic(((fifowp2 = std_logic_vector'("1010"))))) AND tm_count_ge3));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_10 <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(fifo_10_enable) = '1' then 
        fifo_10 <= fifo_10_mux;
      end if;
    end if;

  end process;

  fifo_10_mux <= A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1010")))) AND itm_valid))) = '1'), itm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1010")))) AND atm_valid))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1010")))) AND dtm_valid))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1010")))) AND (((free2 AND itm_valid) AND atm_valid))))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1010")))) AND (((free2 AND itm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1010")))) AND (((free2 AND atm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, ovr_pending_dtm))))));
  fifo_11_enable <= (((to_std_logic(((fifowp = std_logic_vector'("1011")))) AND tm_count_ge1)) OR (((free2 AND to_std_logic(((fifowp1 = std_logic_vector'("1011"))))) AND tm_count_ge2))) OR (((free3 AND to_std_logic(((fifowp2 = std_logic_vector'("1011"))))) AND tm_count_ge3));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_11 <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(fifo_11_enable) = '1' then 
        fifo_11 <= fifo_11_mux;
      end if;
    end if;

  end process;

  fifo_11_mux <= A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1011")))) AND itm_valid))) = '1'), itm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1011")))) AND atm_valid))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1011")))) AND dtm_valid))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1011")))) AND (((free2 AND itm_valid) AND atm_valid))))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1011")))) AND (((free2 AND itm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1011")))) AND (((free2 AND atm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, ovr_pending_dtm))))));
  fifo_12_enable <= (((to_std_logic(((fifowp = std_logic_vector'("1100")))) AND tm_count_ge1)) OR (((free2 AND to_std_logic(((fifowp1 = std_logic_vector'("1100"))))) AND tm_count_ge2))) OR (((free3 AND to_std_logic(((fifowp2 = std_logic_vector'("1100"))))) AND tm_count_ge3));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_12 <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(fifo_12_enable) = '1' then 
        fifo_12 <= fifo_12_mux;
      end if;
    end if;

  end process;

  fifo_12_mux <= A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1100")))) AND itm_valid))) = '1'), itm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1100")))) AND atm_valid))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1100")))) AND dtm_valid))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1100")))) AND (((free2 AND itm_valid) AND atm_valid))))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1100")))) AND (((free2 AND itm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1100")))) AND (((free2 AND atm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, ovr_pending_dtm))))));
  fifo_13_enable <= (((to_std_logic(((fifowp = std_logic_vector'("1101")))) AND tm_count_ge1)) OR (((free2 AND to_std_logic(((fifowp1 = std_logic_vector'("1101"))))) AND tm_count_ge2))) OR (((free3 AND to_std_logic(((fifowp2 = std_logic_vector'("1101"))))) AND tm_count_ge3));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_13 <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(fifo_13_enable) = '1' then 
        fifo_13 <= fifo_13_mux;
      end if;
    end if;

  end process;

  fifo_13_mux <= A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1101")))) AND itm_valid))) = '1'), itm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1101")))) AND atm_valid))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1101")))) AND dtm_valid))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1101")))) AND (((free2 AND itm_valid) AND atm_valid))))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1101")))) AND (((free2 AND itm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1101")))) AND (((free2 AND atm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, ovr_pending_dtm))))));
  fifo_14_enable <= (((to_std_logic(((fifowp = std_logic_vector'("1110")))) AND tm_count_ge1)) OR (((free2 AND to_std_logic(((fifowp1 = std_logic_vector'("1110"))))) AND tm_count_ge2))) OR (((free3 AND to_std_logic(((fifowp2 = std_logic_vector'("1110"))))) AND tm_count_ge3));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_14 <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(fifo_14_enable) = '1' then 
        fifo_14 <= fifo_14_mux;
      end if;
    end if;

  end process;

  fifo_14_mux <= A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1110")))) AND itm_valid))) = '1'), itm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1110")))) AND atm_valid))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1110")))) AND dtm_valid))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1110")))) AND (((free2 AND itm_valid) AND atm_valid))))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1110")))) AND (((free2 AND itm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1110")))) AND (((free2 AND atm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, ovr_pending_dtm))))));
  fifo_15_enable <= (((to_std_logic(((fifowp = std_logic_vector'("1111")))) AND tm_count_ge1)) OR (((free2 AND to_std_logic(((fifowp1 = std_logic_vector'("1111"))))) AND tm_count_ge2))) OR (((free3 AND to_std_logic(((fifowp2 = std_logic_vector'("1111"))))) AND tm_count_ge3));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_15 <= std_logic_vector'("000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(fifo_15_enable) = '1' then 
        fifo_15 <= fifo_15_mux;
      end if;
    end if;

  end process;

  fifo_15_mux <= A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1111")))) AND itm_valid))) = '1'), itm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1111")))) AND atm_valid))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp = std_logic_vector'("1111")))) AND dtm_valid))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1111")))) AND (((free2 AND itm_valid) AND atm_valid))))) = '1'), ovr_pending_atm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1111")))) AND (((free2 AND itm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, A_WE_StdLogicVector((std_logic'(((to_std_logic(((fifowp1 = std_logic_vector'("1111")))) AND (((free2 AND atm_valid) AND dtm_valid))))) = '1'), ovr_pending_dtm, ovr_pending_dtm))))));
  tm_count_ge1 <= or_reduce(tm_count);
  tm_count_ge2 <= tm_count(1);
  tm_count_ge3 <= and_reduce(tm_count);
  ovr_pending_atm <= Std_Logic_Vector'(A_ToStdLogicVector(ovf_pending) & atm(34 DOWNTO 0));
  ovr_pending_dtm <= Std_Logic_Vector'(A_ToStdLogicVector(ovf_pending) & dtm(34 DOWNTO 0));
  fifo_read_mux <= A_WE_StdLogicVector(((fiforp = std_logic_vector'("0000"))), fifo_0, A_WE_StdLogicVector(((fiforp = std_logic_vector'("0001"))), fifo_1, A_WE_StdLogicVector(((fiforp = std_logic_vector'("0010"))), fifo_2, A_WE_StdLogicVector(((fiforp = std_logic_vector'("0011"))), fifo_3, A_WE_StdLogicVector(((fiforp = std_logic_vector'("0100"))), fifo_4, A_WE_StdLogicVector(((fiforp = std_logic_vector'("0101"))), fifo_5, A_WE_StdLogicVector(((fiforp = std_logic_vector'("0110"))), fifo_6, A_WE_StdLogicVector(((fiforp = std_logic_vector'("0111"))), fifo_7, A_WE_StdLogicVector(((fiforp = std_logic_vector'("1000"))), fifo_8, A_WE_StdLogicVector(((fiforp = std_logic_vector'("1001"))), fifo_9, A_WE_StdLogicVector(((fiforp = std_logic_vector'("1010"))), fifo_10, A_WE_StdLogicVector(((fiforp = std_logic_vector'("1011"))), fifo_11, A_WE_StdLogicVector(((fiforp = std_logic_vector'("1100"))), fifo_12, A_WE_StdLogicVector(((fiforp = std_logic_vector'("1101"))), fifo_13, A_WE_StdLogicVector(((fiforp = std_logic_vector'("1110"))), fifo_14, fifo_15)))))))))))))));

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_oci_pib is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal clkx2 : IN STD_LOGIC;
                 signal jrst_n : IN STD_LOGIC;
                 signal tw : IN STD_LOGIC_VECTOR (35 DOWNTO 0);

              -- outputs:
                 signal tr_clk : OUT STD_LOGIC;
                 signal tr_data : OUT STD_LOGIC_VECTOR (17 DOWNTO 0)
              );
end entity cpu_0_nios2_oci_pib;


architecture europa of cpu_0_nios2_oci_pib is
                signal phase :  STD_LOGIC;
                signal tr_clk_reg :  STD_LOGIC;
                signal tr_data_reg :  STD_LOGIC_VECTOR (17 DOWNTO 0);
                signal x1 :  STD_LOGIC;
                signal x2 :  STD_LOGIC;
attribute ALTERA_ATTRIBUTE : string;
attribute ALTERA_ATTRIBUTE of tr_clk_reg : signal is "SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of tr_data_reg : signal is "SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of x1 : signal is "SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of x2 : signal is "SUPPRESS_DA_RULE_INTERNAL=R101";

begin

  phase <= x1 XOR x2;
  process (clk, jrst_n)
  begin
    if jrst_n = '0' then
      x1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      x1 <= NOT x1;
    end if;

  end process;

  process (clkx2, jrst_n)
  begin
    if jrst_n = '0' then
      x2 <= std_logic'('0');
      tr_clk_reg <= std_logic'('0');
      tr_data_reg <= std_logic_vector'("000000000000000000");
    elsif clkx2'event and clkx2 = '1' then
      x2 <= x1;
      tr_clk_reg <= NOT phase;
      tr_data_reg <= A_WE_StdLogicVector((std_logic'(phase) = '1'), tw(17 DOWNTO 0), tw(35 DOWNTO 18));
    end if;

  end process;

  tr_clk <= Vector_To_Std_Logic(A_WE_StdLogicVector(((std_logic_vector'("00000000000000000000000000000000")) /= std_logic_vector'("00000000000000000000000000000000")), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(tr_clk_reg))), std_logic_vector'("00000000000000000000000000000000")));
  tr_data <= A_EXT (A_WE_StdLogicVector(((std_logic_vector'("00000000000000000000000000000000")) /= std_logic_vector'("00000000000000000000000000000000")), (std_logic_vector'("00000000000000") & (tr_data_reg)), std_logic_vector'("00000000000000000000000000000000")), 18);

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lpm;
use lpm.all;

entity cpu_0_traceram_lpm_dram_bdp_component_module is 
        generic (
                 lpm_file : STRING := "UNUSED"
                 );
        port (
              -- inputs:
                 signal address_a : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
                 signal address_b : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
                 signal clock0 : IN STD_LOGIC;
                 signal clock1 : IN STD_LOGIC;
                 signal clocken0 : IN STD_LOGIC;
                 signal clocken1 : IN STD_LOGIC;
                 signal data_a : IN STD_LOGIC_VECTOR (35 DOWNTO 0);
                 signal data_b : IN STD_LOGIC_VECTOR (35 DOWNTO 0);
                 signal wren_a : IN STD_LOGIC;
                 signal wren_b : IN STD_LOGIC;

              -- outputs:
                 signal q_a : OUT STD_LOGIC_VECTOR (35 DOWNTO 0);
                 signal q_b : OUT STD_LOGIC_VECTOR (35 DOWNTO 0)
              );
end entity cpu_0_traceram_lpm_dram_bdp_component_module;


architecture europa of cpu_0_traceram_lpm_dram_bdp_component_module is
  component altsyncram is
GENERIC (
      address_aclr_a : STRING;
        address_aclr_b : STRING;
        address_reg_b : STRING;
        indata_aclr_a : STRING;
        indata_aclr_b : STRING;
        init_file : STRING;
        intended_device_family : STRING;
        lpm_type : STRING;
        numwords_a : NATURAL;
        numwords_b : NATURAL;
        operation_mode : STRING;
        outdata_aclr_a : STRING;
        outdata_aclr_b : STRING;
        outdata_reg_a : STRING;
        outdata_reg_b : STRING;
        ram_block_type : STRING;
        read_during_write_mode_mixed_ports : STRING;
        width_a : NATURAL;
        width_b : NATURAL;
        widthad_a : NATURAL;
        widthad_b : NATURAL;
        wrcontrol_aclr_a : STRING;
        wrcontrol_aclr_b : STRING
      );
    PORT (
    signal q_b : OUT STD_LOGIC_VECTOR (35 DOWNTO 0);
        signal q_a : OUT STD_LOGIC_VECTOR (35 DOWNTO 0);
        signal wren_a : IN STD_LOGIC;
        signal data_b : IN STD_LOGIC_VECTOR (35 DOWNTO 0);
        signal clock0 : IN STD_LOGIC;
        signal clocken0 : IN STD_LOGIC;
        signal clocken1 : IN STD_LOGIC;
        signal clock1 : IN STD_LOGIC;
        signal wren_b : IN STD_LOGIC;
        signal address_a : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
        signal address_b : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
        signal data_a : IN STD_LOGIC_VECTOR (35 DOWNTO 0)
      );
  end component altsyncram;
                signal internal_q_a1 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal internal_q_b1 :  STD_LOGIC_VECTOR (35 DOWNTO 0);

begin

  the_altsyncram : altsyncram
    generic map(
      address_aclr_a => "NONE",
      address_aclr_b => "NONE",
      address_reg_b => "CLOCK1",
      indata_aclr_a => "NONE",
      indata_aclr_b => "NONE",
      init_file => lpm_file,
      intended_device_family => "CYCLONEIVE",
      lpm_type => "altsyncram",
      numwords_a => 128,
      numwords_b => 128,
      operation_mode => "BIDIR_DUAL_PORT",
      outdata_aclr_a => "NONE",
      outdata_aclr_b => "NONE",
      outdata_reg_a => "UNREGISTERED",
      outdata_reg_b => "UNREGISTERED",
      ram_block_type => "AUTO",
      read_during_write_mode_mixed_ports => "OLD_DATA",
      width_a => 36,
      width_b => 36,
      widthad_a => 7,
      widthad_b => 7,
      wrcontrol_aclr_a => "NONE",
      wrcontrol_aclr_b => "NONE"
    )
    port map(
            address_a => address_a,
            address_b => address_b,
            clock0 => clock0,
            clock1 => clock1,
            clocken0 => clocken0,
            clocken1 => clocken1,
            data_a => data_a,
            data_b => data_b,
            q_a => internal_q_a1,
            q_b => internal_q_b1,
            wren_a => wren_a,
            wren_b => wren_b
    );

  --vhdl renameroo for output signals
  q_a <= internal_q_a1;
  --vhdl renameroo for output signals
  q_b <= internal_q_b1;

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_oci_im is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal jdo : IN STD_LOGIC_VECTOR (37 DOWNTO 0);
                 signal jrst_n : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal take_action_tracectrl : IN STD_LOGIC;
                 signal take_action_tracemem_a : IN STD_LOGIC;
                 signal take_action_tracemem_b : IN STD_LOGIC;
                 signal take_no_action_tracemem_a : IN STD_LOGIC;
                 signal trc_ctrl : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal tw : IN STD_LOGIC_VECTOR (35 DOWNTO 0);

              -- outputs:
                 signal tracemem_on : OUT STD_LOGIC;
                 signal tracemem_trcdata : OUT STD_LOGIC_VECTOR (35 DOWNTO 0);
                 signal tracemem_tw : OUT STD_LOGIC;
                 signal trc_enb : OUT STD_LOGIC;
                 signal trc_im_addr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
                 signal trc_wrap : OUT STD_LOGIC;
                 signal xbrk_wrap_traceoff : OUT STD_LOGIC
              );
end entity cpu_0_nios2_oci_im;


architecture europa of cpu_0_nios2_oci_im is
component cpu_0_traceram_lpm_dram_bdp_component_module is 
           generic (
                    lpm_file : STRING := "UNUSED"
                    );
           port (
                 -- inputs:
                    signal address_a : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
                    signal address_b : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
                    signal clock0 : IN STD_LOGIC;
                    signal clock1 : IN STD_LOGIC;
                    signal clocken0 : IN STD_LOGIC;
                    signal clocken1 : IN STD_LOGIC;
                    signal data_a : IN STD_LOGIC_VECTOR (35 DOWNTO 0);
                    signal data_b : IN STD_LOGIC_VECTOR (35 DOWNTO 0);
                    signal wren_a : IN STD_LOGIC;
                    signal wren_b : IN STD_LOGIC;

                 -- outputs:
                    signal q_a : OUT STD_LOGIC_VECTOR (35 DOWNTO 0);
                    signal q_b : OUT STD_LOGIC_VECTOR (35 DOWNTO 0)
                 );
end component cpu_0_traceram_lpm_dram_bdp_component_module;

                signal internal_trc_enb :  STD_LOGIC;
                signal internal_trc_im_addr :  STD_LOGIC_VECTOR (6 DOWNTO 0);
                signal internal_trc_wrap :  STD_LOGIC;
                signal module_input10 :  STD_LOGIC;
                signal module_input7 :  STD_LOGIC;
                signal module_input8 :  STD_LOGIC;
                signal module_input9 :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal trc_im_data :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal trc_jtag_addr :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal trc_jtag_data :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal trc_on_chip :  STD_LOGIC;
                signal tw_valid :  STD_LOGIC;
                signal unused_bdpram_port_q_a :  STD_LOGIC_VECTOR (35 DOWNTO 0);
attribute ALTERA_ATTRIBUTE : string;
attribute ALTERA_ATTRIBUTE of trc_im_addr : signal is "SUPPRESS_DA_RULE_INTERNAL=""D101,D103,R101""";
attribute ALTERA_ATTRIBUTE of trc_jtag_addr : signal is "SUPPRESS_DA_RULE_INTERNAL=D101";
attribute ALTERA_ATTRIBUTE of trc_wrap : signal is "SUPPRESS_DA_RULE_INTERNAL=""D101,D103,R101""";
  constant cpu_0_traceram_lpm_dram_bdp_component_lpm_file : string := "";

begin

  trc_im_data <= tw;
  process (clk, jrst_n)
  begin
    if jrst_n = '0' then
      internal_trc_im_addr <= std_logic_vector'("0000000");
      internal_trc_wrap <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(NOT(or_reduce(std_logic_vector'("00000000000000000000000000000000")))) = '1' then 
        internal_trc_im_addr <= std_logic_vector'("0000000");
        internal_trc_wrap <= std_logic'('0');
      elsif std_logic'((take_action_tracectrl AND ((jdo(4) OR jdo(3))))) = '1' then 
        if std_logic'(jdo(4)) = '1' then 
          internal_trc_im_addr <= std_logic_vector'("0000000");
        end if;
        if std_logic'(jdo(3)) = '1' then 
          internal_trc_wrap <= std_logic'('0');
        end if;
      elsif std_logic'(((internal_trc_enb AND trc_on_chip) AND tw_valid)) = '1' then 
        internal_trc_im_addr <= A_EXT (((std_logic_vector'("00000000000000000000000000") & (internal_trc_im_addr)) + std_logic_vector'("000000000000000000000000000000001")), 7);
        if std_logic'(and_reduce(internal_trc_im_addr)) = '1' then 
          internal_trc_wrap <= std_logic'('1');
        end if;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      trc_jtag_addr <= std_logic_vector'("00000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(((take_action_tracemem_a OR take_no_action_tracemem_a) OR take_action_tracemem_b)) = '1' then 
        trc_jtag_addr <= A_EXT (A_WE_StdLogicVector((std_logic'(take_action_tracemem_a) = '1'), (std_logic_vector'("0000000000000000") & (jdo(35 DOWNTO 19))), ((std_logic_vector'("0000000000000000") & (trc_jtag_addr)) + std_logic_vector'("000000000000000000000000000000001"))), 17);
      end if;
    end if;

  end process;

  internal_trc_enb <= trc_ctrl(0);
  trc_on_chip <= NOT trc_ctrl(8);
  tw_valid <= or_reduce(trc_im_data(35 DOWNTO 32));
  xbrk_wrap_traceoff <= trc_ctrl(10) AND internal_trc_wrap;
  tracemem_trcdata <= A_WE_StdLogicVector((((std_logic_vector'("00000000000000000000000000000000"))) /= std_logic_vector'("00000000000000000000000000000000")), trc_jtag_data, std_logic_vector'("000000000000000000000000000000000000"));
  tracemem_tw <= internal_trc_wrap;
  tracemem_on <= internal_trc_enb;
  --cpu_0_traceram_lpm_dram_bdp_component, which is an nios_tdp_ram
  cpu_0_traceram_lpm_dram_bdp_component : cpu_0_traceram_lpm_dram_bdp_component_module
    generic map(
      lpm_file => cpu_0_traceram_lpm_dram_bdp_component_lpm_file
    )
    port map(
      q_a => unused_bdpram_port_q_a,
      q_b => trc_jtag_data,
      address_a => internal_trc_im_addr,
      address_b => trc_jtag_addr (6 DOWNTO 0),
      clock0 => clk,
      clock1 => clk,
      clocken0 => module_input7,
      clocken1 => module_input8,
      data_a => trc_im_data,
      data_b => module_input9,
      wren_a => module_input10,
      wren_b => take_action_tracemem_b
    );

  module_input7 <= std_logic'('1');
  module_input8 <= std_logic'('1');
  module_input9 <= jdo(36 DOWNTO 1);
  module_input10 <= tw_valid AND internal_trc_enb;

  --vhdl renameroo for output signals
  trc_enb <= internal_trc_enb;
  --vhdl renameroo for output signals
  trc_im_addr <= internal_trc_im_addr;
  --vhdl renameroo for output signals
  trc_wrap <= internal_trc_wrap;

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_performance_monitors is 
end entity cpu_0_nios2_performance_monitors;


architecture europa of cpu_0_nios2_performance_monitors is

begin


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_nios2_oci is 
        port (
              -- inputs:
                 signal D_valid : IN STD_LOGIC;
                 signal E_st_data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal E_valid : IN STD_LOGIC;
                 signal F_pc : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
                 signal address : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                 signal av_ld_data_aligned_filtered : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal begintransfer : IN STD_LOGIC;
                 signal byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal chipselect : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal d_address : IN STD_LOGIC_VECTOR (26 DOWNTO 0);
                 signal d_read : IN STD_LOGIC;
                 signal d_waitrequest : IN STD_LOGIC;
                 signal d_write : IN STD_LOGIC;
                 signal debugaccess : IN STD_LOGIC;
                 signal hbreak_enabled : IN STD_LOGIC;
                 signal reset : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal test_ending : IN STD_LOGIC;
                 signal test_has_ended : IN STD_LOGIC;
                 signal write : IN STD_LOGIC;
                 signal writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

              -- outputs:
                 signal jtag_debug_module_debugaccess_to_roms : OUT STD_LOGIC;
                 signal oci_hbreak_req : OUT STD_LOGIC;
                 signal oci_ienable : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal oci_single_step_mode : OUT STD_LOGIC;
                 signal readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal resetrequest : OUT STD_LOGIC
              );
end entity cpu_0_nios2_oci;


architecture europa of cpu_0_nios2_oci is
component cpu_0_nios2_oci_debug is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal dbrk_break : IN STD_LOGIC;
                    signal debugreq : IN STD_LOGIC;
                    signal hbreak_enabled : IN STD_LOGIC;
                    signal jdo : IN STD_LOGIC_VECTOR (37 DOWNTO 0);
                    signal jrst_n : IN STD_LOGIC;
                    signal ocireg_ers : IN STD_LOGIC;
                    signal ocireg_mrs : IN STD_LOGIC;
                    signal reset : IN STD_LOGIC;
                    signal st_ready_test_idle : IN STD_LOGIC;
                    signal take_action_ocimem_a : IN STD_LOGIC;
                    signal take_action_ocireg : IN STD_LOGIC;
                    signal xbrk_break : IN STD_LOGIC;

                 -- outputs:
                    signal debugack : OUT STD_LOGIC;
                    signal monitor_error : OUT STD_LOGIC;
                    signal monitor_go : OUT STD_LOGIC;
                    signal monitor_ready : OUT STD_LOGIC;
                    signal oci_hbreak_req : OUT STD_LOGIC;
                    signal resetlatch : OUT STD_LOGIC;
                    signal resetrequest : OUT STD_LOGIC
                 );
end component cpu_0_nios2_oci_debug;

component cpu_0_nios2_ocimem is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                    signal begintransfer : IN STD_LOGIC;
                    signal byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal debugaccess : IN STD_LOGIC;
                    signal jdo : IN STD_LOGIC_VECTOR (37 DOWNTO 0);
                    signal jrst_n : IN STD_LOGIC;
                    signal resetrequest : IN STD_LOGIC;
                    signal take_action_ocimem_a : IN STD_LOGIC;
                    signal take_action_ocimem_b : IN STD_LOGIC;
                    signal take_no_action_ocimem_a : IN STD_LOGIC;
                    signal write : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal MonDReg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal oci_ram_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component cpu_0_nios2_ocimem;

component cpu_0_nios2_avalon_reg is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal debugaccess : IN STD_LOGIC;
                    signal monitor_error : IN STD_LOGIC;
                    signal monitor_go : IN STD_LOGIC;
                    signal monitor_ready : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal write : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal oci_ienable : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal oci_reg_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal oci_single_step_mode : OUT STD_LOGIC;
                    signal ocireg_ers : OUT STD_LOGIC;
                    signal ocireg_mrs : OUT STD_LOGIC;
                    signal take_action_ocireg : OUT STD_LOGIC
                 );
end component cpu_0_nios2_avalon_reg;

component cpu_0_nios2_oci_break is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal dbrk_break : IN STD_LOGIC;
                    signal dbrk_goto0 : IN STD_LOGIC;
                    signal dbrk_goto1 : IN STD_LOGIC;
                    signal jdo : IN STD_LOGIC_VECTOR (37 DOWNTO 0);
                    signal jrst_n : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal take_action_break_a : IN STD_LOGIC;
                    signal take_action_break_b : IN STD_LOGIC;
                    signal take_action_break_c : IN STD_LOGIC;
                    signal take_no_action_break_a : IN STD_LOGIC;
                    signal take_no_action_break_b : IN STD_LOGIC;
                    signal take_no_action_break_c : IN STD_LOGIC;
                    signal xbrk_goto0 : IN STD_LOGIC;
                    signal xbrk_goto1 : IN STD_LOGIC;

                 -- outputs:
                    signal break_readreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal dbrk_hit0_latch : OUT STD_LOGIC;
                    signal dbrk_hit1_latch : OUT STD_LOGIC;
                    signal dbrk_hit2_latch : OUT STD_LOGIC;
                    signal dbrk_hit3_latch : OUT STD_LOGIC;
                    signal trigbrktype : OUT STD_LOGIC;
                    signal trigger_state_0 : OUT STD_LOGIC;
                    signal trigger_state_1 : OUT STD_LOGIC;
                    signal xbrk_ctrl0 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal xbrk_ctrl1 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal xbrk_ctrl2 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal xbrk_ctrl3 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
                 );
end component cpu_0_nios2_oci_break;

component cpu_0_nios2_oci_xbrk is 
           port (
                 -- inputs:
                    signal D_valid : IN STD_LOGIC;
                    signal E_valid : IN STD_LOGIC;
                    signal F_pc : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal trigger_state_0 : IN STD_LOGIC;
                    signal trigger_state_1 : IN STD_LOGIC;
                    signal xbrk_ctrl0 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal xbrk_ctrl1 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal xbrk_ctrl2 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal xbrk_ctrl3 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);

                 -- outputs:
                    signal xbrk_break : OUT STD_LOGIC;
                    signal xbrk_goto0 : OUT STD_LOGIC;
                    signal xbrk_goto1 : OUT STD_LOGIC;
                    signal xbrk_traceoff : OUT STD_LOGIC;
                    signal xbrk_traceon : OUT STD_LOGIC;
                    signal xbrk_trigout : OUT STD_LOGIC
                 );
end component cpu_0_nios2_oci_xbrk;

component cpu_0_nios2_oci_dbrk is 
           port (
                 -- inputs:
                    signal E_st_data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal av_ld_data_aligned_filtered : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal d_address : IN STD_LOGIC_VECTOR (26 DOWNTO 0);
                    signal d_read : IN STD_LOGIC;
                    signal d_waitrequest : IN STD_LOGIC;
                    signal d_write : IN STD_LOGIC;
                    signal debugack : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_d_address : OUT STD_LOGIC_VECTOR (26 DOWNTO 0);
                    signal cpu_d_read : OUT STD_LOGIC;
                    signal cpu_d_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_d_wait : OUT STD_LOGIC;
                    signal cpu_d_write : OUT STD_LOGIC;
                    signal cpu_d_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal dbrk_break : OUT STD_LOGIC;
                    signal dbrk_goto0 : OUT STD_LOGIC;
                    signal dbrk_goto1 : OUT STD_LOGIC;
                    signal dbrk_traceme : OUT STD_LOGIC;
                    signal dbrk_traceoff : OUT STD_LOGIC;
                    signal dbrk_traceon : OUT STD_LOGIC;
                    signal dbrk_trigout : OUT STD_LOGIC
                 );
end component cpu_0_nios2_oci_dbrk;

component cpu_0_nios2_oci_itrace is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal dbrk_traceoff : IN STD_LOGIC;
                    signal dbrk_traceon : IN STD_LOGIC;
                    signal jdo : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal jrst_n : IN STD_LOGIC;
                    signal take_action_tracectrl : IN STD_LOGIC;
                    signal trc_enb : IN STD_LOGIC;
                    signal xbrk_traceoff : IN STD_LOGIC;
                    signal xbrk_traceon : IN STD_LOGIC;
                    signal xbrk_wrap_traceoff : IN STD_LOGIC;

                 -- outputs:
                    signal dct_buffer : OUT STD_LOGIC_VECTOR (29 DOWNTO 0);
                    signal dct_count : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal itm : OUT STD_LOGIC_VECTOR (35 DOWNTO 0);
                    signal trc_ctrl : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal trc_on : OUT STD_LOGIC
                 );
end component cpu_0_nios2_oci_itrace;

component cpu_0_nios2_oci_dtrace is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_d_address : IN STD_LOGIC_VECTOR (26 DOWNTO 0);
                    signal cpu_d_read : IN STD_LOGIC;
                    signal cpu_d_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_d_wait : IN STD_LOGIC;
                    signal cpu_d_write : IN STD_LOGIC;
                    signal cpu_d_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal jrst_n : IN STD_LOGIC;
                    signal trc_ctrl : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal atm : OUT STD_LOGIC_VECTOR (35 DOWNTO 0);
                    signal dtm : OUT STD_LOGIC_VECTOR (35 DOWNTO 0)
                 );
end component cpu_0_nios2_oci_dtrace;

component cpu_0_nios2_oci_fifo is 
           port (
                 -- inputs:
                    signal atm : IN STD_LOGIC_VECTOR (35 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal dbrk_traceme : IN STD_LOGIC;
                    signal dbrk_traceoff : IN STD_LOGIC;
                    signal dbrk_traceon : IN STD_LOGIC;
                    signal dct_buffer : IN STD_LOGIC_VECTOR (29 DOWNTO 0);
                    signal dct_count : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal dtm : IN STD_LOGIC_VECTOR (35 DOWNTO 0);
                    signal itm : IN STD_LOGIC_VECTOR (35 DOWNTO 0);
                    signal jrst_n : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal test_ending : IN STD_LOGIC;
                    signal test_has_ended : IN STD_LOGIC;
                    signal trc_on : IN STD_LOGIC;

                 -- outputs:
                    signal tw : OUT STD_LOGIC_VECTOR (35 DOWNTO 0)
                 );
end component cpu_0_nios2_oci_fifo;

component cpu_0_nios2_oci_pib is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal clkx2 : IN STD_LOGIC;
                    signal jrst_n : IN STD_LOGIC;
                    signal tw : IN STD_LOGIC_VECTOR (35 DOWNTO 0);

                 -- outputs:
                    signal tr_clk : OUT STD_LOGIC;
                    signal tr_data : OUT STD_LOGIC_VECTOR (17 DOWNTO 0)
                 );
end component cpu_0_nios2_oci_pib;

component cpu_0_nios2_oci_im is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal jdo : IN STD_LOGIC_VECTOR (37 DOWNTO 0);
                    signal jrst_n : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal take_action_tracectrl : IN STD_LOGIC;
                    signal take_action_tracemem_a : IN STD_LOGIC;
                    signal take_action_tracemem_b : IN STD_LOGIC;
                    signal take_no_action_tracemem_a : IN STD_LOGIC;
                    signal trc_ctrl : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal tw : IN STD_LOGIC_VECTOR (35 DOWNTO 0);

                 -- outputs:
                    signal tracemem_on : OUT STD_LOGIC;
                    signal tracemem_trcdata : OUT STD_LOGIC_VECTOR (35 DOWNTO 0);
                    signal tracemem_tw : OUT STD_LOGIC;
                    signal trc_enb : OUT STD_LOGIC;
                    signal trc_im_addr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
                    signal trc_wrap : OUT STD_LOGIC;
                    signal xbrk_wrap_traceoff : OUT STD_LOGIC
                 );
end component cpu_0_nios2_oci_im;

component cpu_0_nios2_performance_monitors is 
end component cpu_0_nios2_performance_monitors;

component cpu_0_jtag_debug_module_wrapper is 
           port (
                 -- inputs:
                    signal MonDReg : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal break_readreg : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal dbrk_hit0_latch : IN STD_LOGIC;
                    signal dbrk_hit1_latch : IN STD_LOGIC;
                    signal dbrk_hit2_latch : IN STD_LOGIC;
                    signal dbrk_hit3_latch : IN STD_LOGIC;
                    signal debugack : IN STD_LOGIC;
                    signal monitor_error : IN STD_LOGIC;
                    signal monitor_ready : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal resetlatch : IN STD_LOGIC;
                    signal tracemem_on : IN STD_LOGIC;
                    signal tracemem_trcdata : IN STD_LOGIC_VECTOR (35 DOWNTO 0);
                    signal tracemem_tw : IN STD_LOGIC;
                    signal trc_im_addr : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
                    signal trc_on : IN STD_LOGIC;
                    signal trc_wrap : IN STD_LOGIC;
                    signal trigbrktype : IN STD_LOGIC;
                    signal trigger_state_1 : IN STD_LOGIC;

                 -- outputs:
                    signal jdo : OUT STD_LOGIC_VECTOR (37 DOWNTO 0);
                    signal jrst_n : OUT STD_LOGIC;
                    signal st_ready_test_idle : OUT STD_LOGIC;
                    signal take_action_break_a : OUT STD_LOGIC;
                    signal take_action_break_b : OUT STD_LOGIC;
                    signal take_action_break_c : OUT STD_LOGIC;
                    signal take_action_ocimem_a : OUT STD_LOGIC;
                    signal take_action_ocimem_b : OUT STD_LOGIC;
                    signal take_action_tracectrl : OUT STD_LOGIC;
                    signal take_action_tracemem_a : OUT STD_LOGIC;
                    signal take_action_tracemem_b : OUT STD_LOGIC;
                    signal take_no_action_break_a : OUT STD_LOGIC;
                    signal take_no_action_break_b : OUT STD_LOGIC;
                    signal take_no_action_break_c : OUT STD_LOGIC;
                    signal take_no_action_ocimem_a : OUT STD_LOGIC;
                    signal take_no_action_tracemem_a : OUT STD_LOGIC
                 );
end component cpu_0_jtag_debug_module_wrapper;

                signal MonDReg :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal atm :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal break_readreg :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal clkx2 :  STD_LOGIC;
                signal cpu_d_address :  STD_LOGIC_VECTOR (26 DOWNTO 0);
                signal cpu_d_read :  STD_LOGIC;
                signal cpu_d_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_d_wait :  STD_LOGIC;
                signal cpu_d_write :  STD_LOGIC;
                signal cpu_d_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal dbrk_break :  STD_LOGIC;
                signal dbrk_goto0 :  STD_LOGIC;
                signal dbrk_goto1 :  STD_LOGIC;
                signal dbrk_hit0_latch :  STD_LOGIC;
                signal dbrk_hit1_latch :  STD_LOGIC;
                signal dbrk_hit2_latch :  STD_LOGIC;
                signal dbrk_hit3_latch :  STD_LOGIC;
                signal dbrk_traceme :  STD_LOGIC;
                signal dbrk_traceoff :  STD_LOGIC;
                signal dbrk_traceon :  STD_LOGIC;
                signal dbrk_trigout :  STD_LOGIC;
                signal dct_buffer :  STD_LOGIC_VECTOR (29 DOWNTO 0);
                signal dct_count :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal debugack :  STD_LOGIC;
                signal debugreq :  STD_LOGIC;
                signal dtm :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal dummy_sink :  STD_LOGIC;
                signal internal_oci_hbreak_req :  STD_LOGIC;
                signal internal_oci_ienable :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal internal_oci_single_step_mode :  STD_LOGIC;
                signal internal_resetrequest :  STD_LOGIC;
                signal itm :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal jdo :  STD_LOGIC_VECTOR (37 DOWNTO 0);
                signal jrst_n :  STD_LOGIC;
                signal monitor_error :  STD_LOGIC;
                signal monitor_go :  STD_LOGIC;
                signal monitor_ready :  STD_LOGIC;
                signal oci_ram_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal oci_reg_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal ocireg_ers :  STD_LOGIC;
                signal ocireg_mrs :  STD_LOGIC;
                signal resetlatch :  STD_LOGIC;
                signal st_ready_test_idle :  STD_LOGIC;
                signal take_action_break_a :  STD_LOGIC;
                signal take_action_break_b :  STD_LOGIC;
                signal take_action_break_c :  STD_LOGIC;
                signal take_action_ocimem_a :  STD_LOGIC;
                signal take_action_ocimem_b :  STD_LOGIC;
                signal take_action_ocireg :  STD_LOGIC;
                signal take_action_tracectrl :  STD_LOGIC;
                signal take_action_tracemem_a :  STD_LOGIC;
                signal take_action_tracemem_b :  STD_LOGIC;
                signal take_no_action_break_a :  STD_LOGIC;
                signal take_no_action_break_b :  STD_LOGIC;
                signal take_no_action_break_c :  STD_LOGIC;
                signal take_no_action_ocimem_a :  STD_LOGIC;
                signal take_no_action_tracemem_a :  STD_LOGIC;
                signal tr_clk :  STD_LOGIC;
                signal tr_data :  STD_LOGIC_VECTOR (17 DOWNTO 0);
                signal tracemem_on :  STD_LOGIC;
                signal tracemem_trcdata :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal tracemem_tw :  STD_LOGIC;
                signal trc_ctrl :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal trc_enb :  STD_LOGIC;
                signal trc_im_addr :  STD_LOGIC_VECTOR (6 DOWNTO 0);
                signal trc_on :  STD_LOGIC;
                signal trc_wrap :  STD_LOGIC;
                signal trigbrktype :  STD_LOGIC;
                signal trigger_state_0 :  STD_LOGIC;
                signal trigger_state_1 :  STD_LOGIC;
                signal trigout :  STD_LOGIC;
                signal tw :  STD_LOGIC_VECTOR (35 DOWNTO 0);
                signal xbrk_break :  STD_LOGIC;
                signal xbrk_ctrl0 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal xbrk_ctrl1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal xbrk_ctrl2 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal xbrk_ctrl3 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal xbrk_goto0 :  STD_LOGIC;
                signal xbrk_goto1 :  STD_LOGIC;
                signal xbrk_traceoff :  STD_LOGIC;
                signal xbrk_traceon :  STD_LOGIC;
                signal xbrk_trigout :  STD_LOGIC;
                signal xbrk_wrap_traceoff :  STD_LOGIC;

begin

  --the_cpu_0_nios2_oci_debug, which is an e_instance
  the_cpu_0_nios2_oci_debug : cpu_0_nios2_oci_debug
    port map(
      debugack => debugack,
      monitor_error => monitor_error,
      monitor_go => monitor_go,
      monitor_ready => monitor_ready,
      oci_hbreak_req => internal_oci_hbreak_req,
      resetlatch => resetlatch,
      resetrequest => internal_resetrequest,
      clk => clk,
      dbrk_break => dbrk_break,
      debugreq => debugreq,
      hbreak_enabled => hbreak_enabled,
      jdo => jdo,
      jrst_n => jrst_n,
      ocireg_ers => ocireg_ers,
      ocireg_mrs => ocireg_mrs,
      reset => reset,
      st_ready_test_idle => st_ready_test_idle,
      take_action_ocimem_a => take_action_ocimem_a,
      take_action_ocireg => take_action_ocireg,
      xbrk_break => xbrk_break
    );


  --the_cpu_0_nios2_ocimem, which is an e_instance
  the_cpu_0_nios2_ocimem : cpu_0_nios2_ocimem
    port map(
      MonDReg => MonDReg,
      oci_ram_readdata => oci_ram_readdata,
      address => address,
      begintransfer => begintransfer,
      byteenable => byteenable,
      chipselect => chipselect,
      clk => clk,
      debugaccess => debugaccess,
      jdo => jdo,
      jrst_n => jrst_n,
      resetrequest => internal_resetrequest,
      take_action_ocimem_a => take_action_ocimem_a,
      take_action_ocimem_b => take_action_ocimem_b,
      take_no_action_ocimem_a => take_no_action_ocimem_a,
      write => write,
      writedata => writedata
    );


  --the_cpu_0_nios2_avalon_reg, which is an e_instance
  the_cpu_0_nios2_avalon_reg : cpu_0_nios2_avalon_reg
    port map(
      oci_ienable => internal_oci_ienable,
      oci_reg_readdata => oci_reg_readdata,
      oci_single_step_mode => internal_oci_single_step_mode,
      ocireg_ers => ocireg_ers,
      ocireg_mrs => ocireg_mrs,
      take_action_ocireg => take_action_ocireg,
      address => address,
      chipselect => chipselect,
      clk => clk,
      debugaccess => debugaccess,
      monitor_error => monitor_error,
      monitor_go => monitor_go,
      monitor_ready => monitor_ready,
      reset_n => reset_n,
      write => write,
      writedata => writedata
    );


  --the_cpu_0_nios2_oci_break, which is an e_instance
  the_cpu_0_nios2_oci_break : cpu_0_nios2_oci_break
    port map(
      break_readreg => break_readreg,
      dbrk_hit0_latch => dbrk_hit0_latch,
      dbrk_hit1_latch => dbrk_hit1_latch,
      dbrk_hit2_latch => dbrk_hit2_latch,
      dbrk_hit3_latch => dbrk_hit3_latch,
      trigbrktype => trigbrktype,
      trigger_state_0 => trigger_state_0,
      trigger_state_1 => trigger_state_1,
      xbrk_ctrl0 => xbrk_ctrl0,
      xbrk_ctrl1 => xbrk_ctrl1,
      xbrk_ctrl2 => xbrk_ctrl2,
      xbrk_ctrl3 => xbrk_ctrl3,
      clk => clk,
      dbrk_break => dbrk_break,
      dbrk_goto0 => dbrk_goto0,
      dbrk_goto1 => dbrk_goto1,
      jdo => jdo,
      jrst_n => jrst_n,
      reset_n => reset_n,
      take_action_break_a => take_action_break_a,
      take_action_break_b => take_action_break_b,
      take_action_break_c => take_action_break_c,
      take_no_action_break_a => take_no_action_break_a,
      take_no_action_break_b => take_no_action_break_b,
      take_no_action_break_c => take_no_action_break_c,
      xbrk_goto0 => xbrk_goto0,
      xbrk_goto1 => xbrk_goto1
    );


  --the_cpu_0_nios2_oci_xbrk, which is an e_instance
  the_cpu_0_nios2_oci_xbrk : cpu_0_nios2_oci_xbrk
    port map(
      xbrk_break => xbrk_break,
      xbrk_goto0 => xbrk_goto0,
      xbrk_goto1 => xbrk_goto1,
      xbrk_traceoff => xbrk_traceoff,
      xbrk_traceon => xbrk_traceon,
      xbrk_trigout => xbrk_trigout,
      D_valid => D_valid,
      E_valid => E_valid,
      F_pc => F_pc,
      clk => clk,
      reset_n => reset_n,
      trigger_state_0 => trigger_state_0,
      trigger_state_1 => trigger_state_1,
      xbrk_ctrl0 => xbrk_ctrl0,
      xbrk_ctrl1 => xbrk_ctrl1,
      xbrk_ctrl2 => xbrk_ctrl2,
      xbrk_ctrl3 => xbrk_ctrl3
    );


  --the_cpu_0_nios2_oci_dbrk, which is an e_instance
  the_cpu_0_nios2_oci_dbrk : cpu_0_nios2_oci_dbrk
    port map(
      cpu_d_address => cpu_d_address,
      cpu_d_read => cpu_d_read,
      cpu_d_readdata => cpu_d_readdata,
      cpu_d_wait => cpu_d_wait,
      cpu_d_write => cpu_d_write,
      cpu_d_writedata => cpu_d_writedata,
      dbrk_break => dbrk_break,
      dbrk_goto0 => dbrk_goto0,
      dbrk_goto1 => dbrk_goto1,
      dbrk_traceme => dbrk_traceme,
      dbrk_traceoff => dbrk_traceoff,
      dbrk_traceon => dbrk_traceon,
      dbrk_trigout => dbrk_trigout,
      E_st_data => E_st_data,
      av_ld_data_aligned_filtered => av_ld_data_aligned_filtered,
      clk => clk,
      d_address => d_address,
      d_read => d_read,
      d_waitrequest => d_waitrequest,
      d_write => d_write,
      debugack => debugack,
      reset_n => reset_n
    );


  --the_cpu_0_nios2_oci_itrace, which is an e_instance
  the_cpu_0_nios2_oci_itrace : cpu_0_nios2_oci_itrace
    port map(
      dct_buffer => dct_buffer,
      dct_count => dct_count,
      itm => itm,
      trc_ctrl => trc_ctrl,
      trc_on => trc_on,
      clk => clk,
      dbrk_traceoff => dbrk_traceoff,
      dbrk_traceon => dbrk_traceon,
      jdo => jdo (15 DOWNTO 0),
      jrst_n => jrst_n,
      take_action_tracectrl => take_action_tracectrl,
      trc_enb => trc_enb,
      xbrk_traceoff => xbrk_traceoff,
      xbrk_traceon => xbrk_traceon,
      xbrk_wrap_traceoff => xbrk_wrap_traceoff
    );


  --the_cpu_0_nios2_oci_dtrace, which is an e_instance
  the_cpu_0_nios2_oci_dtrace : cpu_0_nios2_oci_dtrace
    port map(
      atm => atm,
      dtm => dtm,
      clk => clk,
      cpu_d_address => cpu_d_address,
      cpu_d_read => cpu_d_read,
      cpu_d_readdata => cpu_d_readdata,
      cpu_d_wait => cpu_d_wait,
      cpu_d_write => cpu_d_write,
      cpu_d_writedata => cpu_d_writedata,
      jrst_n => jrst_n,
      trc_ctrl => trc_ctrl
    );


  --the_cpu_0_nios2_oci_fifo, which is an e_instance
  the_cpu_0_nios2_oci_fifo : cpu_0_nios2_oci_fifo
    port map(
      tw => tw,
      atm => atm,
      clk => clk,
      dbrk_traceme => dbrk_traceme,
      dbrk_traceoff => dbrk_traceoff,
      dbrk_traceon => dbrk_traceon,
      dct_buffer => dct_buffer,
      dct_count => dct_count,
      dtm => dtm,
      itm => itm,
      jrst_n => jrst_n,
      reset_n => reset_n,
      test_ending => test_ending,
      test_has_ended => test_has_ended,
      trc_on => trc_on
    );


  --the_cpu_0_nios2_oci_pib, which is an e_instance
  the_cpu_0_nios2_oci_pib : cpu_0_nios2_oci_pib
    port map(
      tr_clk => tr_clk,
      tr_data => tr_data,
      clk => clk,
      clkx2 => clkx2,
      jrst_n => jrst_n,
      tw => tw
    );


  --the_cpu_0_nios2_oci_im, which is an e_instance
  the_cpu_0_nios2_oci_im : cpu_0_nios2_oci_im
    port map(
      tracemem_on => tracemem_on,
      tracemem_trcdata => tracemem_trcdata,
      tracemem_tw => tracemem_tw,
      trc_enb => trc_enb,
      trc_im_addr => trc_im_addr,
      trc_wrap => trc_wrap,
      xbrk_wrap_traceoff => xbrk_wrap_traceoff,
      clk => clk,
      jdo => jdo,
      jrst_n => jrst_n,
      reset_n => reset_n,
      take_action_tracectrl => take_action_tracectrl,
      take_action_tracemem_a => take_action_tracemem_a,
      take_action_tracemem_b => take_action_tracemem_b,
      take_no_action_tracemem_a => take_no_action_tracemem_a,
      trc_ctrl => trc_ctrl,
      tw => tw
    );


  trigout <= dbrk_trigout OR xbrk_trigout;
  readdata <= A_WE_StdLogicVector((std_logic'(address(8)) = '1'), oci_reg_readdata, oci_ram_readdata);
  jtag_debug_module_debugaccess_to_roms <= debugack;
  --the_cpu_0_jtag_debug_module_wrapper, which is an e_instance
  the_cpu_0_jtag_debug_module_wrapper : cpu_0_jtag_debug_module_wrapper
    port map(
      jdo => jdo,
      jrst_n => jrst_n,
      st_ready_test_idle => st_ready_test_idle,
      take_action_break_a => take_action_break_a,
      take_action_break_b => take_action_break_b,
      take_action_break_c => take_action_break_c,
      take_action_ocimem_a => take_action_ocimem_a,
      take_action_ocimem_b => take_action_ocimem_b,
      take_action_tracectrl => take_action_tracectrl,
      take_action_tracemem_a => take_action_tracemem_a,
      take_action_tracemem_b => take_action_tracemem_b,
      take_no_action_break_a => take_no_action_break_a,
      take_no_action_break_b => take_no_action_break_b,
      take_no_action_break_c => take_no_action_break_c,
      take_no_action_ocimem_a => take_no_action_ocimem_a,
      take_no_action_tracemem_a => take_no_action_tracemem_a,
      MonDReg => MonDReg,
      break_readreg => break_readreg,
      clk => clk,
      dbrk_hit0_latch => dbrk_hit0_latch,
      dbrk_hit1_latch => dbrk_hit1_latch,
      dbrk_hit2_latch => dbrk_hit2_latch,
      dbrk_hit3_latch => dbrk_hit3_latch,
      debugack => debugack,
      monitor_error => monitor_error,
      monitor_ready => monitor_ready,
      reset_n => reset_n,
      resetlatch => resetlatch,
      tracemem_on => tracemem_on,
      tracemem_trcdata => tracemem_trcdata,
      tracemem_tw => tracemem_tw,
      trc_im_addr => trc_im_addr,
      trc_on => trc_on,
      trc_wrap => trc_wrap,
      trigbrktype => trigbrktype,
      trigger_state_1 => trigger_state_1
    );


  --dummy sink, which is an e_mux
  dummy_sink <= Vector_To_Std_Logic(((((std_logic_vector'("00000000000000000") & (A_TOSTDLOGICVECTOR(tr_clk))) OR tr_data) OR (std_logic_vector'("00000000000000000") & (A_TOSTDLOGICVECTOR(trigout)))) OR (std_logic_vector'("00000000000000000") & (A_TOSTDLOGICVECTOR(debugack)))));
  debugreq <= std_logic'('0');
  clkx2 <= std_logic'('0');
  --vhdl renameroo for output signals
  oci_hbreak_req <= internal_oci_hbreak_req;
  --vhdl renameroo for output signals
  oci_ienable <= internal_oci_ienable;
  --vhdl renameroo for output signals
  oci_single_step_mode <= internal_oci_single_step_mode;
  --vhdl renameroo for output signals
  resetrequest <= internal_resetrequest;

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0 is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal d_irq : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal d_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal d_waitrequest : IN STD_LOGIC;
                 signal i_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal i_waitrequest : IN STD_LOGIC;
                 signal jtag_debug_module_address : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                 signal jtag_debug_module_begintransfer : IN STD_LOGIC;
                 signal jtag_debug_module_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal jtag_debug_module_debugaccess : IN STD_LOGIC;
                 signal jtag_debug_module_select : IN STD_LOGIC;
                 signal jtag_debug_module_write : IN STD_LOGIC;
                 signal jtag_debug_module_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal d_address : OUT STD_LOGIC_VECTOR (26 DOWNTO 0);
                 signal d_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal d_read : OUT STD_LOGIC;
                 signal d_write : OUT STD_LOGIC;
                 signal d_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal i_address : OUT STD_LOGIC_VECTOR (26 DOWNTO 0);
                 signal i_read : OUT STD_LOGIC;
                 signal jtag_debug_module_debugaccess_to_roms : OUT STD_LOGIC;
                 signal jtag_debug_module_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal jtag_debug_module_resetrequest : OUT STD_LOGIC
              );
end entity cpu_0;


architecture europa of cpu_0 is
component cpu_0_test_bench is 
           port (
                 -- inputs:
                    signal D_iw : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal D_iw_op : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
                    signal D_iw_opx : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
                    signal D_valid : IN STD_LOGIC;
                    signal E_alu_result : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal E_mem_byte_en : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal E_st_data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal E_valid : IN STD_LOGIC;
                    signal F_pcb : IN STD_LOGIC_VECTOR (26 DOWNTO 0);
                    signal F_valid : IN STD_LOGIC;
                    signal R_ctrl_exception : IN STD_LOGIC;
                    signal R_ctrl_ld : IN STD_LOGIC;
                    signal R_ctrl_ld_non_io : IN STD_LOGIC;
                    signal R_dst_regnum : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                    signal R_wr_dst_reg : IN STD_LOGIC;
                    signal W_bstatus_reg : IN STD_LOGIC;
                    signal W_cmp_result : IN STD_LOGIC;
                    signal W_estatus_reg : IN STD_LOGIC;
                    signal W_ienable_reg : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal W_ipending_reg : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal W_mem_baddr : IN STD_LOGIC_VECTOR (26 DOWNTO 0);
                    signal W_rf_wr_data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal W_status_reg : IN STD_LOGIC;
                    signal W_valid : IN STD_LOGIC;
                    signal W_vinst : IN STD_LOGIC_VECTOR (55 DOWNTO 0);
                    signal W_wr_data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal av_ld_data_aligned_unfiltered : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal d_address : IN STD_LOGIC_VECTOR (26 DOWNTO 0);
                    signal d_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal d_read : IN STD_LOGIC;
                    signal d_write_nxt : IN STD_LOGIC;
                    signal i_address : IN STD_LOGIC_VECTOR (26 DOWNTO 0);
                    signal i_read : IN STD_LOGIC;
                    signal i_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal i_waitrequest : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal av_ld_data_aligned_filtered : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d_write : OUT STD_LOGIC;
                    signal test_has_ended : OUT STD_LOGIC
                 );
end component cpu_0_test_bench;

component cpu_0_register_bank_a_module is 
           generic (
                    lpm_file : STRING := "UNUSED"
                    );
           port (
                 -- inputs:
                    signal clock : IN STD_LOGIC;
                    signal data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal rdaddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                    signal wraddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                    signal wren : IN STD_LOGIC;

                 -- outputs:
                    signal q : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component cpu_0_register_bank_a_module;

component cpu_0_register_bank_b_module is 
           generic (
                    lpm_file : STRING := "UNUSED"
                    );
           port (
                 -- inputs:
                    signal clock : IN STD_LOGIC;
                    signal data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal rdaddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                    signal wraddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                    signal wren : IN STD_LOGIC;

                 -- outputs:
                    signal q : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component cpu_0_register_bank_b_module;

component cpu_0_nios2_oci is 
           port (
                 -- inputs:
                    signal D_valid : IN STD_LOGIC;
                    signal E_st_data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal E_valid : IN STD_LOGIC;
                    signal F_pc : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
                    signal address : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                    signal av_ld_data_aligned_filtered : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal begintransfer : IN STD_LOGIC;
                    signal byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal d_address : IN STD_LOGIC_VECTOR (26 DOWNTO 0);
                    signal d_read : IN STD_LOGIC;
                    signal d_waitrequest : IN STD_LOGIC;
                    signal d_write : IN STD_LOGIC;
                    signal debugaccess : IN STD_LOGIC;
                    signal hbreak_enabled : IN STD_LOGIC;
                    signal reset : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal test_ending : IN STD_LOGIC;
                    signal test_has_ended : IN STD_LOGIC;
                    signal write : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal jtag_debug_module_debugaccess_to_roms : OUT STD_LOGIC;
                    signal oci_hbreak_req : OUT STD_LOGIC;
                    signal oci_ienable : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal oci_single_step_mode : OUT STD_LOGIC;
                    signal readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal resetrequest : OUT STD_LOGIC
                 );
end component cpu_0_nios2_oci;

                signal D_compare_op :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal D_ctrl_alu_force_xor :  STD_LOGIC;
                signal D_ctrl_alu_signed_comparison :  STD_LOGIC;
                signal D_ctrl_alu_subtract :  STD_LOGIC;
                signal D_ctrl_b_is_dst :  STD_LOGIC;
                signal D_ctrl_br :  STD_LOGIC;
                signal D_ctrl_br_cmp :  STD_LOGIC;
                signal D_ctrl_br_uncond :  STD_LOGIC;
                signal D_ctrl_break :  STD_LOGIC;
                signal D_ctrl_crst :  STD_LOGIC;
                signal D_ctrl_custom :  STD_LOGIC;
                signal D_ctrl_custom_multi :  STD_LOGIC;
                signal D_ctrl_exception :  STD_LOGIC;
                signal D_ctrl_force_src2_zero :  STD_LOGIC;
                signal D_ctrl_hi_imm16 :  STD_LOGIC;
                signal D_ctrl_ignore_dst :  STD_LOGIC;
                signal D_ctrl_implicit_dst_eretaddr :  STD_LOGIC;
                signal D_ctrl_implicit_dst_retaddr :  STD_LOGIC;
                signal D_ctrl_jmp_direct :  STD_LOGIC;
                signal D_ctrl_jmp_indirect :  STD_LOGIC;
                signal D_ctrl_ld :  STD_LOGIC;
                signal D_ctrl_ld_io :  STD_LOGIC;
                signal D_ctrl_ld_non_io :  STD_LOGIC;
                signal D_ctrl_ld_signed :  STD_LOGIC;
                signal D_ctrl_logic :  STD_LOGIC;
                signal D_ctrl_rdctl_inst :  STD_LOGIC;
                signal D_ctrl_retaddr :  STD_LOGIC;
                signal D_ctrl_rot_right :  STD_LOGIC;
                signal D_ctrl_shift_logical :  STD_LOGIC;
                signal D_ctrl_shift_right_arith :  STD_LOGIC;
                signal D_ctrl_shift_rot :  STD_LOGIC;
                signal D_ctrl_shift_rot_right :  STD_LOGIC;
                signal D_ctrl_src2_choose_imm :  STD_LOGIC;
                signal D_ctrl_st :  STD_LOGIC;
                signal D_ctrl_uncond_cti_non_br :  STD_LOGIC;
                signal D_ctrl_unsigned_lo_imm16 :  STD_LOGIC;
                signal D_ctrl_wrctl_inst :  STD_LOGIC;
                signal D_dst_regnum :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal D_inst :  STD_LOGIC_VECTOR (55 DOWNTO 0);
                signal D_iw :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal D_iw_a :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal D_iw_b :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal D_iw_c :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal D_iw_control_regnum :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal D_iw_custom_n :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal D_iw_custom_readra :  STD_LOGIC;
                signal D_iw_custom_readrb :  STD_LOGIC;
                signal D_iw_custom_writerc :  STD_LOGIC;
                signal D_iw_imm16 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal D_iw_imm26 :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal D_iw_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal D_iw_memsz :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal D_iw_op :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal D_iw_opx :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal D_iw_shift_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal D_iw_trap_break_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal D_jmp_direct_target_waddr :  STD_LOGIC_VECTOR (24 DOWNTO 0);
                signal D_logic_op :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal D_logic_op_raw :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal D_mem16 :  STD_LOGIC;
                signal D_mem32 :  STD_LOGIC;
                signal D_mem8 :  STD_LOGIC;
                signal D_op_add :  STD_LOGIC;
                signal D_op_addi :  STD_LOGIC;
                signal D_op_and :  STD_LOGIC;
                signal D_op_andhi :  STD_LOGIC;
                signal D_op_andi :  STD_LOGIC;
                signal D_op_beq :  STD_LOGIC;
                signal D_op_bge :  STD_LOGIC;
                signal D_op_bgeu :  STD_LOGIC;
                signal D_op_blt :  STD_LOGIC;
                signal D_op_bltu :  STD_LOGIC;
                signal D_op_bne :  STD_LOGIC;
                signal D_op_br :  STD_LOGIC;
                signal D_op_break :  STD_LOGIC;
                signal D_op_bret :  STD_LOGIC;
                signal D_op_call :  STD_LOGIC;
                signal D_op_callr :  STD_LOGIC;
                signal D_op_cmpeq :  STD_LOGIC;
                signal D_op_cmpeqi :  STD_LOGIC;
                signal D_op_cmpge :  STD_LOGIC;
                signal D_op_cmpgei :  STD_LOGIC;
                signal D_op_cmpgeu :  STD_LOGIC;
                signal D_op_cmpgeui :  STD_LOGIC;
                signal D_op_cmplt :  STD_LOGIC;
                signal D_op_cmplti :  STD_LOGIC;
                signal D_op_cmpltu :  STD_LOGIC;
                signal D_op_cmpltui :  STD_LOGIC;
                signal D_op_cmpne :  STD_LOGIC;
                signal D_op_cmpnei :  STD_LOGIC;
                signal D_op_crst :  STD_LOGIC;
                signal D_op_custom :  STD_LOGIC;
                signal D_op_div :  STD_LOGIC;
                signal D_op_divu :  STD_LOGIC;
                signal D_op_eret :  STD_LOGIC;
                signal D_op_flushd :  STD_LOGIC;
                signal D_op_flushda :  STD_LOGIC;
                signal D_op_flushi :  STD_LOGIC;
                signal D_op_flushp :  STD_LOGIC;
                signal D_op_hbreak :  STD_LOGIC;
                signal D_op_initd :  STD_LOGIC;
                signal D_op_initda :  STD_LOGIC;
                signal D_op_initi :  STD_LOGIC;
                signal D_op_intr :  STD_LOGIC;
                signal D_op_jmp :  STD_LOGIC;
                signal D_op_jmpi :  STD_LOGIC;
                signal D_op_ldb :  STD_LOGIC;
                signal D_op_ldbio :  STD_LOGIC;
                signal D_op_ldbu :  STD_LOGIC;
                signal D_op_ldbuio :  STD_LOGIC;
                signal D_op_ldh :  STD_LOGIC;
                signal D_op_ldhio :  STD_LOGIC;
                signal D_op_ldhu :  STD_LOGIC;
                signal D_op_ldhuio :  STD_LOGIC;
                signal D_op_ldl :  STD_LOGIC;
                signal D_op_ldw :  STD_LOGIC;
                signal D_op_ldwio :  STD_LOGIC;
                signal D_op_mul :  STD_LOGIC;
                signal D_op_muli :  STD_LOGIC;
                signal D_op_mulxss :  STD_LOGIC;
                signal D_op_mulxsu :  STD_LOGIC;
                signal D_op_mulxuu :  STD_LOGIC;
                signal D_op_nextpc :  STD_LOGIC;
                signal D_op_nor :  STD_LOGIC;
                signal D_op_opx :  STD_LOGIC;
                signal D_op_or :  STD_LOGIC;
                signal D_op_orhi :  STD_LOGIC;
                signal D_op_ori :  STD_LOGIC;
                signal D_op_rdctl :  STD_LOGIC;
                signal D_op_rdprs :  STD_LOGIC;
                signal D_op_ret :  STD_LOGIC;
                signal D_op_rol :  STD_LOGIC;
                signal D_op_roli :  STD_LOGIC;
                signal D_op_ror :  STD_LOGIC;
                signal D_op_rsv02 :  STD_LOGIC;
                signal D_op_rsv09 :  STD_LOGIC;
                signal D_op_rsv10 :  STD_LOGIC;
                signal D_op_rsv17 :  STD_LOGIC;
                signal D_op_rsv18 :  STD_LOGIC;
                signal D_op_rsv25 :  STD_LOGIC;
                signal D_op_rsv26 :  STD_LOGIC;
                signal D_op_rsv33 :  STD_LOGIC;
                signal D_op_rsv34 :  STD_LOGIC;
                signal D_op_rsv41 :  STD_LOGIC;
                signal D_op_rsv42 :  STD_LOGIC;
                signal D_op_rsv49 :  STD_LOGIC;
                signal D_op_rsv57 :  STD_LOGIC;
                signal D_op_rsv61 :  STD_LOGIC;
                signal D_op_rsv62 :  STD_LOGIC;
                signal D_op_rsv63 :  STD_LOGIC;
                signal D_op_rsvx00 :  STD_LOGIC;
                signal D_op_rsvx10 :  STD_LOGIC;
                signal D_op_rsvx15 :  STD_LOGIC;
                signal D_op_rsvx17 :  STD_LOGIC;
                signal D_op_rsvx21 :  STD_LOGIC;
                signal D_op_rsvx25 :  STD_LOGIC;
                signal D_op_rsvx33 :  STD_LOGIC;
                signal D_op_rsvx34 :  STD_LOGIC;
                signal D_op_rsvx35 :  STD_LOGIC;
                signal D_op_rsvx42 :  STD_LOGIC;
                signal D_op_rsvx43 :  STD_LOGIC;
                signal D_op_rsvx44 :  STD_LOGIC;
                signal D_op_rsvx47 :  STD_LOGIC;
                signal D_op_rsvx50 :  STD_LOGIC;
                signal D_op_rsvx51 :  STD_LOGIC;
                signal D_op_rsvx55 :  STD_LOGIC;
                signal D_op_rsvx56 :  STD_LOGIC;
                signal D_op_rsvx60 :  STD_LOGIC;
                signal D_op_rsvx63 :  STD_LOGIC;
                signal D_op_sll :  STD_LOGIC;
                signal D_op_slli :  STD_LOGIC;
                signal D_op_sra :  STD_LOGIC;
                signal D_op_srai :  STD_LOGIC;
                signal D_op_srl :  STD_LOGIC;
                signal D_op_srli :  STD_LOGIC;
                signal D_op_stb :  STD_LOGIC;
                signal D_op_stbio :  STD_LOGIC;
                signal D_op_stc :  STD_LOGIC;
                signal D_op_sth :  STD_LOGIC;
                signal D_op_sthio :  STD_LOGIC;
                signal D_op_stw :  STD_LOGIC;
                signal D_op_stwio :  STD_LOGIC;
                signal D_op_sub :  STD_LOGIC;
                signal D_op_sync :  STD_LOGIC;
                signal D_op_trap :  STD_LOGIC;
                signal D_op_wrctl :  STD_LOGIC;
                signal D_op_wrprs :  STD_LOGIC;
                signal D_op_xor :  STD_LOGIC;
                signal D_op_xorhi :  STD_LOGIC;
                signal D_op_xori :  STD_LOGIC;
                signal D_valid :  STD_LOGIC;
                signal D_vinst :  STD_LOGIC_VECTOR (55 DOWNTO 0);
                signal D_wr_dst_reg :  STD_LOGIC;
                signal E_alu_result :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_alu_sub :  STD_LOGIC;
                signal E_arith_result :  STD_LOGIC_VECTOR (32 DOWNTO 0);
                signal E_arith_src1 :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_arith_src2 :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_ci_multi_stall :  STD_LOGIC;
                signal E_ci_result :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_cmp_result :  STD_LOGIC;
                signal E_control_rd_data :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_eq :  STD_LOGIC;
                signal E_invert_arith_src_msb :  STD_LOGIC;
                signal E_ld_stall :  STD_LOGIC;
                signal E_logic_result :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_logic_result_is_0 :  STD_LOGIC;
                signal E_lt :  STD_LOGIC;
                signal E_mem_baddr :  STD_LOGIC_VECTOR (26 DOWNTO 0);
                signal E_mem_byte_en :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal E_new_inst :  STD_LOGIC;
                signal E_shift_rot_cnt :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal E_shift_rot_cnt_nxt :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal E_shift_rot_done :  STD_LOGIC;
                signal E_shift_rot_fill_bit :  STD_LOGIC;
                signal E_shift_rot_result :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_shift_rot_result_nxt :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_shift_rot_stall :  STD_LOGIC;
                signal E_src1 :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_src2 :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_st_data :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_st_stall :  STD_LOGIC;
                signal E_stall :  STD_LOGIC;
                signal E_valid :  STD_LOGIC;
                signal E_vinst :  STD_LOGIC_VECTOR (55 DOWNTO 0);
                signal E_wrctl_bstatus :  STD_LOGIC;
                signal E_wrctl_estatus :  STD_LOGIC;
                signal E_wrctl_ienable :  STD_LOGIC;
                signal E_wrctl_status :  STD_LOGIC;
                signal F_av_iw :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal F_av_iw_a :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_av_iw_b :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_av_iw_c :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_av_iw_control_regnum :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal F_av_iw_custom_n :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal F_av_iw_custom_readra :  STD_LOGIC;
                signal F_av_iw_custom_readrb :  STD_LOGIC;
                signal F_av_iw_custom_writerc :  STD_LOGIC;
                signal F_av_iw_imm16 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal F_av_iw_imm26 :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal F_av_iw_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_av_iw_memsz :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal F_av_iw_op :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal F_av_iw_opx :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal F_av_iw_shift_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_av_iw_trap_break_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_av_mem16 :  STD_LOGIC;
                signal F_av_mem32 :  STD_LOGIC;
                signal F_av_mem8 :  STD_LOGIC;
                signal F_inst :  STD_LOGIC_VECTOR (55 DOWNTO 0);
                signal F_iw :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal F_iw_a :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_iw_b :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_iw_c :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_iw_control_regnum :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal F_iw_custom_n :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal F_iw_custom_readra :  STD_LOGIC;
                signal F_iw_custom_readrb :  STD_LOGIC;
                signal F_iw_custom_writerc :  STD_LOGIC;
                signal F_iw_imm16 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal F_iw_imm26 :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal F_iw_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_iw_memsz :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal F_iw_op :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal F_iw_opx :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal F_iw_shift_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_iw_trap_break_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_mem16 :  STD_LOGIC;
                signal F_mem32 :  STD_LOGIC;
                signal F_mem8 :  STD_LOGIC;
                signal F_op_add :  STD_LOGIC;
                signal F_op_addi :  STD_LOGIC;
                signal F_op_and :  STD_LOGIC;
                signal F_op_andhi :  STD_LOGIC;
                signal F_op_andi :  STD_LOGIC;
                signal F_op_beq :  STD_LOGIC;
                signal F_op_bge :  STD_LOGIC;
                signal F_op_bgeu :  STD_LOGIC;
                signal F_op_blt :  STD_LOGIC;
                signal F_op_bltu :  STD_LOGIC;
                signal F_op_bne :  STD_LOGIC;
                signal F_op_br :  STD_LOGIC;
                signal F_op_break :  STD_LOGIC;
                signal F_op_bret :  STD_LOGIC;
                signal F_op_call :  STD_LOGIC;
                signal F_op_callr :  STD_LOGIC;
                signal F_op_cmpeq :  STD_LOGIC;
                signal F_op_cmpeqi :  STD_LOGIC;
                signal F_op_cmpge :  STD_LOGIC;
                signal F_op_cmpgei :  STD_LOGIC;
                signal F_op_cmpgeu :  STD_LOGIC;
                signal F_op_cmpgeui :  STD_LOGIC;
                signal F_op_cmplt :  STD_LOGIC;
                signal F_op_cmplti :  STD_LOGIC;
                signal F_op_cmpltu :  STD_LOGIC;
                signal F_op_cmpltui :  STD_LOGIC;
                signal F_op_cmpne :  STD_LOGIC;
                signal F_op_cmpnei :  STD_LOGIC;
                signal F_op_crst :  STD_LOGIC;
                signal F_op_custom :  STD_LOGIC;
                signal F_op_div :  STD_LOGIC;
                signal F_op_divu :  STD_LOGIC;
                signal F_op_eret :  STD_LOGIC;
                signal F_op_flushd :  STD_LOGIC;
                signal F_op_flushda :  STD_LOGIC;
                signal F_op_flushi :  STD_LOGIC;
                signal F_op_flushp :  STD_LOGIC;
                signal F_op_hbreak :  STD_LOGIC;
                signal F_op_initd :  STD_LOGIC;
                signal F_op_initda :  STD_LOGIC;
                signal F_op_initi :  STD_LOGIC;
                signal F_op_intr :  STD_LOGIC;
                signal F_op_jmp :  STD_LOGIC;
                signal F_op_jmpi :  STD_LOGIC;
                signal F_op_ldb :  STD_LOGIC;
                signal F_op_ldbio :  STD_LOGIC;
                signal F_op_ldbu :  STD_LOGIC;
                signal F_op_ldbuio :  STD_LOGIC;
                signal F_op_ldh :  STD_LOGIC;
                signal F_op_ldhio :  STD_LOGIC;
                signal F_op_ldhu :  STD_LOGIC;
                signal F_op_ldhuio :  STD_LOGIC;
                signal F_op_ldl :  STD_LOGIC;
                signal F_op_ldw :  STD_LOGIC;
                signal F_op_ldwio :  STD_LOGIC;
                signal F_op_mul :  STD_LOGIC;
                signal F_op_muli :  STD_LOGIC;
                signal F_op_mulxss :  STD_LOGIC;
                signal F_op_mulxsu :  STD_LOGIC;
                signal F_op_mulxuu :  STD_LOGIC;
                signal F_op_nextpc :  STD_LOGIC;
                signal F_op_nor :  STD_LOGIC;
                signal F_op_opx :  STD_LOGIC;
                signal F_op_or :  STD_LOGIC;
                signal F_op_orhi :  STD_LOGIC;
                signal F_op_ori :  STD_LOGIC;
                signal F_op_rdctl :  STD_LOGIC;
                signal F_op_rdprs :  STD_LOGIC;
                signal F_op_ret :  STD_LOGIC;
                signal F_op_rol :  STD_LOGIC;
                signal F_op_roli :  STD_LOGIC;
                signal F_op_ror :  STD_LOGIC;
                signal F_op_rsv02 :  STD_LOGIC;
                signal F_op_rsv09 :  STD_LOGIC;
                signal F_op_rsv10 :  STD_LOGIC;
                signal F_op_rsv17 :  STD_LOGIC;
                signal F_op_rsv18 :  STD_LOGIC;
                signal F_op_rsv25 :  STD_LOGIC;
                signal F_op_rsv26 :  STD_LOGIC;
                signal F_op_rsv33 :  STD_LOGIC;
                signal F_op_rsv34 :  STD_LOGIC;
                signal F_op_rsv41 :  STD_LOGIC;
                signal F_op_rsv42 :  STD_LOGIC;
                signal F_op_rsv49 :  STD_LOGIC;
                signal F_op_rsv57 :  STD_LOGIC;
                signal F_op_rsv61 :  STD_LOGIC;
                signal F_op_rsv62 :  STD_LOGIC;
                signal F_op_rsv63 :  STD_LOGIC;
                signal F_op_rsvx00 :  STD_LOGIC;
                signal F_op_rsvx10 :  STD_LOGIC;
                signal F_op_rsvx15 :  STD_LOGIC;
                signal F_op_rsvx17 :  STD_LOGIC;
                signal F_op_rsvx21 :  STD_LOGIC;
                signal F_op_rsvx25 :  STD_LOGIC;
                signal F_op_rsvx33 :  STD_LOGIC;
                signal F_op_rsvx34 :  STD_LOGIC;
                signal F_op_rsvx35 :  STD_LOGIC;
                signal F_op_rsvx42 :  STD_LOGIC;
                signal F_op_rsvx43 :  STD_LOGIC;
                signal F_op_rsvx44 :  STD_LOGIC;
                signal F_op_rsvx47 :  STD_LOGIC;
                signal F_op_rsvx50 :  STD_LOGIC;
                signal F_op_rsvx51 :  STD_LOGIC;
                signal F_op_rsvx55 :  STD_LOGIC;
                signal F_op_rsvx56 :  STD_LOGIC;
                signal F_op_rsvx60 :  STD_LOGIC;
                signal F_op_rsvx63 :  STD_LOGIC;
                signal F_op_sll :  STD_LOGIC;
                signal F_op_slli :  STD_LOGIC;
                signal F_op_sra :  STD_LOGIC;
                signal F_op_srai :  STD_LOGIC;
                signal F_op_srl :  STD_LOGIC;
                signal F_op_srli :  STD_LOGIC;
                signal F_op_stb :  STD_LOGIC;
                signal F_op_stbio :  STD_LOGIC;
                signal F_op_stc :  STD_LOGIC;
                signal F_op_sth :  STD_LOGIC;
                signal F_op_sthio :  STD_LOGIC;
                signal F_op_stw :  STD_LOGIC;
                signal F_op_stwio :  STD_LOGIC;
                signal F_op_sub :  STD_LOGIC;
                signal F_op_sync :  STD_LOGIC;
                signal F_op_trap :  STD_LOGIC;
                signal F_op_wrctl :  STD_LOGIC;
                signal F_op_wrprs :  STD_LOGIC;
                signal F_op_xor :  STD_LOGIC;
                signal F_op_xorhi :  STD_LOGIC;
                signal F_op_xori :  STD_LOGIC;
                signal F_pc :  STD_LOGIC_VECTOR (24 DOWNTO 0);
                signal F_pc_en :  STD_LOGIC;
                signal F_pc_no_crst_nxt :  STD_LOGIC_VECTOR (24 DOWNTO 0);
                signal F_pc_nxt :  STD_LOGIC_VECTOR (24 DOWNTO 0);
                signal F_pc_plus_one :  STD_LOGIC_VECTOR (24 DOWNTO 0);
                signal F_pc_sel_nxt :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal F_pcb :  STD_LOGIC_VECTOR (26 DOWNTO 0);
                signal F_pcb_nxt :  STD_LOGIC_VECTOR (26 DOWNTO 0);
                signal F_pcb_plus_four :  STD_LOGIC_VECTOR (26 DOWNTO 0);
                signal F_valid :  STD_LOGIC;
                signal F_vinst :  STD_LOGIC_VECTOR (55 DOWNTO 0);
                signal R_compare_op :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal R_ctrl_alu_force_xor :  STD_LOGIC;
                signal R_ctrl_alu_force_xor_nxt :  STD_LOGIC;
                signal R_ctrl_alu_signed_comparison :  STD_LOGIC;
                signal R_ctrl_alu_signed_comparison_nxt :  STD_LOGIC;
                signal R_ctrl_alu_subtract :  STD_LOGIC;
                signal R_ctrl_alu_subtract_nxt :  STD_LOGIC;
                signal R_ctrl_b_is_dst :  STD_LOGIC;
                signal R_ctrl_b_is_dst_nxt :  STD_LOGIC;
                signal R_ctrl_br :  STD_LOGIC;
                signal R_ctrl_br_cmp :  STD_LOGIC;
                signal R_ctrl_br_cmp_nxt :  STD_LOGIC;
                signal R_ctrl_br_nxt :  STD_LOGIC;
                signal R_ctrl_br_uncond :  STD_LOGIC;
                signal R_ctrl_br_uncond_nxt :  STD_LOGIC;
                signal R_ctrl_break :  STD_LOGIC;
                signal R_ctrl_break_nxt :  STD_LOGIC;
                signal R_ctrl_crst :  STD_LOGIC;
                signal R_ctrl_crst_nxt :  STD_LOGIC;
                signal R_ctrl_custom :  STD_LOGIC;
                signal R_ctrl_custom_multi :  STD_LOGIC;
                signal R_ctrl_custom_multi_nxt :  STD_LOGIC;
                signal R_ctrl_custom_nxt :  STD_LOGIC;
                signal R_ctrl_exception :  STD_LOGIC;
                signal R_ctrl_exception_nxt :  STD_LOGIC;
                signal R_ctrl_force_src2_zero :  STD_LOGIC;
                signal R_ctrl_force_src2_zero_nxt :  STD_LOGIC;
                signal R_ctrl_hi_imm16 :  STD_LOGIC;
                signal R_ctrl_hi_imm16_nxt :  STD_LOGIC;
                signal R_ctrl_ignore_dst :  STD_LOGIC;
                signal R_ctrl_ignore_dst_nxt :  STD_LOGIC;
                signal R_ctrl_implicit_dst_eretaddr :  STD_LOGIC;
                signal R_ctrl_implicit_dst_eretaddr_nxt :  STD_LOGIC;
                signal R_ctrl_implicit_dst_retaddr :  STD_LOGIC;
                signal R_ctrl_implicit_dst_retaddr_nxt :  STD_LOGIC;
                signal R_ctrl_jmp_direct :  STD_LOGIC;
                signal R_ctrl_jmp_direct_nxt :  STD_LOGIC;
                signal R_ctrl_jmp_indirect :  STD_LOGIC;
                signal R_ctrl_jmp_indirect_nxt :  STD_LOGIC;
                signal R_ctrl_ld :  STD_LOGIC;
                signal R_ctrl_ld_io :  STD_LOGIC;
                signal R_ctrl_ld_io_nxt :  STD_LOGIC;
                signal R_ctrl_ld_non_io :  STD_LOGIC;
                signal R_ctrl_ld_non_io_nxt :  STD_LOGIC;
                signal R_ctrl_ld_nxt :  STD_LOGIC;
                signal R_ctrl_ld_signed :  STD_LOGIC;
                signal R_ctrl_ld_signed_nxt :  STD_LOGIC;
                signal R_ctrl_logic :  STD_LOGIC;
                signal R_ctrl_logic_nxt :  STD_LOGIC;
                signal R_ctrl_rdctl_inst :  STD_LOGIC;
                signal R_ctrl_rdctl_inst_nxt :  STD_LOGIC;
                signal R_ctrl_retaddr :  STD_LOGIC;
                signal R_ctrl_retaddr_nxt :  STD_LOGIC;
                signal R_ctrl_rot_right :  STD_LOGIC;
                signal R_ctrl_rot_right_nxt :  STD_LOGIC;
                signal R_ctrl_shift_logical :  STD_LOGIC;
                signal R_ctrl_shift_logical_nxt :  STD_LOGIC;
                signal R_ctrl_shift_right_arith :  STD_LOGIC;
                signal R_ctrl_shift_right_arith_nxt :  STD_LOGIC;
                signal R_ctrl_shift_rot :  STD_LOGIC;
                signal R_ctrl_shift_rot_nxt :  STD_LOGIC;
                signal R_ctrl_shift_rot_right :  STD_LOGIC;
                signal R_ctrl_shift_rot_right_nxt :  STD_LOGIC;
                signal R_ctrl_src2_choose_imm :  STD_LOGIC;
                signal R_ctrl_src2_choose_imm_nxt :  STD_LOGIC;
                signal R_ctrl_st :  STD_LOGIC;
                signal R_ctrl_st_nxt :  STD_LOGIC;
                signal R_ctrl_uncond_cti_non_br :  STD_LOGIC;
                signal R_ctrl_uncond_cti_non_br_nxt :  STD_LOGIC;
                signal R_ctrl_unsigned_lo_imm16 :  STD_LOGIC;
                signal R_ctrl_unsigned_lo_imm16_nxt :  STD_LOGIC;
                signal R_ctrl_wrctl_inst :  STD_LOGIC;
                signal R_ctrl_wrctl_inst_nxt :  STD_LOGIC;
                signal R_dst_regnum :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal R_en :  STD_LOGIC;
                signal R_logic_op :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal R_rf_a :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal R_rf_b :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal R_src1 :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal R_src2 :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal R_src2_hi :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal R_src2_lo :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal R_src2_use_imm :  STD_LOGIC;
                signal R_stb_data :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal R_sth_data :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal R_valid :  STD_LOGIC;
                signal R_vinst :  STD_LOGIC_VECTOR (55 DOWNTO 0);
                signal R_wr_dst_reg :  STD_LOGIC;
                signal W_alu_result :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal W_br_taken :  STD_LOGIC;
                signal W_bstatus_reg :  STD_LOGIC;
                signal W_bstatus_reg_inst_nxt :  STD_LOGIC;
                signal W_bstatus_reg_nxt :  STD_LOGIC;
                signal W_cmp_result :  STD_LOGIC;
                signal W_control_rd_data :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal W_estatus_reg :  STD_LOGIC;
                signal W_estatus_reg_inst_nxt :  STD_LOGIC;
                signal W_estatus_reg_nxt :  STD_LOGIC;
                signal W_ienable_reg :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal W_ienable_reg_nxt :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal W_ipending_reg :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal W_ipending_reg_nxt :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal W_mem_baddr :  STD_LOGIC_VECTOR (26 DOWNTO 0);
                signal W_rf_wr_data :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal W_rf_wren :  STD_LOGIC;
                signal W_status_reg :  STD_LOGIC;
                signal W_status_reg_pie :  STD_LOGIC;
                signal W_status_reg_pie_inst_nxt :  STD_LOGIC;
                signal W_status_reg_pie_nxt :  STD_LOGIC;
                signal W_valid :  STD_LOGIC;
                signal W_vinst :  STD_LOGIC_VECTOR (55 DOWNTO 0);
                signal W_wr_data :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal W_wr_data_non_zero :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal av_fill_bit :  STD_LOGIC;
                signal av_ld_align_cycle :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal av_ld_align_cycle_nxt :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal av_ld_align_one_more_cycle :  STD_LOGIC;
                signal av_ld_aligning_data :  STD_LOGIC;
                signal av_ld_aligning_data_nxt :  STD_LOGIC;
                signal av_ld_byte0_data :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal av_ld_byte0_data_nxt :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal av_ld_byte1_data :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal av_ld_byte1_data_en :  STD_LOGIC;
                signal av_ld_byte1_data_nxt :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal av_ld_byte2_data :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal av_ld_byte2_data_nxt :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal av_ld_byte3_data :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal av_ld_byte3_data_nxt :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal av_ld_data_aligned_filtered :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal av_ld_data_aligned_unfiltered :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal av_ld_done :  STD_LOGIC;
                signal av_ld_extend :  STD_LOGIC;
                signal av_ld_getting_data :  STD_LOGIC;
                signal av_ld_rshift8 :  STD_LOGIC;
                signal av_ld_waiting_for_data :  STD_LOGIC;
                signal av_ld_waiting_for_data_nxt :  STD_LOGIC;
                signal av_sign_bit :  STD_LOGIC;
                signal d_read_nxt :  STD_LOGIC;
                signal d_write_nxt :  STD_LOGIC;
                signal hbreak_enabled :  STD_LOGIC;
                signal hbreak_pending :  STD_LOGIC;
                signal hbreak_pending_nxt :  STD_LOGIC;
                signal hbreak_req :  STD_LOGIC;
                signal i_read_nxt :  STD_LOGIC;
                signal iactive :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal internal_d_address :  STD_LOGIC_VECTOR (26 DOWNTO 0);
                signal internal_d_byteenable :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal internal_d_read :  STD_LOGIC;
                signal internal_d_write :  STD_LOGIC;
                signal internal_i_address :  STD_LOGIC_VECTOR (26 DOWNTO 0);
                signal internal_i_read :  STD_LOGIC;
                signal internal_jtag_debug_module_debugaccess_to_roms :  STD_LOGIC;
                signal internal_jtag_debug_module_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal internal_jtag_debug_module_resetrequest :  STD_LOGIC;
                signal intr_req :  STD_LOGIC;
                signal jtag_debug_module_clk :  STD_LOGIC;
                signal jtag_debug_module_reset :  STD_LOGIC;
                signal oci_hbreak_req :  STD_LOGIC;
                signal oci_ienable :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal oci_single_step_mode :  STD_LOGIC;
                signal oci_tb_hbreak_req :  STD_LOGIC;
                signal test_ending :  STD_LOGIC;
                signal test_has_ended :  STD_LOGIC;
                signal wait_for_one_post_bret_inst :  STD_LOGIC;
attribute ALTERA_IP_DEBUG_VISIBLE : boolean;
attribute ALTERA_IP_DEBUG_VISIBLE of D_iw : signal is true;
attribute ALTERA_IP_DEBUG_VISIBLE of F_pc : signal is true;
attribute ALTERA_IP_DEBUG_VISIBLE of R_dst_regnum : signal is true;
attribute ALTERA_IP_DEBUG_VISIBLE of W_valid : signal is true;
  --synthesis translate_off
constant cpu_0_register_bank_a_lpm_file : string := "cpu_0_rf_ram_a.hex";
--synthesis translate_on
--synthesis read_comments_as_HDL on
--constant cpu_0_register_bank_a_lpm_file : string := "cpu_0_rf_ram_a.mif";
--synthesis read_comments_as_HDL off

  --synthesis translate_off
constant cpu_0_register_bank_b_lpm_file : string := "cpu_0_rf_ram_b.hex";
--synthesis translate_on
--synthesis read_comments_as_HDL on
--constant cpu_0_register_bank_b_lpm_file : string := "cpu_0_rf_ram_b.mif";
--synthesis read_comments_as_HDL off


begin

  --the_cpu_0_test_bench, which is an e_instance
  the_cpu_0_test_bench : cpu_0_test_bench
    port map(
      av_ld_data_aligned_filtered => av_ld_data_aligned_filtered,
      d_write => internal_d_write,
      test_has_ended => test_has_ended,
      D_iw => D_iw,
      D_iw_op => D_iw_op,
      D_iw_opx => D_iw_opx,
      D_valid => D_valid,
      E_alu_result => E_alu_result,
      E_mem_byte_en => E_mem_byte_en,
      E_st_data => E_st_data,
      E_valid => E_valid,
      F_pcb => F_pcb,
      F_valid => F_valid,
      R_ctrl_exception => R_ctrl_exception,
      R_ctrl_ld => R_ctrl_ld,
      R_ctrl_ld_non_io => R_ctrl_ld_non_io,
      R_dst_regnum => R_dst_regnum,
      R_wr_dst_reg => R_wr_dst_reg,
      W_bstatus_reg => W_bstatus_reg,
      W_cmp_result => W_cmp_result,
      W_estatus_reg => W_estatus_reg,
      W_ienable_reg => W_ienable_reg,
      W_ipending_reg => W_ipending_reg,
      W_mem_baddr => W_mem_baddr,
      W_rf_wr_data => W_rf_wr_data,
      W_status_reg => W_status_reg,
      W_valid => W_valid,
      W_vinst => W_vinst,
      W_wr_data => W_wr_data,
      av_ld_data_aligned_unfiltered => av_ld_data_aligned_unfiltered,
      clk => clk,
      d_address => internal_d_address,
      d_byteenable => internal_d_byteenable,
      d_read => internal_d_read,
      d_write_nxt => d_write_nxt,
      i_address => internal_i_address,
      i_read => internal_i_read,
      i_readdata => i_readdata,
      i_waitrequest => i_waitrequest,
      reset_n => reset_n
    );


  F_av_iw_a <= F_av_iw(31 DOWNTO 27);
  F_av_iw_b <= F_av_iw(26 DOWNTO 22);
  F_av_iw_c <= F_av_iw(21 DOWNTO 17);
  F_av_iw_custom_n <= F_av_iw(13 DOWNTO 6);
  F_av_iw_custom_readra <= F_av_iw(16);
  F_av_iw_custom_readrb <= F_av_iw(15);
  F_av_iw_custom_writerc <= F_av_iw(14);
  F_av_iw_opx <= F_av_iw(16 DOWNTO 11);
  F_av_iw_op <= F_av_iw(5 DOWNTO 0);
  F_av_iw_shift_imm5 <= F_av_iw(10 DOWNTO 6);
  F_av_iw_trap_break_imm5 <= F_av_iw(10 DOWNTO 6);
  F_av_iw_imm5 <= F_av_iw(10 DOWNTO 6);
  F_av_iw_imm16 <= F_av_iw(21 DOWNTO 6);
  F_av_iw_imm26 <= F_av_iw(31 DOWNTO 6);
  F_av_iw_memsz <= F_av_iw(4 DOWNTO 3);
  F_av_iw_control_regnum <= F_av_iw(8 DOWNTO 6);
  F_av_mem8 <= to_std_logic((F_av_iw_memsz = std_logic_vector'("00")));
  F_av_mem16 <= to_std_logic((F_av_iw_memsz = std_logic_vector'("01")));
  F_av_mem32 <= to_std_logic((std_logic'(F_av_iw_memsz(1)) = std_logic'(std_logic'('1'))));
  F_iw_a <= F_iw(31 DOWNTO 27);
  F_iw_b <= F_iw(26 DOWNTO 22);
  F_iw_c <= F_iw(21 DOWNTO 17);
  F_iw_custom_n <= F_iw(13 DOWNTO 6);
  F_iw_custom_readra <= F_iw(16);
  F_iw_custom_readrb <= F_iw(15);
  F_iw_custom_writerc <= F_iw(14);
  F_iw_opx <= F_iw(16 DOWNTO 11);
  F_iw_op <= F_iw(5 DOWNTO 0);
  F_iw_shift_imm5 <= F_iw(10 DOWNTO 6);
  F_iw_trap_break_imm5 <= F_iw(10 DOWNTO 6);
  F_iw_imm5 <= F_iw(10 DOWNTO 6);
  F_iw_imm16 <= F_iw(21 DOWNTO 6);
  F_iw_imm26 <= F_iw(31 DOWNTO 6);
  F_iw_memsz <= F_iw(4 DOWNTO 3);
  F_iw_control_regnum <= F_iw(8 DOWNTO 6);
  F_mem8 <= to_std_logic((F_iw_memsz = std_logic_vector'("00")));
  F_mem16 <= to_std_logic((F_iw_memsz = std_logic_vector'("01")));
  F_mem32 <= to_std_logic((std_logic'(F_iw_memsz(1)) = std_logic'(std_logic'('1'))));
  D_iw_a <= D_iw(31 DOWNTO 27);
  D_iw_b <= D_iw(26 DOWNTO 22);
  D_iw_c <= D_iw(21 DOWNTO 17);
  D_iw_custom_n <= D_iw(13 DOWNTO 6);
  D_iw_custom_readra <= D_iw(16);
  D_iw_custom_readrb <= D_iw(15);
  D_iw_custom_writerc <= D_iw(14);
  D_iw_opx <= D_iw(16 DOWNTO 11);
  D_iw_op <= D_iw(5 DOWNTO 0);
  D_iw_shift_imm5 <= D_iw(10 DOWNTO 6);
  D_iw_trap_break_imm5 <= D_iw(10 DOWNTO 6);
  D_iw_imm5 <= D_iw(10 DOWNTO 6);
  D_iw_imm16 <= D_iw(21 DOWNTO 6);
  D_iw_imm26 <= D_iw(31 DOWNTO 6);
  D_iw_memsz <= D_iw(4 DOWNTO 3);
  D_iw_control_regnum <= D_iw(8 DOWNTO 6);
  D_mem8 <= to_std_logic((D_iw_memsz = std_logic_vector'("00")));
  D_mem16 <= to_std_logic((D_iw_memsz = std_logic_vector'("01")));
  D_mem32 <= to_std_logic((std_logic'(D_iw_memsz(1)) = std_logic'(std_logic'('1'))));
  F_op_call <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000000000")));
  F_op_jmpi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000000001")));
  F_op_ldbu <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000000011")));
  F_op_addi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000000100")));
  F_op_stb <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000000101")));
  F_op_br <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000000110")));
  F_op_ldb <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000000111")));
  F_op_cmpgei <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000001000")));
  F_op_ldhu <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000001011")));
  F_op_andi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000001100")));
  F_op_sth <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000001101")));
  F_op_bge <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000001110")));
  F_op_ldh <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000001111")));
  F_op_cmplti <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000010000")));
  F_op_initda <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000010011")));
  F_op_ori <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000010100")));
  F_op_stw <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000010101")));
  F_op_blt <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000010110")));
  F_op_ldw <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000010111")));
  F_op_cmpnei <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000011000")));
  F_op_flushda <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000011011")));
  F_op_xori <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000011100")));
  F_op_stc <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000011101")));
  F_op_bne <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000011110")));
  F_op_ldl <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000011111")));
  F_op_cmpeqi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000100000")));
  F_op_ldbuio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000100011")));
  F_op_muli <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000100100")));
  F_op_stbio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000100101")));
  F_op_beq <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000100110")));
  F_op_ldbio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000100111")));
  F_op_cmpgeui <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000101000")));
  F_op_ldhuio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000101011")));
  F_op_andhi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000101100")));
  F_op_sthio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000101101")));
  F_op_bgeu <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000101110")));
  F_op_ldhio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000101111")));
  F_op_cmpltui <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000110000")));
  F_op_initd <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000110011")));
  F_op_orhi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000110100")));
  F_op_stwio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000110101")));
  F_op_bltu <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000110110")));
  F_op_ldwio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000110111")));
  F_op_rdprs <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000111000")));
  F_op_flushd <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000111011")));
  F_op_xorhi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000111100")));
  F_op_rsv02 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000000010")));
  F_op_rsv09 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000001001")));
  F_op_rsv10 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000001010")));
  F_op_rsv17 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000010001")));
  F_op_rsv18 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000010010")));
  F_op_rsv25 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000011001")));
  F_op_rsv26 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000011010")));
  F_op_rsv33 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000100001")));
  F_op_rsv34 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000100010")));
  F_op_rsv41 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000101001")));
  F_op_rsv42 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000101010")));
  F_op_rsv49 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000110001")));
  F_op_rsv57 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000111001")));
  F_op_rsv61 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000111101")));
  F_op_rsv62 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000111110")));
  F_op_rsv63 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000111111")));
  F_op_eret <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000000001"))));
  F_op_roli <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000000010"))));
  F_op_rol <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000000011"))));
  F_op_flushp <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000000100"))));
  F_op_ret <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000000101"))));
  F_op_nor <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000000110"))));
  F_op_mulxuu <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000000111"))));
  F_op_cmpge <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000001000"))));
  F_op_bret <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000001001"))));
  F_op_ror <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000001011"))));
  F_op_flushi <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000001100"))));
  F_op_jmp <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000001101"))));
  F_op_and <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000001110"))));
  F_op_cmplt <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000010000"))));
  F_op_slli <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000010010"))));
  F_op_sll <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000010011"))));
  F_op_wrprs <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000010100"))));
  F_op_or <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000010110"))));
  F_op_mulxsu <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000010111"))));
  F_op_cmpne <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000011000"))));
  F_op_srli <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000011010"))));
  F_op_srl <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000011011"))));
  F_op_nextpc <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000011100"))));
  F_op_callr <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000011101"))));
  F_op_xor <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000011110"))));
  F_op_mulxss <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000011111"))));
  F_op_cmpeq <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000100000"))));
  F_op_divu <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000100100"))));
  F_op_div <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000100101"))));
  F_op_rdctl <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000100110"))));
  F_op_mul <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000100111"))));
  F_op_cmpgeu <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000101000"))));
  F_op_initi <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000101001"))));
  F_op_trap <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000101101"))));
  F_op_wrctl <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000101110"))));
  F_op_cmpltu <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000110000"))));
  F_op_add <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000110001"))));
  F_op_break <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000110100"))));
  F_op_hbreak <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000110101"))));
  F_op_sync <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000110110"))));
  F_op_sub <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000111001"))));
  F_op_srai <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000111010"))));
  F_op_sra <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000111011"))));
  F_op_intr <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000111101"))));
  F_op_crst <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000111110"))));
  F_op_rsvx00 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000000000"))));
  F_op_rsvx10 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000001010"))));
  F_op_rsvx15 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000001111"))));
  F_op_rsvx17 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000010001"))));
  F_op_rsvx21 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000010101"))));
  F_op_rsvx25 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000011001"))));
  F_op_rsvx33 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000100001"))));
  F_op_rsvx34 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000100010"))));
  F_op_rsvx35 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000100011"))));
  F_op_rsvx42 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000101010"))));
  F_op_rsvx43 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000101011"))));
  F_op_rsvx44 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000101100"))));
  F_op_rsvx47 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000101111"))));
  F_op_rsvx50 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000110010"))));
  F_op_rsvx51 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000110011"))));
  F_op_rsvx55 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000110111"))));
  F_op_rsvx56 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000111000"))));
  F_op_rsvx60 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000111100"))));
  F_op_rsvx63 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000111111"))));
  F_op_opx <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000111010")));
  F_op_custom <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000110010")));
  D_op_call <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000000000")));
  D_op_jmpi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000000001")));
  D_op_ldbu <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000000011")));
  D_op_addi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000000100")));
  D_op_stb <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000000101")));
  D_op_br <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000000110")));
  D_op_ldb <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000000111")));
  D_op_cmpgei <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000001000")));
  D_op_ldhu <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000001011")));
  D_op_andi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000001100")));
  D_op_sth <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000001101")));
  D_op_bge <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000001110")));
  D_op_ldh <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000001111")));
  D_op_cmplti <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000010000")));
  D_op_initda <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000010011")));
  D_op_ori <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000010100")));
  D_op_stw <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000010101")));
  D_op_blt <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000010110")));
  D_op_ldw <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000010111")));
  D_op_cmpnei <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000011000")));
  D_op_flushda <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000011011")));
  D_op_xori <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000011100")));
  D_op_stc <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000011101")));
  D_op_bne <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000011110")));
  D_op_ldl <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000011111")));
  D_op_cmpeqi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000100000")));
  D_op_ldbuio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000100011")));
  D_op_muli <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000100100")));
  D_op_stbio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000100101")));
  D_op_beq <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000100110")));
  D_op_ldbio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000100111")));
  D_op_cmpgeui <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000101000")));
  D_op_ldhuio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000101011")));
  D_op_andhi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000101100")));
  D_op_sthio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000101101")));
  D_op_bgeu <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000101110")));
  D_op_ldhio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000101111")));
  D_op_cmpltui <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000110000")));
  D_op_initd <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000110011")));
  D_op_orhi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000110100")));
  D_op_stwio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000110101")));
  D_op_bltu <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000110110")));
  D_op_ldwio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000110111")));
  D_op_rdprs <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000111000")));
  D_op_flushd <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000111011")));
  D_op_xorhi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000111100")));
  D_op_rsv02 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000000010")));
  D_op_rsv09 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000001001")));
  D_op_rsv10 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000001010")));
  D_op_rsv17 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000010001")));
  D_op_rsv18 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000010010")));
  D_op_rsv25 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000011001")));
  D_op_rsv26 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000011010")));
  D_op_rsv33 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000100001")));
  D_op_rsv34 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000100010")));
  D_op_rsv41 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000101001")));
  D_op_rsv42 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000101010")));
  D_op_rsv49 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000110001")));
  D_op_rsv57 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000111001")));
  D_op_rsv61 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000111101")));
  D_op_rsv62 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000111110")));
  D_op_rsv63 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000111111")));
  D_op_eret <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000000001"))));
  D_op_roli <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000000010"))));
  D_op_rol <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000000011"))));
  D_op_flushp <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000000100"))));
  D_op_ret <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000000101"))));
  D_op_nor <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000000110"))));
  D_op_mulxuu <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000000111"))));
  D_op_cmpge <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000001000"))));
  D_op_bret <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000001001"))));
  D_op_ror <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000001011"))));
  D_op_flushi <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000001100"))));
  D_op_jmp <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000001101"))));
  D_op_and <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000001110"))));
  D_op_cmplt <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000010000"))));
  D_op_slli <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000010010"))));
  D_op_sll <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000010011"))));
  D_op_wrprs <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000010100"))));
  D_op_or <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000010110"))));
  D_op_mulxsu <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000010111"))));
  D_op_cmpne <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000011000"))));
  D_op_srli <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000011010"))));
  D_op_srl <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000011011"))));
  D_op_nextpc <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000011100"))));
  D_op_callr <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000011101"))));
  D_op_xor <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000011110"))));
  D_op_mulxss <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000011111"))));
  D_op_cmpeq <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000100000"))));
  D_op_divu <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000100100"))));
  D_op_div <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000100101"))));
  D_op_rdctl <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000100110"))));
  D_op_mul <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000100111"))));
  D_op_cmpgeu <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000101000"))));
  D_op_initi <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000101001"))));
  D_op_trap <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000101101"))));
  D_op_wrctl <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000101110"))));
  D_op_cmpltu <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000110000"))));
  D_op_add <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000110001"))));
  D_op_break <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000110100"))));
  D_op_hbreak <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000110101"))));
  D_op_sync <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000110110"))));
  D_op_sub <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000111001"))));
  D_op_srai <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000111010"))));
  D_op_sra <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000111011"))));
  D_op_intr <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000111101"))));
  D_op_crst <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000111110"))));
  D_op_rsvx00 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000000000"))));
  D_op_rsvx10 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000001010"))));
  D_op_rsvx15 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000001111"))));
  D_op_rsvx17 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000010001"))));
  D_op_rsvx21 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000010101"))));
  D_op_rsvx25 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000011001"))));
  D_op_rsvx33 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000100001"))));
  D_op_rsvx34 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000100010"))));
  D_op_rsvx35 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000100011"))));
  D_op_rsvx42 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000101010"))));
  D_op_rsvx43 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000101011"))));
  D_op_rsvx44 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000101100"))));
  D_op_rsvx47 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000101111"))));
  D_op_rsvx50 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000110010"))));
  D_op_rsvx51 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000110011"))));
  D_op_rsvx55 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000110111"))));
  D_op_rsvx56 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000111000"))));
  D_op_rsvx60 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000111100"))));
  D_op_rsvx63 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000111111"))));
  D_op_opx <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000111010")));
  D_op_custom <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000110010")));
  R_en <= std_logic'('1');
  E_ci_result <= std_logic_vector'("00000000000000000000000000000000");
  E_ci_multi_stall <= std_logic'('0');
  iactive <= d_irq(31 DOWNTO 0) AND std_logic_vector'("00000000000000000000000000000011");
  F_pc_sel_nxt <= A_WE_StdLogicVector((std_logic'(R_ctrl_exception) = '1'), std_logic_vector'("00"), A_WE_StdLogicVector((std_logic'(R_ctrl_break) = '1'), std_logic_vector'("01"), A_WE_StdLogicVector((std_logic'(((W_br_taken OR R_ctrl_uncond_cti_non_br))) = '1'), std_logic_vector'("10"), std_logic_vector'("11"))));
  F_pc_no_crst_nxt <= A_EXT (A_WE_StdLogicVector(((F_pc_sel_nxt = std_logic_vector'("00"))), std_logic_vector'("00000000100000000000000000001000"), A_WE_StdLogicVector(((F_pc_sel_nxt = std_logic_vector'("01"))), std_logic_vector'("00000001001000000000010000001000"), (std_logic_vector'("0000000") & (A_WE_StdLogicVector(((F_pc_sel_nxt = std_logic_vector'("10"))), E_arith_result(26 DOWNTO 2), F_pc_plus_one))))), 25);
  F_pc_nxt <= F_pc_no_crst_nxt;
  F_pcb_nxt <= F_pc_nxt & std_logic_vector'("00");
  F_pc_en <= W_valid;
  F_pc_plus_one <= A_EXT (((std_logic_vector'("00000000") & (F_pc)) + std_logic_vector'("000000000000000000000000000000001")), 25);
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      F_pc <= std_logic_vector'("1001000000000011000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(F_pc_en) = '1' then 
        F_pc <= F_pc_nxt;
      end if;
    end if;

  end process;

  F_pcb <= F_pc & std_logic_vector'("00");
  F_pcb_plus_four <= F_pc_plus_one & std_logic_vector'("00");
  F_valid <= internal_i_read AND NOT i_waitrequest;
  i_read_nxt <= W_valid OR ((internal_i_read AND i_waitrequest));
  internal_i_address <= F_pc & std_logic_vector'("00");
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_i_read <= std_logic'('1');
    elsif clk'event and clk = '1' then
      internal_i_read <= i_read_nxt;
    end if;

  end process;

  oci_tb_hbreak_req <= oci_hbreak_req;
  hbreak_req <= (((oci_tb_hbreak_req OR hbreak_pending)) AND hbreak_enabled) AND NOT ((wait_for_one_post_bret_inst AND NOT W_valid));
  hbreak_pending_nxt <= A_WE_StdLogic((std_logic'(hbreak_pending) = '1'), hbreak_enabled, hbreak_req);
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      wait_for_one_post_bret_inst <= std_logic'('0');
    elsif clk'event and clk = '1' then
      wait_for_one_post_bret_inst <= A_WE_StdLogic((std_logic'(((NOT hbreak_enabled AND oci_single_step_mode))) = '1'), std_logic'('1'), A_WE_StdLogic((std_logic'(((F_valid OR NOT oci_single_step_mode))) = '1'), std_logic'('0'), wait_for_one_post_bret_inst));
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      hbreak_pending <= std_logic'('0');
    elsif clk'event and clk = '1' then
      hbreak_pending <= hbreak_pending_nxt;
    end if;

  end process;

  intr_req <= W_status_reg_pie AND to_std_logic(((W_ipending_reg /= std_logic_vector'("00000000000000000000000000000000"))));
  F_av_iw <= i_readdata;
  F_iw <= A_WE_StdLogicVector((std_logic'(hbreak_req) = '1'), std_logic_vector'("00000000001111011010100000111010"), A_WE_StdLogicVector((std_logic'(std_logic'('0')) = '1'), std_logic_vector'("00000000000000011111000000111010"), A_WE_StdLogicVector((std_logic'(intr_req) = '1'), std_logic_vector'("00000000001110111110100000111010"), F_av_iw)));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      D_iw <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(F_valid) = '1' then 
        D_iw <= F_iw;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      D_valid <= std_logic'('0');
    elsif clk'event and clk = '1' then
      D_valid <= F_valid;
    end if;

  end process;

  D_dst_regnum <= A_WE_StdLogicVector((std_logic'(D_ctrl_implicit_dst_retaddr) = '1'), std_logic_vector'("11111"), A_WE_StdLogicVector((std_logic'(D_ctrl_implicit_dst_eretaddr) = '1'), std_logic_vector'("11101"), A_WE_StdLogicVector((std_logic'(D_ctrl_b_is_dst) = '1'), D_iw_b, D_iw_c)));
  D_wr_dst_reg <= to_std_logic((((std_logic_vector'("000000000000000000000000000") & (D_dst_regnum)) /= std_logic_vector'("00000000000000000000000000000000")))) AND NOT D_ctrl_ignore_dst;
  D_logic_op_raw <= A_WE_StdLogicVector((std_logic'(D_op_opx) = '1'), D_iw_opx(4 DOWNTO 3), D_iw_op(4 DOWNTO 3));
  D_logic_op <= A_WE_StdLogicVector((std_logic'(D_ctrl_alu_force_xor) = '1'), std_logic_vector'("11"), D_logic_op_raw);
  D_compare_op <= A_WE_StdLogicVector((std_logic'(D_op_opx) = '1'), D_iw_opx(4 DOWNTO 3), D_iw_op(4 DOWNTO 3));
  D_jmp_direct_target_waddr <= A_EXT (D_iw(31 DOWNTO 6), 25);
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_valid <= std_logic'('0');
    elsif clk'event and clk = '1' then
      R_valid <= D_valid;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_wr_dst_reg <= std_logic'('0');
    elsif clk'event and clk = '1' then
      R_wr_dst_reg <= D_wr_dst_reg;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_dst_regnum <= std_logic_vector'("00000");
    elsif clk'event and clk = '1' then
      R_dst_regnum <= D_dst_regnum;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_logic_op <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      R_logic_op <= D_logic_op;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_compare_op <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      R_compare_op <= D_compare_op;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_src2_use_imm <= std_logic'('0');
    elsif clk'event and clk = '1' then
      R_src2_use_imm <= D_ctrl_src2_choose_imm OR ((D_ctrl_br AND R_valid));
    end if;

  end process;

  W_rf_wren <= ((R_wr_dst_reg AND W_valid)) OR NOT reset_n;
  W_rf_wr_data <= A_WE_StdLogicVector((std_logic'(R_ctrl_ld) = '1'), av_ld_data_aligned_filtered, W_wr_data);
  --cpu_0_register_bank_a, which is an nios_sdp_ram
  cpu_0_register_bank_a : cpu_0_register_bank_a_module
    generic map(
      lpm_file => cpu_0_register_bank_a_lpm_file
    )
    port map(
      q => R_rf_a,
      clock => clk,
      data => W_rf_wr_data,
      rdaddress => D_iw_a,
      wraddress => R_dst_regnum,
      wren => W_rf_wren
    );


  --cpu_0_register_bank_b, which is an nios_sdp_ram
  cpu_0_register_bank_b : cpu_0_register_bank_b_module
    generic map(
      lpm_file => cpu_0_register_bank_b_lpm_file
    )
    port map(
      q => R_rf_b,
      clock => clk,
      data => W_rf_wr_data,
      rdaddress => D_iw_b,
      wraddress => R_dst_regnum,
      wren => W_rf_wren
    );


  R_src1 <= A_WE_StdLogicVector((std_logic'(((((R_ctrl_br AND E_valid)) OR ((R_ctrl_retaddr AND R_valid))))) = '1'), (std_logic_vector'("00000") & ((F_pc_plus_one & std_logic_vector'("00")))), A_WE_StdLogicVector((std_logic'(((R_ctrl_jmp_direct AND E_valid))) = '1'), (std_logic_vector'("00000") & ((D_jmp_direct_target_waddr & std_logic_vector'("00")))), R_rf_a));
  R_src2_lo <= A_WE_StdLogicVector((std_logic'(((R_ctrl_force_src2_zero OR R_ctrl_hi_imm16))) = '1'), std_logic_vector'("0000000000000000"), A_WE_StdLogicVector((std_logic'((R_src2_use_imm)) = '1'), D_iw_imm16, R_rf_b(15 DOWNTO 0)));
  R_src2_hi <= A_WE_StdLogicVector((std_logic'(((R_ctrl_force_src2_zero OR R_ctrl_unsigned_lo_imm16))) = '1'), std_logic_vector'("0000000000000000"), A_WE_StdLogicVector((std_logic'((R_ctrl_hi_imm16)) = '1'), D_iw_imm16, A_WE_StdLogicVector((std_logic'((R_src2_use_imm)) = '1'), A_REP(D_iw_imm16(15) , 16), R_rf_b(31 DOWNTO 16))));
  R_src2 <= R_src2_hi & R_src2_lo;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_valid <= std_logic'('0');
    elsif clk'event and clk = '1' then
      E_valid <= R_valid OR E_stall;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_new_inst <= std_logic'('0');
    elsif clk'event and clk = '1' then
      E_new_inst <= R_valid;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_src1 <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      E_src1 <= R_src1;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_src2 <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      E_src2 <= R_src2;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_invert_arith_src_msb <= std_logic'('0');
    elsif clk'event and clk = '1' then
      E_invert_arith_src_msb <= D_ctrl_alu_signed_comparison AND R_valid;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_alu_sub <= std_logic'('0');
    elsif clk'event and clk = '1' then
      E_alu_sub <= D_ctrl_alu_subtract AND R_valid;
    end if;

  end process;

  E_stall <= ((E_shift_rot_stall OR E_ld_stall) OR E_st_stall) OR E_ci_multi_stall;
  E_arith_src1 <= Std_Logic_Vector'(A_ToStdLogicVector((E_src1(31) XOR E_invert_arith_src_msb)) & E_src1(30 DOWNTO 0));
  E_arith_src2 <= Std_Logic_Vector'(A_ToStdLogicVector((E_src2(31) XOR E_invert_arith_src_msb)) & E_src2(30 DOWNTO 0));
  E_arith_result <= A_WE_StdLogicVector((std_logic'(E_alu_sub) = '1'), ((std_logic_vector'("0") & (E_arith_src1)) - (std_logic_vector'("0") & (E_arith_src2))), ((std_logic_vector'("0") & (E_arith_src1)) + (std_logic_vector'("0") & (E_arith_src2))));
  E_mem_baddr <= E_arith_result(26 DOWNTO 0);
  E_logic_result <= A_WE_StdLogicVector(((R_logic_op = std_logic_vector'("00"))), (NOT ((E_src1 OR E_src2))), A_WE_StdLogicVector(((R_logic_op = std_logic_vector'("01"))), ((E_src1 AND E_src2)), A_WE_StdLogicVector(((R_logic_op = std_logic_vector'("10"))), ((E_src1 OR E_src2)), ((E_src1 XOR E_src2)))));
  E_logic_result_is_0 <= to_std_logic((E_logic_result = std_logic_vector'("00000000000000000000000000000000")));
  E_eq <= E_logic_result_is_0;
  E_lt <= E_arith_result(32);
  E_cmp_result <= A_WE_StdLogic(((R_compare_op = std_logic_vector'("00"))), E_eq, A_WE_StdLogic(((R_compare_op = std_logic_vector'("01"))), NOT E_lt, A_WE_StdLogic(((R_compare_op = std_logic_vector'("10"))), E_lt, NOT E_eq)));
  E_shift_rot_cnt_nxt <= A_EXT (A_WE_StdLogicVector((std_logic'(E_new_inst) = '1'), (std_logic_vector'("0000000000000000000000000000") & (E_src2(4 DOWNTO 0))), ((std_logic_vector'("0000000000000000000000000000") & (E_shift_rot_cnt)) - std_logic_vector'("000000000000000000000000000000001"))), 5);
  E_shift_rot_done <= to_std_logic((((std_logic_vector'("000000000000000000000000000") & (E_shift_rot_cnt)) = std_logic_vector'("00000000000000000000000000000000")))) AND NOT E_new_inst;
  E_shift_rot_stall <= (R_ctrl_shift_rot AND E_valid) AND NOT E_shift_rot_done;
  E_shift_rot_fill_bit <= A_WE_StdLogic((std_logic'(R_ctrl_shift_logical) = '1'), std_logic'('0'), (A_WE_StdLogic((std_logic'(R_ctrl_rot_right) = '1'), E_shift_rot_result(0), E_shift_rot_result(31))));
  E_shift_rot_result_nxt <= A_WE_StdLogicVector((std_logic'((E_new_inst)) = '1'), E_src1, A_WE_StdLogicVector((std_logic'((R_ctrl_shift_rot_right)) = '1'), Std_Logic_Vector'(A_ToStdLogicVector(E_shift_rot_fill_bit) & E_shift_rot_result(31 DOWNTO 1)), Std_Logic_Vector'(E_shift_rot_result(30 DOWNTO 0) & A_ToStdLogicVector(E_shift_rot_fill_bit))));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_shift_rot_result <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      E_shift_rot_result <= E_shift_rot_result_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_shift_rot_cnt <= std_logic_vector'("00000");
    elsif clk'event and clk = '1' then
      E_shift_rot_cnt <= E_shift_rot_cnt_nxt;
    end if;

  end process;

  E_control_rd_data <= A_WE_StdLogicVector(((D_iw_control_regnum = std_logic_vector'("000"))), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(W_status_reg))), A_WE_StdLogicVector(((D_iw_control_regnum = std_logic_vector'("001"))), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(W_estatus_reg))), A_WE_StdLogicVector(((D_iw_control_regnum = std_logic_vector'("010"))), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(W_bstatus_reg))), A_WE_StdLogicVector(((D_iw_control_regnum = std_logic_vector'("011"))), W_ienable_reg, A_WE_StdLogicVector(((D_iw_control_regnum = std_logic_vector'("100"))), W_ipending_reg, std_logic_vector'("00000000000000000000000000000000"))))));
  E_alu_result <= A_EXT (A_WE_StdLogicVector((std_logic'(((R_ctrl_br_cmp OR R_ctrl_rdctl_inst))) = '1'), std_logic_vector'("000000000000000000000000000000000"), A_WE_StdLogicVector((std_logic'((R_ctrl_shift_rot)) = '1'), (std_logic_vector'("0") & (E_shift_rot_result)), A_WE_StdLogicVector((std_logic'((R_ctrl_logic)) = '1'), (std_logic_vector'("0") & (E_logic_result)), A_WE_StdLogicVector((std_logic'((R_ctrl_custom)) = '1'), (std_logic_vector'("0") & (E_ci_result)), E_arith_result)))), 32);
  R_stb_data <= R_rf_b(7 DOWNTO 0);
  R_sth_data <= R_rf_b(15 DOWNTO 0);
  E_st_data <= A_WE_StdLogicVector((std_logic'((D_mem8)) = '1'), (R_stb_data & R_stb_data & R_stb_data & R_stb_data), A_WE_StdLogicVector((std_logic'((D_mem16)) = '1'), (R_sth_data & R_sth_data), R_rf_b));
  E_mem_byte_en <= A_WE_StdLogicVector((((D_iw_memsz & E_mem_baddr(1 DOWNTO 0)) = Std_Logic_Vector'(std_logic_vector'("00") & std_logic_vector'("00")))), std_logic_vector'("0001"), A_WE_StdLogicVector((((D_iw_memsz & E_mem_baddr(1 DOWNTO 0)) = Std_Logic_Vector'(std_logic_vector'("00") & std_logic_vector'("01")))), std_logic_vector'("0010"), A_WE_StdLogicVector((((D_iw_memsz & E_mem_baddr(1 DOWNTO 0)) = Std_Logic_Vector'(std_logic_vector'("00") & std_logic_vector'("10")))), std_logic_vector'("0100"), A_WE_StdLogicVector((((D_iw_memsz & E_mem_baddr(1 DOWNTO 0)) = Std_Logic_Vector'(std_logic_vector'("00") & std_logic_vector'("11")))), std_logic_vector'("1000"), A_WE_StdLogicVector((((D_iw_memsz & E_mem_baddr(1 DOWNTO 0)) = Std_Logic_Vector'(std_logic_vector'("01") & std_logic_vector'("00")))), std_logic_vector'("0011"), A_WE_StdLogicVector((((D_iw_memsz & E_mem_baddr(1 DOWNTO 0)) = Std_Logic_Vector'(std_logic_vector'("01") & std_logic_vector'("01")))), std_logic_vector'("0011"), A_WE_StdLogicVector((((D_iw_memsz & E_mem_baddr(1 DOWNTO 0)) = Std_Logic_Vector'(std_logic_vector'("01") & std_logic_vector'("10")))), std_logic_vector'("1100"), A_WE_StdLogicVector((((D_iw_memsz & E_mem_baddr(1 DOWNTO 0)) = Std_Logic_Vector'(std_logic_vector'("01") & std_logic_vector'("11")))), std_logic_vector'("1100"), std_logic_vector'("1111")))))))));
  d_read_nxt <= ((R_ctrl_ld AND E_new_inst)) OR ((internal_d_read AND d_waitrequest));
  E_ld_stall <= R_ctrl_ld AND ((((E_valid AND NOT av_ld_done)) OR E_new_inst));
  d_write_nxt <= ((R_ctrl_st AND E_new_inst)) OR ((internal_d_write AND d_waitrequest));
  E_st_stall <= d_write_nxt;
  internal_d_address <= W_mem_baddr;
  av_ld_getting_data <= internal_d_read AND NOT d_waitrequest;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_d_read <= std_logic'('0');
    elsif clk'event and clk = '1' then
      internal_d_read <= d_read_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d_writedata <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      d_writedata <= E_st_data;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_d_byteenable <= std_logic_vector'("0000");
    elsif clk'event and clk = '1' then
      internal_d_byteenable <= E_mem_byte_en;
    end if;

  end process;

  av_ld_align_cycle_nxt <= A_EXT (A_WE_StdLogicVector((std_logic'(av_ld_getting_data) = '1'), std_logic_vector'("000000000000000000000000000000000"), (((std_logic_vector'("0000000000000000000000000000000") & (av_ld_align_cycle)) + std_logic_vector'("000000000000000000000000000000001")))), 2);
  av_ld_align_one_more_cycle <= to_std_logic(((std_logic_vector'("000000000000000000000000000000") & (av_ld_align_cycle)) = (A_WE_StdLogicVector((std_logic'(D_mem16) = '1'), std_logic_vector'("00000000000000000000000000000010"), std_logic_vector'("00000000000000000000000000000011")))));
  av_ld_aligning_data_nxt <= A_WE_StdLogic((std_logic'(av_ld_aligning_data) = '1'), NOT av_ld_align_one_more_cycle, ((NOT D_mem32 AND av_ld_getting_data)));
  av_ld_waiting_for_data_nxt <= A_WE_StdLogic((std_logic'(av_ld_waiting_for_data) = '1'), NOT av_ld_getting_data, ((R_ctrl_ld AND E_new_inst)));
  av_ld_done <= NOT av_ld_waiting_for_data_nxt AND ((D_mem32 OR NOT av_ld_aligning_data_nxt));
  av_ld_rshift8 <= av_ld_aligning_data AND to_std_logic(((av_ld_align_cycle<(W_mem_baddr(1 DOWNTO 0)))));
  av_ld_extend <= av_ld_aligning_data;
  av_ld_byte0_data_nxt <= A_WE_StdLogicVector((std_logic'(av_ld_rshift8) = '1'), av_ld_byte1_data, A_WE_StdLogicVector((std_logic'(av_ld_extend) = '1'), av_ld_byte0_data, d_readdata(7 DOWNTO 0)));
  av_ld_byte1_data_nxt <= A_WE_StdLogicVector((std_logic'(av_ld_rshift8) = '1'), av_ld_byte2_data, A_WE_StdLogicVector((std_logic'(av_ld_extend) = '1'), A_REP(av_fill_bit, 8), d_readdata(15 DOWNTO 8)));
  av_ld_byte2_data_nxt <= A_WE_StdLogicVector((std_logic'(av_ld_rshift8) = '1'), av_ld_byte3_data, A_WE_StdLogicVector((std_logic'(av_ld_extend) = '1'), A_REP(av_fill_bit, 8), d_readdata(23 DOWNTO 16)));
  av_ld_byte3_data_nxt <= A_WE_StdLogicVector((std_logic'(av_ld_rshift8) = '1'), av_ld_byte3_data, A_WE_StdLogicVector((std_logic'(av_ld_extend) = '1'), A_REP(av_fill_bit, 8), d_readdata(31 DOWNTO 24)));
  av_ld_byte1_data_en <= NOT (((av_ld_extend AND D_mem16) AND NOT av_ld_rshift8));
  av_ld_data_aligned_unfiltered <= av_ld_byte3_data & av_ld_byte2_data & av_ld_byte1_data & av_ld_byte0_data;
  av_sign_bit <= A_WE_StdLogic((std_logic'(D_mem16) = '1'), av_ld_byte1_data(7), av_ld_byte0_data(7));
  av_fill_bit <= av_sign_bit AND R_ctrl_ld_signed;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      av_ld_align_cycle <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      av_ld_align_cycle <= av_ld_align_cycle_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      av_ld_waiting_for_data <= std_logic'('0');
    elsif clk'event and clk = '1' then
      av_ld_waiting_for_data <= av_ld_waiting_for_data_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      av_ld_aligning_data <= std_logic'('0');
    elsif clk'event and clk = '1' then
      av_ld_aligning_data <= av_ld_aligning_data_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      av_ld_byte0_data <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      av_ld_byte0_data <= av_ld_byte0_data_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      av_ld_byte1_data <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      if std_logic'(av_ld_byte1_data_en) = '1' then 
        av_ld_byte1_data <= av_ld_byte1_data_nxt;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      av_ld_byte2_data <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      av_ld_byte2_data <= av_ld_byte2_data_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      av_ld_byte3_data <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      av_ld_byte3_data <= av_ld_byte3_data_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_valid <= std_logic'('0');
    elsif clk'event and clk = '1' then
      W_valid <= E_valid AND NOT E_stall;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_control_rd_data <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      W_control_rd_data <= E_control_rd_data;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_cmp_result <= std_logic'('0');
    elsif clk'event and clk = '1' then
      W_cmp_result <= E_cmp_result;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_alu_result <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      W_alu_result <= E_alu_result;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_status_reg_pie <= std_logic'('0');
    elsif clk'event and clk = '1' then
      W_status_reg_pie <= W_status_reg_pie_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_estatus_reg <= std_logic'('0');
    elsif clk'event and clk = '1' then
      W_estatus_reg <= W_estatus_reg_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_bstatus_reg <= std_logic'('0');
    elsif clk'event and clk = '1' then
      W_bstatus_reg <= W_bstatus_reg_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_ienable_reg <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      W_ienable_reg <= W_ienable_reg_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_ipending_reg <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      W_ipending_reg <= W_ipending_reg_nxt;
    end if;

  end process;

  W_wr_data_non_zero <= A_WE_StdLogicVector((std_logic'(R_ctrl_br_cmp) = '1'), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(W_cmp_result))), A_WE_StdLogicVector((std_logic'(R_ctrl_rdctl_inst) = '1'), W_control_rd_data, W_alu_result(31 DOWNTO 0)));
  W_wr_data <= W_wr_data_non_zero;
  W_br_taken <= R_ctrl_br AND W_cmp_result;
  W_mem_baddr <= W_alu_result(26 DOWNTO 0);
  W_status_reg <= W_status_reg_pie;
  E_wrctl_status <= R_ctrl_wrctl_inst AND to_std_logic(((D_iw_control_regnum = std_logic_vector'("000"))));
  E_wrctl_estatus <= R_ctrl_wrctl_inst AND to_std_logic(((D_iw_control_regnum = std_logic_vector'("001"))));
  E_wrctl_bstatus <= R_ctrl_wrctl_inst AND to_std_logic(((D_iw_control_regnum = std_logic_vector'("010"))));
  E_wrctl_ienable <= R_ctrl_wrctl_inst AND to_std_logic(((D_iw_control_regnum = std_logic_vector'("011"))));
  W_status_reg_pie_inst_nxt <= A_WE_StdLogic((std_logic'((((R_ctrl_exception OR R_ctrl_break) OR R_ctrl_crst))) = '1'), std_logic'('0'), A_WE_StdLogic((std_logic'((D_op_eret)) = '1'), W_estatus_reg, A_WE_StdLogic((std_logic'((D_op_bret)) = '1'), W_bstatus_reg, A_WE_StdLogic((std_logic'((E_wrctl_status)) = '1'), E_src1(0), W_status_reg_pie))));
  W_status_reg_pie_nxt <= A_WE_StdLogic((std_logic'(E_valid) = '1'), W_status_reg_pie_inst_nxt, W_status_reg_pie);
  W_estatus_reg_inst_nxt <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'((R_ctrl_crst)) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(A_WE_StdLogic((std_logic'((R_ctrl_exception)) = '1'), W_status_reg, A_WE_StdLogic((std_logic'((E_wrctl_estatus)) = '1'), E_src1(0), W_estatus_reg)))))));
  W_estatus_reg_nxt <= A_WE_StdLogic((std_logic'(E_valid) = '1'), W_estatus_reg_inst_nxt, W_estatus_reg);
  W_bstatus_reg_inst_nxt <= A_WE_StdLogic((std_logic'((R_ctrl_break)) = '1'), W_status_reg, A_WE_StdLogic((std_logic'((E_wrctl_bstatus)) = '1'), E_src1(0), W_bstatus_reg));
  W_bstatus_reg_nxt <= A_WE_StdLogic((std_logic'(E_valid) = '1'), W_bstatus_reg_inst_nxt, W_bstatus_reg);
  W_ienable_reg_nxt <= (A_WE_StdLogicVector((std_logic'(((E_wrctl_ienable AND E_valid))) = '1'), E_src1(31 DOWNTO 0), W_ienable_reg)) AND std_logic_vector'("00000000000000000000000000000011");
  W_ipending_reg_nxt <= ((iactive AND W_ienable_reg) AND oci_ienable) AND std_logic_vector'("00000000000000000000000000000011");
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      hbreak_enabled <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(E_valid) = '1' then 
        hbreak_enabled <= A_WE_StdLogic((std_logic'(R_ctrl_break) = '1'), std_logic'('0'), A_WE_StdLogic((std_logic'(D_op_bret) = '1'), std_logic'('1'), hbreak_enabled));
      end if;
    end if;

  end process;

  --the_cpu_0_nios2_oci, which is an e_instance
  the_cpu_0_nios2_oci : cpu_0_nios2_oci
    port map(
      jtag_debug_module_debugaccess_to_roms => internal_jtag_debug_module_debugaccess_to_roms,
      oci_hbreak_req => oci_hbreak_req,
      oci_ienable => oci_ienable,
      oci_single_step_mode => oci_single_step_mode,
      readdata => internal_jtag_debug_module_readdata,
      resetrequest => internal_jtag_debug_module_resetrequest,
      D_valid => D_valid,
      E_st_data => E_st_data,
      E_valid => E_valid,
      F_pc => F_pc,
      address => jtag_debug_module_address,
      av_ld_data_aligned_filtered => av_ld_data_aligned_filtered,
      begintransfer => jtag_debug_module_begintransfer,
      byteenable => jtag_debug_module_byteenable,
      chipselect => jtag_debug_module_select,
      clk => jtag_debug_module_clk,
      d_address => internal_d_address,
      d_read => internal_d_read,
      d_waitrequest => d_waitrequest,
      d_write => internal_d_write,
      debugaccess => jtag_debug_module_debugaccess,
      hbreak_enabled => hbreak_enabled,
      reset => jtag_debug_module_reset,
      reset_n => reset_n,
      test_ending => test_ending,
      test_has_ended => test_has_ended,
      write => jtag_debug_module_write,
      writedata => jtag_debug_module_writedata
    );


  --jtag_debug_module, which is an e_avalon_slave
  jtag_debug_module_clk <= clk;
  jtag_debug_module_reset <= NOT reset_n;
  D_ctrl_custom <= std_logic'('0');
  R_ctrl_custom_nxt <= D_ctrl_custom;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_custom <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_custom <= R_ctrl_custom_nxt;
      end if;
    end if;

  end process;

  D_ctrl_custom_multi <= std_logic'('0');
  R_ctrl_custom_multi_nxt <= D_ctrl_custom_multi;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_custom_multi <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_custom_multi <= R_ctrl_custom_multi_nxt;
      end if;
    end if;

  end process;

  D_ctrl_jmp_indirect <= ((((((D_op_eret OR D_op_bret) OR D_op_rsvx17) OR D_op_rsvx25) OR D_op_ret) OR D_op_jmp) OR D_op_rsvx21) OR D_op_callr;
  R_ctrl_jmp_indirect_nxt <= D_ctrl_jmp_indirect;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_jmp_indirect <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_jmp_indirect <= R_ctrl_jmp_indirect_nxt;
      end if;
    end if;

  end process;

  D_ctrl_jmp_direct <= D_op_call OR D_op_jmpi;
  R_ctrl_jmp_direct_nxt <= D_ctrl_jmp_direct;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_jmp_direct <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_jmp_direct <= R_ctrl_jmp_direct_nxt;
      end if;
    end if;

  end process;

  D_ctrl_implicit_dst_retaddr <= D_op_call OR D_op_rsv02;
  R_ctrl_implicit_dst_retaddr_nxt <= D_ctrl_implicit_dst_retaddr;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_implicit_dst_retaddr <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_implicit_dst_retaddr <= R_ctrl_implicit_dst_retaddr_nxt;
      end if;
    end if;

  end process;

  D_ctrl_implicit_dst_eretaddr <= (((((D_op_div OR D_op_divu) OR D_op_mul) OR D_op_muli) OR D_op_mulxss) OR D_op_mulxsu) OR D_op_mulxuu;
  R_ctrl_implicit_dst_eretaddr_nxt <= D_ctrl_implicit_dst_eretaddr;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_implicit_dst_eretaddr <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_implicit_dst_eretaddr <= R_ctrl_implicit_dst_eretaddr_nxt;
      end if;
    end if;

  end process;

  D_ctrl_exception <= (((((((((D_op_trap OR D_op_rsvx44) OR D_op_div) OR D_op_divu) OR D_op_mul) OR D_op_muli) OR D_op_mulxss) OR D_op_mulxsu) OR D_op_mulxuu) OR D_op_intr) OR D_op_rsvx60;
  R_ctrl_exception_nxt <= D_ctrl_exception;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_exception <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_exception <= R_ctrl_exception_nxt;
      end if;
    end if;

  end process;

  D_ctrl_break <= D_op_break OR D_op_hbreak;
  R_ctrl_break_nxt <= D_ctrl_break;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_break <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_break <= R_ctrl_break_nxt;
      end if;
    end if;

  end process;

  D_ctrl_crst <= D_op_crst OR D_op_rsvx63;
  R_ctrl_crst_nxt <= D_ctrl_crst;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_crst <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_crst <= R_ctrl_crst_nxt;
      end if;
    end if;

  end process;

  D_ctrl_uncond_cti_non_br <= ((((((((D_op_call OR D_op_jmpi) OR D_op_eret) OR D_op_bret) OR D_op_rsvx17) OR D_op_rsvx25) OR D_op_ret) OR D_op_jmp) OR D_op_rsvx21) OR D_op_callr;
  R_ctrl_uncond_cti_non_br_nxt <= D_ctrl_uncond_cti_non_br;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_uncond_cti_non_br <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_uncond_cti_non_br <= R_ctrl_uncond_cti_non_br_nxt;
      end if;
    end if;

  end process;

  D_ctrl_retaddr <= (((((((((((((((D_op_call OR D_op_rsv02) OR D_op_nextpc) OR D_op_callr) OR D_op_trap) OR D_op_rsvx44) OR D_op_div) OR D_op_divu) OR D_op_mul) OR D_op_muli) OR D_op_mulxss) OR D_op_mulxsu) OR D_op_mulxuu) OR D_op_intr) OR D_op_rsvx60) OR D_op_break) OR D_op_hbreak;
  R_ctrl_retaddr_nxt <= D_ctrl_retaddr;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_retaddr <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_retaddr <= R_ctrl_retaddr_nxt;
      end if;
    end if;

  end process;

  D_ctrl_shift_logical <= ((D_op_slli OR D_op_sll) OR D_op_srli) OR D_op_srl;
  R_ctrl_shift_logical_nxt <= D_ctrl_shift_logical;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_shift_logical <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_shift_logical <= R_ctrl_shift_logical_nxt;
      end if;
    end if;

  end process;

  D_ctrl_shift_right_arith <= D_op_srai OR D_op_sra;
  R_ctrl_shift_right_arith_nxt <= D_ctrl_shift_right_arith;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_shift_right_arith <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_shift_right_arith <= R_ctrl_shift_right_arith_nxt;
      end if;
    end if;

  end process;

  D_ctrl_rot_right <= ((D_op_rsvx10 OR D_op_ror) OR D_op_rsvx42) OR D_op_rsvx43;
  R_ctrl_rot_right_nxt <= D_ctrl_rot_right;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_rot_right <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_rot_right <= R_ctrl_rot_right_nxt;
      end if;
    end if;

  end process;

  D_ctrl_shift_rot_right <= ((((((D_op_srli OR D_op_srl) OR D_op_srai) OR D_op_sra) OR D_op_rsvx10) OR D_op_ror) OR D_op_rsvx42) OR D_op_rsvx43;
  R_ctrl_shift_rot_right_nxt <= D_ctrl_shift_rot_right;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_shift_rot_right <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_shift_rot_right <= R_ctrl_shift_rot_right_nxt;
      end if;
    end if;

  end process;

  D_ctrl_shift_rot <= ((((((((((((((D_op_slli OR D_op_rsvx50) OR D_op_sll) OR D_op_rsvx51) OR D_op_roli) OR D_op_rsvx34) OR D_op_rol) OR D_op_rsvx35) OR D_op_srli) OR D_op_srl) OR D_op_srai) OR D_op_sra) OR D_op_rsvx10) OR D_op_ror) OR D_op_rsvx42) OR D_op_rsvx43;
  R_ctrl_shift_rot_nxt <= D_ctrl_shift_rot;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_shift_rot <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_shift_rot <= R_ctrl_shift_rot_nxt;
      end if;
    end if;

  end process;

  D_ctrl_logic <= ((((((((D_op_and OR D_op_or) OR D_op_xor) OR D_op_nor) OR D_op_andhi) OR D_op_orhi) OR D_op_xorhi) OR D_op_andi) OR D_op_ori) OR D_op_xori;
  R_ctrl_logic_nxt <= D_ctrl_logic;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_logic <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_logic <= R_ctrl_logic_nxt;
      end if;
    end if;

  end process;

  D_ctrl_hi_imm16 <= (D_op_andhi OR D_op_orhi) OR D_op_xorhi;
  R_ctrl_hi_imm16_nxt <= D_ctrl_hi_imm16;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_hi_imm16 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_hi_imm16 <= R_ctrl_hi_imm16_nxt;
      end if;
    end if;

  end process;

  D_ctrl_unsigned_lo_imm16 <= (((((((((((D_op_cmpgeui OR D_op_cmpltui) OR D_op_andi) OR D_op_ori) OR D_op_xori) OR D_op_roli) OR D_op_rsvx10) OR D_op_slli) OR D_op_srli) OR D_op_rsvx34) OR D_op_rsvx42) OR D_op_rsvx50) OR D_op_srai;
  R_ctrl_unsigned_lo_imm16_nxt <= D_ctrl_unsigned_lo_imm16;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_unsigned_lo_imm16 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_unsigned_lo_imm16 <= R_ctrl_unsigned_lo_imm16_nxt;
      end if;
    end if;

  end process;

  D_ctrl_br_uncond <= D_op_br OR D_op_rsv02;
  R_ctrl_br_uncond_nxt <= D_ctrl_br_uncond;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_br_uncond <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_br_uncond <= R_ctrl_br_uncond_nxt;
      end if;
    end if;

  end process;

  D_ctrl_br <= ((((((D_op_br OR D_op_bge) OR D_op_blt) OR D_op_bne) OR D_op_beq) OR D_op_bgeu) OR D_op_bltu) OR D_op_rsv62;
  R_ctrl_br_nxt <= D_ctrl_br;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_br <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_br <= R_ctrl_br_nxt;
      end if;
    end if;

  end process;

  D_ctrl_alu_subtract <= ((((((((((((((D_op_sub OR D_op_rsvx25) OR D_op_cmplti) OR D_op_cmpltui) OR D_op_cmplt) OR D_op_cmpltu) OR D_op_blt) OR D_op_bltu) OR D_op_cmpgei) OR D_op_cmpgeui) OR D_op_cmpge) OR D_op_cmpgeu) OR D_op_bge) OR D_op_rsv10) OR D_op_bgeu) OR D_op_rsv42;
  R_ctrl_alu_subtract_nxt <= D_ctrl_alu_subtract;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_alu_subtract <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_alu_subtract <= R_ctrl_alu_subtract_nxt;
      end if;
    end if;

  end process;

  D_ctrl_alu_signed_comparison <= ((((D_op_cmpge OR D_op_cmpgei) OR D_op_cmplt) OR D_op_cmplti) OR D_op_bge) OR D_op_blt;
  R_ctrl_alu_signed_comparison_nxt <= D_ctrl_alu_signed_comparison;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_alu_signed_comparison <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_alu_signed_comparison <= R_ctrl_alu_signed_comparison_nxt;
      end if;
    end if;

  end process;

  D_ctrl_br_cmp <= ((((((((((((((((((((D_op_br OR D_op_bge) OR D_op_blt) OR D_op_bne) OR D_op_beq) OR D_op_bgeu) OR D_op_bltu) OR D_op_rsv62) OR D_op_cmpgei) OR D_op_cmplti) OR D_op_cmpnei) OR D_op_cmpgeui) OR D_op_cmpltui) OR D_op_cmpeqi) OR D_op_rsvx00) OR D_op_cmpge) OR D_op_cmplt) OR D_op_cmpne) OR D_op_cmpgeu) OR D_op_cmpltu) OR D_op_cmpeq) OR D_op_rsvx56;
  R_ctrl_br_cmp_nxt <= D_ctrl_br_cmp;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_br_cmp <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_br_cmp <= R_ctrl_br_cmp_nxt;
      end if;
    end if;

  end process;

  D_ctrl_ld_signed <= ((((((D_op_ldb OR D_op_ldh) OR D_op_ldl) OR D_op_ldw) OR D_op_ldbio) OR D_op_ldhio) OR D_op_ldwio) OR D_op_rsv63;
  R_ctrl_ld_signed_nxt <= D_ctrl_ld_signed;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_ld_signed <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_ld_signed <= R_ctrl_ld_signed_nxt;
      end if;
    end if;

  end process;

  D_ctrl_ld <= ((((((((((D_op_ldb OR D_op_ldh) OR D_op_ldl) OR D_op_ldw) OR D_op_ldbio) OR D_op_ldhio) OR D_op_ldwio) OR D_op_rsv63) OR D_op_ldbu) OR D_op_ldhu) OR D_op_ldbuio) OR D_op_ldhuio;
  R_ctrl_ld_nxt <= D_ctrl_ld;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_ld <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_ld <= R_ctrl_ld_nxt;
      end if;
    end if;

  end process;

  D_ctrl_ld_non_io <= ((((D_op_ldbu OR D_op_ldhu) OR D_op_ldb) OR D_op_ldh) OR D_op_ldw) OR D_op_ldl;
  R_ctrl_ld_non_io_nxt <= D_ctrl_ld_non_io;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_ld_non_io <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_ld_non_io <= R_ctrl_ld_non_io_nxt;
      end if;
    end if;

  end process;

  D_ctrl_st <= ((((((D_op_stb OR D_op_sth) OR D_op_stw) OR D_op_stc) OR D_op_stbio) OR D_op_sthio) OR D_op_stwio) OR D_op_rsv61;
  R_ctrl_st_nxt <= D_ctrl_st;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_st <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_st <= R_ctrl_st_nxt;
      end if;
    end if;

  end process;

  D_ctrl_ld_io <= ((((D_op_ldbuio OR D_op_ldhuio) OR D_op_ldbio) OR D_op_ldhio) OR D_op_ldwio) OR D_op_rsv63;
  R_ctrl_ld_io_nxt <= D_ctrl_ld_io;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_ld_io <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_ld_io <= R_ctrl_ld_io_nxt;
      end if;
    end if;

  end process;

  D_ctrl_b_is_dst <= (((((((((((((((((((((((((((((((((((((D_op_addi OR D_op_andhi) OR D_op_orhi) OR D_op_xorhi) OR D_op_andi) OR D_op_ori) OR D_op_xori) OR D_op_call) OR D_op_rdprs) OR D_op_cmpgei) OR D_op_cmplti) OR D_op_cmpnei) OR D_op_cmpgeui) OR D_op_cmpltui) OR D_op_cmpeqi) OR D_op_jmpi) OR D_op_rsv09) OR D_op_rsv17) OR D_op_rsv25) OR D_op_rsv33) OR D_op_rsv41) OR D_op_rsv49) OR D_op_rsv57) OR D_op_ldb) OR D_op_ldh) OR D_op_ldl) OR D_op_ldw) OR D_op_ldbio) OR D_op_ldhio) OR D_op_ldwio) OR D_op_rsv63) OR D_op_ldbu) OR D_op_ldhu) OR D_op_ldbuio) OR D_op_ldhuio) OR D_op_initd) OR D_op_initda) OR D_op_flushd) OR D_op_flushda;
  R_ctrl_b_is_dst_nxt <= D_ctrl_b_is_dst;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_b_is_dst <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_b_is_dst <= R_ctrl_b_is_dst_nxt;
      end if;
    end if;

  end process;

  D_ctrl_ignore_dst <= ((((((((((((((((((((((D_op_br OR D_op_bge) OR D_op_blt) OR D_op_bne) OR D_op_beq) OR D_op_bgeu) OR D_op_bltu) OR D_op_rsv62) OR D_op_stb) OR D_op_sth) OR D_op_stw) OR D_op_stc) OR D_op_stbio) OR D_op_sthio) OR D_op_stwio) OR D_op_rsv61) OR D_op_jmpi) OR D_op_rsv09) OR D_op_rsv17) OR D_op_rsv25) OR D_op_rsv33) OR D_op_rsv41) OR D_op_rsv49) OR D_op_rsv57;
  R_ctrl_ignore_dst_nxt <= D_ctrl_ignore_dst;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_ignore_dst <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_ignore_dst <= R_ctrl_ignore_dst_nxt;
      end if;
    end if;

  end process;

  D_ctrl_src2_choose_imm <= (((((((((((((((((((((((((((((((((((((((((((((((((((((D_op_addi OR D_op_andhi) OR D_op_orhi) OR D_op_xorhi) OR D_op_andi) OR D_op_ori) OR D_op_xori) OR D_op_call) OR D_op_rdprs) OR D_op_cmpgei) OR D_op_cmplti) OR D_op_cmpnei) OR D_op_cmpgeui) OR D_op_cmpltui) OR D_op_cmpeqi) OR D_op_jmpi) OR D_op_rsv09) OR D_op_rsv17) OR D_op_rsv25) OR D_op_rsv33) OR D_op_rsv41) OR D_op_rsv49) OR D_op_rsv57) OR D_op_ldb) OR D_op_ldh) OR D_op_ldl) OR D_op_ldw) OR D_op_ldbio) OR D_op_ldhio) OR D_op_ldwio) OR D_op_rsv63) OR D_op_ldbu) OR D_op_ldhu) OR D_op_ldbuio) OR D_op_ldhuio) OR D_op_initd) OR D_op_initda) OR D_op_flushd) OR D_op_flushda) OR D_op_stb) OR D_op_sth) OR D_op_stw) OR D_op_stc) OR D_op_stbio) OR D_op_sthio) OR D_op_stwio) OR D_op_rsv61) OR D_op_roli) OR D_op_rsvx10) OR D_op_slli) OR D_op_srli) OR D_op_rsvx34) OR D_op_rsvx42) OR D_op_rsvx50) OR D_op_srai;
  R_ctrl_src2_choose_imm_nxt <= D_ctrl_src2_choose_imm;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_src2_choose_imm <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_src2_choose_imm <= R_ctrl_src2_choose_imm_nxt;
      end if;
    end if;

  end process;

  D_ctrl_wrctl_inst <= D_op_wrctl;
  R_ctrl_wrctl_inst_nxt <= D_ctrl_wrctl_inst;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_wrctl_inst <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_wrctl_inst <= R_ctrl_wrctl_inst_nxt;
      end if;
    end if;

  end process;

  D_ctrl_rdctl_inst <= D_op_rdctl;
  R_ctrl_rdctl_inst_nxt <= D_ctrl_rdctl_inst;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_rdctl_inst <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_rdctl_inst <= R_ctrl_rdctl_inst_nxt;
      end if;
    end if;

  end process;

  D_ctrl_force_src2_zero <= ((((((((((((((((D_op_call OR D_op_rsv02) OR D_op_nextpc) OR D_op_callr) OR D_op_trap) OR D_op_rsvx44) OR D_op_intr) OR D_op_rsvx60) OR D_op_break) OR D_op_hbreak) OR D_op_eret) OR D_op_bret) OR D_op_rsvx17) OR D_op_rsvx25) OR D_op_ret) OR D_op_jmp) OR D_op_rsvx21) OR D_op_jmpi;
  R_ctrl_force_src2_zero_nxt <= D_ctrl_force_src2_zero;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_force_src2_zero <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_force_src2_zero <= R_ctrl_force_src2_zero_nxt;
      end if;
    end if;

  end process;

  D_ctrl_alu_force_xor <= ((((((((((((((((D_op_cmpgei OR D_op_cmpgeui) OR D_op_cmpeqi) OR D_op_cmpge) OR D_op_cmpgeu) OR D_op_cmpeq) OR D_op_cmpnei) OR D_op_cmpne) OR D_op_bge) OR D_op_rsv10) OR D_op_bgeu) OR D_op_rsv42) OR D_op_beq) OR D_op_rsv34) OR D_op_bne) OR D_op_rsv62) OR D_op_br) OR D_op_rsv02;
  R_ctrl_alu_force_xor_nxt <= D_ctrl_alu_force_xor;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_alu_force_xor <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_alu_force_xor <= R_ctrl_alu_force_xor_nxt;
      end if;
    end if;

  end process;

  --data_master, which is an e_avalon_master
  --instruction_master, which is an e_avalon_master
  --vhdl renameroo for output signals
  d_address <= internal_d_address;
  --vhdl renameroo for output signals
  d_byteenable <= internal_d_byteenable;
  --vhdl renameroo for output signals
  d_read <= internal_d_read;
  --vhdl renameroo for output signals
  d_write <= internal_d_write;
  --vhdl renameroo for output signals
  i_address <= internal_i_address;
  --vhdl renameroo for output signals
  i_read <= internal_i_read;
  --vhdl renameroo for output signals
  jtag_debug_module_debugaccess_to_roms <= internal_jtag_debug_module_debugaccess_to_roms;
  --vhdl renameroo for output signals
  jtag_debug_module_readdata <= internal_jtag_debug_module_readdata;
  --vhdl renameroo for output signals
  jtag_debug_module_resetrequest <= internal_jtag_debug_module_resetrequest;
--synthesis translate_off
    F_inst <= A_WE_StdLogicVector((std_logic'((F_op_call)) = '1'), std_logic_vector'("00100000001000000010000001100011011000010110110001101100"), A_WE_StdLogicVector((std_logic'((F_op_jmpi)) = '1'), std_logic_vector'("00100000001000000010000001101010011011010111000001101001"), A_WE_StdLogicVector((std_logic'((F_op_ldbu)) = '1'), std_logic_vector'("00100000001000000010000001101100011001000110001001110101"), A_WE_StdLogicVector((std_logic'((F_op_addi)) = '1'), std_logic_vector'("00100000001000000010000001100001011001000110010001101001"), A_WE_StdLogicVector((std_logic'((F_op_stb)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111010001100010"), A_WE_StdLogicVector((std_logic'((F_op_br)) = '1'), std_logic_vector'("00100000001000000010000000100000001000000110001001110010"), A_WE_StdLogicVector((std_logic'((F_op_ldb)) = '1'), std_logic_vector'("00100000001000000010000000100000011011000110010001100010"), A_WE_StdLogicVector((std_logic'((F_op_cmpgei)) = '1'), std_logic_vector'("00100000011000110110110101110000011001110110010101101001"), A_WE_StdLogicVector((std_logic'((F_op_ldhu)) = '1'), std_logic_vector'("00100000001000000010000001101100011001000110100001110101"), A_WE_StdLogicVector((std_logic'((F_op_andi)) = '1'), std_logic_vector'("00100000001000000010000001100001011011100110010001101001"), A_WE_StdLogicVector((std_logic'((F_op_sth)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111010001101000"), A_WE_StdLogicVector((std_logic'((F_op_bge)) = '1'), std_logic_vector'("00100000001000000010000000100000011000100110011101100101"), A_WE_StdLogicVector((std_logic'((F_op_ldh)) = '1'), std_logic_vector'("00100000001000000010000000100000011011000110010001101000"), A_WE_StdLogicVector((std_logic'((F_op_cmplti)) = '1'), std_logic_vector'("00100000011000110110110101110000011011000111010001101001"), A_WE_StdLogicVector((std_logic'((F_op_initda)) = '1'), std_logic_vector'("00100000011010010110111001101001011101000110010001100001"), A_WE_StdLogicVector((std_logic'((F_op_ori)) = '1'), std_logic_vector'("00100000001000000010000000100000011011110111001001101001"), A_WE_StdLogicVector((std_logic'((F_op_stw)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111010001110111"), A_WE_StdLogicVector((std_logic'((F_op_blt)) = '1'), std_logic_vector'("00100000001000000010000000100000011000100110110001110100"), A_WE_StdLogicVector((std_logic'((F_op_ldw)) = '1'), std_logic_vector'("00100000001000000010000000100000011011000110010001110111"), A_WE_StdLogicVector((std_logic'((F_op_cmpnei)) = '1'), std_logic_vector'("00100000011000110110110101110000011011100110010101101001"), A_WE_StdLogicVector((std_logic'((F_op_flushda)) = '1'), std_logic_vector'("01100110011011000111010101110011011010000110010001100001"), A_WE_StdLogicVector((std_logic'((F_op_xori)) = '1'), std_logic_vector'("00100000001000000010000001111000011011110111001001101001"), A_WE_StdLogicVector((std_logic'((F_op_bne)) = '1'), std_logic_vector'("00100000001000000010000000100000011000100110111001100101"), A_WE_StdLogicVector((std_logic'((F_op_cmpeqi)) = '1'), std_logic_vector'("00100000011000110110110101110000011001010111000101101001"), A_WE_StdLogicVector((std_logic'((F_op_ldbuio)) = '1'), std_logic_vector'("00100000011011000110010001100010011101010110100101101111"), A_WE_StdLogicVector((std_logic'((F_op_muli)) = '1'), std_logic_vector'("00100000001000000010000001101101011101010110110001101001"), A_WE_StdLogicVector((std_logic'((F_op_stbio)) = '1'), std_logic_vector'("00100000001000000111001101110100011000100110100101101111"), A_WE_StdLogicVector((std_logic'((F_op_beq)) = '1'), std_logic_vector'("00100000001000000010000000100000011000100110010101110001"), A_WE_StdLogicVector((std_logic'((F_op_ldbio)) = '1'), std_logic_vector'("00100000001000000110110001100100011000100110100101101111"), A_WE_StdLogicVector((std_logic'((F_op_cmpgeui)) = '1'), std_logic_vector'("01100011011011010111000001100111011001010111010101101001"), A_WE_StdLogicVector((std_logic'((F_op_ldhuio)) = '1'), std_logic_vector'("00100000011011000110010001101000011101010110100101101111"), A_WE_StdLogicVector((std_logic'((F_op_andhi)) = '1'), std_logic_vector'("00100000001000000110000101101110011001000110100001101001"), A_WE_StdLogicVector((std_logic'((F_op_sthio)) = '1'), std_logic_vector'("00100000001000000111001101110100011010000110100101101111"), A_WE_StdLogicVector((std_logic'((F_op_bgeu)) = '1'), std_logic_vector'("00100000001000000010000001100010011001110110010101110101"), A_WE_StdLogicVector((std_logic'((F_op_ldhio)) = '1'), std_logic_vector'("00100000001000000110110001100100011010000110100101101111"), A_WE_StdLogicVector((std_logic'((F_op_cmpltui)) = '1'), std_logic_vector'("01100011011011010111000001101100011101000111010101101001"), A_WE_StdLogicVector((std_logic'((F_op_initd)) = '1'), std_logic_vector'("00100000001000000110100101101110011010010111010001100100"), A_WE_StdLogicVector((std_logic'((F_op_orhi)) = '1'), std_logic_vector'("00100000001000000010000001101111011100100110100001101001"), A_WE_StdLogicVector((std_logic'((F_op_stwio)) = '1'), std_logic_vector'("00100000001000000111001101110100011101110110100101101111"), A_WE_StdLogicVector((std_logic'((F_op_bltu)) = '1'), std_logic_vector'("00100000001000000010000001100010011011000111010001110101"), A_WE_StdLogicVector((std_logic'((F_op_ldwio)) = '1'), std_logic_vector'("00100000001000000110110001100100011101110110100101101111"), A_WE_StdLogicVector((std_logic'((F_op_flushd)) = '1'), std_logic_vector'("00100000011001100110110001110101011100110110100001100100"), A_WE_StdLogicVector((std_logic'((F_op_xorhi)) = '1'), std_logic_vector'("00100000001000000111100001101111011100100110100001101001"), A_WE_StdLogicVector((std_logic'((F_op_eret)) = '1'), std_logic_vector'("00100000001000000010000001100101011100100110010101110100"), A_WE_StdLogicVector((std_logic'((F_op_roli)) = '1'), std_logic_vector'("00100000001000000010000001110010011011110110110001101001"), A_WE_StdLogicVector((std_logic'((F_op_rol)) = '1'), std_logic_vector'("00100000001000000010000000100000011100100110111101101100"), A_WE_StdLogicVector((std_logic'((F_op_flushp)) = '1'), std_logic_vector'("00100000011001100110110001110101011100110110100001110000"), A_WE_StdLogicVector((std_logic'((F_op_ret)) = '1'), std_logic_vector'("00100000001000000010000000100000011100100110010101110100"), A_WE_StdLogicVector((std_logic'((F_op_nor)) = '1'), std_logic_vector'("00100000001000000010000000100000011011100110111101110010"), A_WE_StdLogicVector((std_logic'((F_op_mulxuu)) = '1'), std_logic_vector'("00100000011011010111010101101100011110000111010101110101"), A_WE_StdLogicVector((std_logic'((F_op_cmpge)) = '1'), std_logic_vector'("00100000001000000110001101101101011100000110011101100101"), A_WE_StdLogicVector((std_logic'((F_op_bret)) = '1'), std_logic_vector'("00100000001000000010000001100010011100100110010101110100"), A_WE_StdLogicVector((std_logic'((F_op_ror)) = '1'), std_logic_vector'("00100000001000000010000000100000011100100110111101110010"), A_WE_StdLogicVector((std_logic'((F_op_flushi)) = '1'), std_logic_vector'("00100000011001100110110001110101011100110110100001101001"), A_WE_StdLogicVector((std_logic'((F_op_jmp)) = '1'), std_logic_vector'("00100000001000000010000000100000011010100110110101110000"), A_WE_StdLogicVector((std_logic'((F_op_and)) = '1'), std_logic_vector'("00100000001000000010000000100000011000010110111001100100"), A_WE_StdLogicVector((std_logic'((F_op_cmplt)) = '1'), std_logic_vector'("00100000001000000110001101101101011100000110110001110100"), A_WE_StdLogicVector((std_logic'((F_op_slli)) = '1'), std_logic_vector'("00100000001000000010000001110011011011000110110001101001"), A_WE_StdLogicVector((std_logic'((F_op_sll)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110110110001101100"), A_WE_StdLogicVector((std_logic'((F_op_or)) = '1'), std_logic_vector'("00100000001000000010000000100000001000000110111101110010"), A_WE_StdLogicVector((std_logic'((F_op_mulxsu)) = '1'), std_logic_vector'("00100000011011010111010101101100011110000111001101110101"), A_WE_StdLogicVector((std_logic'((F_op_cmpne)) = '1'), std_logic_vector'("00100000001000000110001101101101011100000110111001100101"), A_WE_StdLogicVector((std_logic'((F_op_srli)) = '1'), std_logic_vector'("00100000001000000010000001110011011100100110110001101001"), A_WE_StdLogicVector((std_logic'((F_op_srl)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111001001101100"), A_WE_StdLogicVector((std_logic'((F_op_nextpc)) = '1'), std_logic_vector'("00100000011011100110010101111000011101000111000001100011"), A_WE_StdLogicVector((std_logic'((F_op_callr)) = '1'), std_logic_vector'("00100000001000000110001101100001011011000110110001110010"), A_WE_StdLogicVector((std_logic'((F_op_xor)) = '1'), std_logic_vector'("00100000001000000010000000100000011110000110111101110010"), A_WE_StdLogicVector((std_logic'((F_op_mulxss)) = '1'), std_logic_vector'("00100000011011010111010101101100011110000111001101110011"), A_WE_StdLogicVector((std_logic'((F_op_cmpeq)) = '1'), std_logic_vector'("00100000001000000110001101101101011100000110010101110001"), A_WE_StdLogicVector((std_logic'((F_op_divu)) = '1'), std_logic_vector'("00100000001000000010000001100100011010010111011001110101"), A_WE_StdLogicVector((std_logic'((F_op_div)) = '1'), std_logic_vector'("00100000001000000010000000100000011001000110100101110110"), A_WE_StdLogicVector((std_logic'((F_op_rdctl)) = '1'), std_logic_vector'("00100000001000000111001001100100011000110111010001101100"), A_WE_StdLogicVector((std_logic'((F_op_mul)) = '1'), std_logic_vector'("00100000001000000010000000100000011011010111010101101100"), A_WE_StdLogicVector((std_logic'((F_op_cmpgeu)) = '1'), std_logic_vector'("00100000011000110110110101110000011001110110010101110101"), A_WE_StdLogicVector((std_logic'((F_op_initi)) = '1'), std_logic_vector'("00100000001000000110100101101110011010010111010001101001"), A_WE_StdLogicVector((std_logic'((F_op_trap)) = '1'), std_logic_vector'("00100000001000000010000001110100011100100110000101110000"), A_WE_StdLogicVector((std_logic'((F_op_wrctl)) = '1'), std_logic_vector'("00100000001000000111011101110010011000110111010001101100"), A_WE_StdLogicVector((std_logic'((F_op_cmpltu)) = '1'), std_logic_vector'("00100000011000110110110101110000011011000111010001110101"), A_WE_StdLogicVector((std_logic'((F_op_add)) = '1'), std_logic_vector'("00100000001000000010000000100000011000010110010001100100"), A_WE_StdLogicVector((std_logic'((F_op_break)) = '1'), std_logic_vector'("00100000001000000110001001110010011001010110000101101011"), A_WE_StdLogicVector((std_logic'((F_op_hbreak)) = '1'), std_logic_vector'("00100000011010000110001001110010011001010110000101101011"), A_WE_StdLogicVector((std_logic'((F_op_sync)) = '1'), std_logic_vector'("00100000001000000010000001110011011110010110111001100011"), A_WE_StdLogicVector((std_logic'((F_op_sub)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111010101100010"), A_WE_StdLogicVector((std_logic'((F_op_srai)) = '1'), std_logic_vector'("00100000001000000010000001110011011100100110000101101001"), A_WE_StdLogicVector((std_logic'((F_op_sra)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111001001100001"), A_WE_StdLogicVector((std_logic'((F_op_intr)) = '1'), std_logic_vector'("00100000001000000010000001101001011011100111010001110010"), std_logic_vector'("00100000001000000010000000100000010000100100000101000100")))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
    D_inst <= A_WE_StdLogicVector((std_logic'((D_op_call)) = '1'), std_logic_vector'("00100000001000000010000001100011011000010110110001101100"), A_WE_StdLogicVector((std_logic'((D_op_jmpi)) = '1'), std_logic_vector'("00100000001000000010000001101010011011010111000001101001"), A_WE_StdLogicVector((std_logic'((D_op_ldbu)) = '1'), std_logic_vector'("00100000001000000010000001101100011001000110001001110101"), A_WE_StdLogicVector((std_logic'((D_op_addi)) = '1'), std_logic_vector'("00100000001000000010000001100001011001000110010001101001"), A_WE_StdLogicVector((std_logic'((D_op_stb)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111010001100010"), A_WE_StdLogicVector((std_logic'((D_op_br)) = '1'), std_logic_vector'("00100000001000000010000000100000001000000110001001110010"), A_WE_StdLogicVector((std_logic'((D_op_ldb)) = '1'), std_logic_vector'("00100000001000000010000000100000011011000110010001100010"), A_WE_StdLogicVector((std_logic'((D_op_cmpgei)) = '1'), std_logic_vector'("00100000011000110110110101110000011001110110010101101001"), A_WE_StdLogicVector((std_logic'((D_op_ldhu)) = '1'), std_logic_vector'("00100000001000000010000001101100011001000110100001110101"), A_WE_StdLogicVector((std_logic'((D_op_andi)) = '1'), std_logic_vector'("00100000001000000010000001100001011011100110010001101001"), A_WE_StdLogicVector((std_logic'((D_op_sth)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111010001101000"), A_WE_StdLogicVector((std_logic'((D_op_bge)) = '1'), std_logic_vector'("00100000001000000010000000100000011000100110011101100101"), A_WE_StdLogicVector((std_logic'((D_op_ldh)) = '1'), std_logic_vector'("00100000001000000010000000100000011011000110010001101000"), A_WE_StdLogicVector((std_logic'((D_op_cmplti)) = '1'), std_logic_vector'("00100000011000110110110101110000011011000111010001101001"), A_WE_StdLogicVector((std_logic'((D_op_initda)) = '1'), std_logic_vector'("00100000011010010110111001101001011101000110010001100001"), A_WE_StdLogicVector((std_logic'((D_op_ori)) = '1'), std_logic_vector'("00100000001000000010000000100000011011110111001001101001"), A_WE_StdLogicVector((std_logic'((D_op_stw)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111010001110111"), A_WE_StdLogicVector((std_logic'((D_op_blt)) = '1'), std_logic_vector'("00100000001000000010000000100000011000100110110001110100"), A_WE_StdLogicVector((std_logic'((D_op_ldw)) = '1'), std_logic_vector'("00100000001000000010000000100000011011000110010001110111"), A_WE_StdLogicVector((std_logic'((D_op_cmpnei)) = '1'), std_logic_vector'("00100000011000110110110101110000011011100110010101101001"), A_WE_StdLogicVector((std_logic'((D_op_flushda)) = '1'), std_logic_vector'("01100110011011000111010101110011011010000110010001100001"), A_WE_StdLogicVector((std_logic'((D_op_xori)) = '1'), std_logic_vector'("00100000001000000010000001111000011011110111001001101001"), A_WE_StdLogicVector((std_logic'((D_op_bne)) = '1'), std_logic_vector'("00100000001000000010000000100000011000100110111001100101"), A_WE_StdLogicVector((std_logic'((D_op_cmpeqi)) = '1'), std_logic_vector'("00100000011000110110110101110000011001010111000101101001"), A_WE_StdLogicVector((std_logic'((D_op_ldbuio)) = '1'), std_logic_vector'("00100000011011000110010001100010011101010110100101101111"), A_WE_StdLogicVector((std_logic'((D_op_muli)) = '1'), std_logic_vector'("00100000001000000010000001101101011101010110110001101001"), A_WE_StdLogicVector((std_logic'((D_op_stbio)) = '1'), std_logic_vector'("00100000001000000111001101110100011000100110100101101111"), A_WE_StdLogicVector((std_logic'((D_op_beq)) = '1'), std_logic_vector'("00100000001000000010000000100000011000100110010101110001"), A_WE_StdLogicVector((std_logic'((D_op_ldbio)) = '1'), std_logic_vector'("00100000001000000110110001100100011000100110100101101111"), A_WE_StdLogicVector((std_logic'((D_op_cmpgeui)) = '1'), std_logic_vector'("01100011011011010111000001100111011001010111010101101001"), A_WE_StdLogicVector((std_logic'((D_op_ldhuio)) = '1'), std_logic_vector'("00100000011011000110010001101000011101010110100101101111"), A_WE_StdLogicVector((std_logic'((D_op_andhi)) = '1'), std_logic_vector'("00100000001000000110000101101110011001000110100001101001"), A_WE_StdLogicVector((std_logic'((D_op_sthio)) = '1'), std_logic_vector'("00100000001000000111001101110100011010000110100101101111"), A_WE_StdLogicVector((std_logic'((D_op_bgeu)) = '1'), std_logic_vector'("00100000001000000010000001100010011001110110010101110101"), A_WE_StdLogicVector((std_logic'((D_op_ldhio)) = '1'), std_logic_vector'("00100000001000000110110001100100011010000110100101101111"), A_WE_StdLogicVector((std_logic'((D_op_cmpltui)) = '1'), std_logic_vector'("01100011011011010111000001101100011101000111010101101001"), A_WE_StdLogicVector((std_logic'((D_op_initd)) = '1'), std_logic_vector'("00100000001000000110100101101110011010010111010001100100"), A_WE_StdLogicVector((std_logic'((D_op_orhi)) = '1'), std_logic_vector'("00100000001000000010000001101111011100100110100001101001"), A_WE_StdLogicVector((std_logic'((D_op_stwio)) = '1'), std_logic_vector'("00100000001000000111001101110100011101110110100101101111"), A_WE_StdLogicVector((std_logic'((D_op_bltu)) = '1'), std_logic_vector'("00100000001000000010000001100010011011000111010001110101"), A_WE_StdLogicVector((std_logic'((D_op_ldwio)) = '1'), std_logic_vector'("00100000001000000110110001100100011101110110100101101111"), A_WE_StdLogicVector((std_logic'((D_op_flushd)) = '1'), std_logic_vector'("00100000011001100110110001110101011100110110100001100100"), A_WE_StdLogicVector((std_logic'((D_op_xorhi)) = '1'), std_logic_vector'("00100000001000000111100001101111011100100110100001101001"), A_WE_StdLogicVector((std_logic'((D_op_eret)) = '1'), std_logic_vector'("00100000001000000010000001100101011100100110010101110100"), A_WE_StdLogicVector((std_logic'((D_op_roli)) = '1'), std_logic_vector'("00100000001000000010000001110010011011110110110001101001"), A_WE_StdLogicVector((std_logic'((D_op_rol)) = '1'), std_logic_vector'("00100000001000000010000000100000011100100110111101101100"), A_WE_StdLogicVector((std_logic'((D_op_flushp)) = '1'), std_logic_vector'("00100000011001100110110001110101011100110110100001110000"), A_WE_StdLogicVector((std_logic'((D_op_ret)) = '1'), std_logic_vector'("00100000001000000010000000100000011100100110010101110100"), A_WE_StdLogicVector((std_logic'((D_op_nor)) = '1'), std_logic_vector'("00100000001000000010000000100000011011100110111101110010"), A_WE_StdLogicVector((std_logic'((D_op_mulxuu)) = '1'), std_logic_vector'("00100000011011010111010101101100011110000111010101110101"), A_WE_StdLogicVector((std_logic'((D_op_cmpge)) = '1'), std_logic_vector'("00100000001000000110001101101101011100000110011101100101"), A_WE_StdLogicVector((std_logic'((D_op_bret)) = '1'), std_logic_vector'("00100000001000000010000001100010011100100110010101110100"), A_WE_StdLogicVector((std_logic'((D_op_ror)) = '1'), std_logic_vector'("00100000001000000010000000100000011100100110111101110010"), A_WE_StdLogicVector((std_logic'((D_op_flushi)) = '1'), std_logic_vector'("00100000011001100110110001110101011100110110100001101001"), A_WE_StdLogicVector((std_logic'((D_op_jmp)) = '1'), std_logic_vector'("00100000001000000010000000100000011010100110110101110000"), A_WE_StdLogicVector((std_logic'((D_op_and)) = '1'), std_logic_vector'("00100000001000000010000000100000011000010110111001100100"), A_WE_StdLogicVector((std_logic'((D_op_cmplt)) = '1'), std_logic_vector'("00100000001000000110001101101101011100000110110001110100"), A_WE_StdLogicVector((std_logic'((D_op_slli)) = '1'), std_logic_vector'("00100000001000000010000001110011011011000110110001101001"), A_WE_StdLogicVector((std_logic'((D_op_sll)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110110110001101100"), A_WE_StdLogicVector((std_logic'((D_op_or)) = '1'), std_logic_vector'("00100000001000000010000000100000001000000110111101110010"), A_WE_StdLogicVector((std_logic'((D_op_mulxsu)) = '1'), std_logic_vector'("00100000011011010111010101101100011110000111001101110101"), A_WE_StdLogicVector((std_logic'((D_op_cmpne)) = '1'), std_logic_vector'("00100000001000000110001101101101011100000110111001100101"), A_WE_StdLogicVector((std_logic'((D_op_srli)) = '1'), std_logic_vector'("00100000001000000010000001110011011100100110110001101001"), A_WE_StdLogicVector((std_logic'((D_op_srl)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111001001101100"), A_WE_StdLogicVector((std_logic'((D_op_nextpc)) = '1'), std_logic_vector'("00100000011011100110010101111000011101000111000001100011"), A_WE_StdLogicVector((std_logic'((D_op_callr)) = '1'), std_logic_vector'("00100000001000000110001101100001011011000110110001110010"), A_WE_StdLogicVector((std_logic'((D_op_xor)) = '1'), std_logic_vector'("00100000001000000010000000100000011110000110111101110010"), A_WE_StdLogicVector((std_logic'((D_op_mulxss)) = '1'), std_logic_vector'("00100000011011010111010101101100011110000111001101110011"), A_WE_StdLogicVector((std_logic'((D_op_cmpeq)) = '1'), std_logic_vector'("00100000001000000110001101101101011100000110010101110001"), A_WE_StdLogicVector((std_logic'((D_op_divu)) = '1'), std_logic_vector'("00100000001000000010000001100100011010010111011001110101"), A_WE_StdLogicVector((std_logic'((D_op_div)) = '1'), std_logic_vector'("00100000001000000010000000100000011001000110100101110110"), A_WE_StdLogicVector((std_logic'((D_op_rdctl)) = '1'), std_logic_vector'("00100000001000000111001001100100011000110111010001101100"), A_WE_StdLogicVector((std_logic'((D_op_mul)) = '1'), std_logic_vector'("00100000001000000010000000100000011011010111010101101100"), A_WE_StdLogicVector((std_logic'((D_op_cmpgeu)) = '1'), std_logic_vector'("00100000011000110110110101110000011001110110010101110101"), A_WE_StdLogicVector((std_logic'((D_op_initi)) = '1'), std_logic_vector'("00100000001000000110100101101110011010010111010001101001"), A_WE_StdLogicVector((std_logic'((D_op_trap)) = '1'), std_logic_vector'("00100000001000000010000001110100011100100110000101110000"), A_WE_StdLogicVector((std_logic'((D_op_wrctl)) = '1'), std_logic_vector'("00100000001000000111011101110010011000110111010001101100"), A_WE_StdLogicVector((std_logic'((D_op_cmpltu)) = '1'), std_logic_vector'("00100000011000110110110101110000011011000111010001110101"), A_WE_StdLogicVector((std_logic'((D_op_add)) = '1'), std_logic_vector'("00100000001000000010000000100000011000010110010001100100"), A_WE_StdLogicVector((std_logic'((D_op_break)) = '1'), std_logic_vector'("00100000001000000110001001110010011001010110000101101011"), A_WE_StdLogicVector((std_logic'((D_op_hbreak)) = '1'), std_logic_vector'("00100000011010000110001001110010011001010110000101101011"), A_WE_StdLogicVector((std_logic'((D_op_sync)) = '1'), std_logic_vector'("00100000001000000010000001110011011110010110111001100011"), A_WE_StdLogicVector((std_logic'((D_op_sub)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111010101100010"), A_WE_StdLogicVector((std_logic'((D_op_srai)) = '1'), std_logic_vector'("00100000001000000010000001110011011100100110000101101001"), A_WE_StdLogicVector((std_logic'((D_op_sra)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111001001100001"), A_WE_StdLogicVector((std_logic'((D_op_intr)) = '1'), std_logic_vector'("00100000001000000010000001101001011011100111010001110010"), std_logic_vector'("00100000001000000010000000100000010000100100000101000100")))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
    F_vinst <= A_WE_StdLogicVector((std_logic'(F_valid) = '1'), F_inst, A_REP_VECTOR(std_logic_vector'("00101101"), 7));
    D_vinst <= A_WE_StdLogicVector((std_logic'(D_valid) = '1'), D_inst, A_REP_VECTOR(std_logic_vector'("00101101"), 7));
    R_vinst <= A_WE_StdLogicVector((std_logic'(R_valid) = '1'), D_inst, A_REP_VECTOR(std_logic_vector'("00101101"), 7));
    E_vinst <= A_WE_StdLogicVector((std_logic'(E_valid) = '1'), D_inst, A_REP_VECTOR(std_logic_vector'("00101101"), 7));
    W_vinst <= A_WE_StdLogicVector((std_logic'(W_valid) = '1'), D_inst, A_REP_VECTOR(std_logic_vector'("00101101"), 7));
--synthesis translate_on

end europa;

