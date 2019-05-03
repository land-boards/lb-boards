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

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity cpu_0_test_bench is 
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
end entity cpu_0_test_bench;


architecture europa of cpu_0_test_bench is
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
                signal av_ld_data_aligned_unfiltered_0_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_10_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_11_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_12_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_13_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_14_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_15_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_16_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_17_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_18_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_19_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_1_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_20_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_21_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_22_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_23_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_24_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_25_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_26_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_27_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_28_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_29_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_2_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_30_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_31_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_3_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_4_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_5_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_6_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_7_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_8_is_x :  STD_LOGIC;
                signal av_ld_data_aligned_unfiltered_9_is_x :  STD_LOGIC;
                signal internal_d_write1 :  STD_LOGIC;
                signal internal_test_has_ended :  STD_LOGIC;
  file trace_handle : TEXT ;


begin

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
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_d_write1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      internal_d_write1 <= d_write_nxt;
    end if;

  end process;

  internal_test_has_ended <= std_logic'('0');
  --vhdl renameroo for output signals
  d_write <= internal_d_write1;
  --vhdl renameroo for output signals
  test_has_ended <= internal_test_has_ended;
--synthesis translate_off
    --Clearing 'X' data bits
    av_ld_data_aligned_unfiltered_0_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(0))), '1','0');
    av_ld_data_aligned_filtered(0) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_0_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(0));
    av_ld_data_aligned_unfiltered_1_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(1))), '1','0');
    av_ld_data_aligned_filtered(1) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_1_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(1));
    av_ld_data_aligned_unfiltered_2_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(2))), '1','0');
    av_ld_data_aligned_filtered(2) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_2_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(2));
    av_ld_data_aligned_unfiltered_3_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(3))), '1','0');
    av_ld_data_aligned_filtered(3) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_3_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(3));
    av_ld_data_aligned_unfiltered_4_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(4))), '1','0');
    av_ld_data_aligned_filtered(4) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_4_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(4));
    av_ld_data_aligned_unfiltered_5_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(5))), '1','0');
    av_ld_data_aligned_filtered(5) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_5_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(5));
    av_ld_data_aligned_unfiltered_6_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(6))), '1','0');
    av_ld_data_aligned_filtered(6) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_6_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(6));
    av_ld_data_aligned_unfiltered_7_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(7))), '1','0');
    av_ld_data_aligned_filtered(7) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_7_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(7));
    av_ld_data_aligned_unfiltered_8_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(8))), '1','0');
    av_ld_data_aligned_filtered(8) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_8_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(8));
    av_ld_data_aligned_unfiltered_9_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(9))), '1','0');
    av_ld_data_aligned_filtered(9) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_9_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(9));
    av_ld_data_aligned_unfiltered_10_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(10))), '1','0');
    av_ld_data_aligned_filtered(10) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_10_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(10));
    av_ld_data_aligned_unfiltered_11_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(11))), '1','0');
    av_ld_data_aligned_filtered(11) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_11_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(11));
    av_ld_data_aligned_unfiltered_12_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(12))), '1','0');
    av_ld_data_aligned_filtered(12) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_12_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(12));
    av_ld_data_aligned_unfiltered_13_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(13))), '1','0');
    av_ld_data_aligned_filtered(13) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_13_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(13));
    av_ld_data_aligned_unfiltered_14_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(14))), '1','0');
    av_ld_data_aligned_filtered(14) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_14_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(14));
    av_ld_data_aligned_unfiltered_15_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(15))), '1','0');
    av_ld_data_aligned_filtered(15) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_15_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(15));
    av_ld_data_aligned_unfiltered_16_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(16))), '1','0');
    av_ld_data_aligned_filtered(16) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_16_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(16));
    av_ld_data_aligned_unfiltered_17_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(17))), '1','0');
    av_ld_data_aligned_filtered(17) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_17_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(17));
    av_ld_data_aligned_unfiltered_18_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(18))), '1','0');
    av_ld_data_aligned_filtered(18) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_18_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(18));
    av_ld_data_aligned_unfiltered_19_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(19))), '1','0');
    av_ld_data_aligned_filtered(19) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_19_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(19));
    av_ld_data_aligned_unfiltered_20_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(20))), '1','0');
    av_ld_data_aligned_filtered(20) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_20_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(20));
    av_ld_data_aligned_unfiltered_21_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(21))), '1','0');
    av_ld_data_aligned_filtered(21) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_21_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(21));
    av_ld_data_aligned_unfiltered_22_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(22))), '1','0');
    av_ld_data_aligned_filtered(22) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_22_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(22));
    av_ld_data_aligned_unfiltered_23_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(23))), '1','0');
    av_ld_data_aligned_filtered(23) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_23_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(23));
    av_ld_data_aligned_unfiltered_24_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(24))), '1','0');
    av_ld_data_aligned_filtered(24) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_24_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(24));
    av_ld_data_aligned_unfiltered_25_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(25))), '1','0');
    av_ld_data_aligned_filtered(25) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_25_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(25));
    av_ld_data_aligned_unfiltered_26_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(26))), '1','0');
    av_ld_data_aligned_filtered(26) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_26_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(26));
    av_ld_data_aligned_unfiltered_27_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(27))), '1','0');
    av_ld_data_aligned_filtered(27) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_27_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(27));
    av_ld_data_aligned_unfiltered_28_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(28))), '1','0');
    av_ld_data_aligned_filtered(28) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_28_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(28));
    av_ld_data_aligned_unfiltered_29_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(29))), '1','0');
    av_ld_data_aligned_filtered(29) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_29_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(29));
    av_ld_data_aligned_unfiltered_30_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(30))), '1','0');
    av_ld_data_aligned_filtered(30) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_30_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(30));
    av_ld_data_aligned_unfiltered_31_is_x <= A_WE_StdLogic(is_x(std_ulogic(av_ld_data_aligned_unfiltered(31))), '1','0');
    av_ld_data_aligned_filtered(31) <= A_WE_StdLogic((std_logic'(((av_ld_data_aligned_unfiltered_31_is_x AND (R_ctrl_ld_non_io)))) = '1'), std_logic'('0'), av_ld_data_aligned_unfiltered(31));
    process (clk)
    VARIABLE write_line : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'(reset_n) = '1' then 
          if is_x(std_ulogic(F_valid)) then 
            write(write_line, now);
            write(write_line, string'(": "));
            write(write_line, string'("ERROR: cpu_0_test_bench/F_valid is 'x'"));
            write(output, write_line.all & CR);
            deallocate (write_line);
            assert false report "VHDL STOP" severity failure;
          end if;
        end if;
      end if;

    end process;

    process (clk)
    VARIABLE write_line1 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'(reset_n) = '1' then 
          if is_x(std_ulogic(D_valid)) then 
            write(write_line1, now);
            write(write_line1, string'(": "));
            write(write_line1, string'("ERROR: cpu_0_test_bench/D_valid is 'x'"));
            write(output, write_line1.all & CR);
            deallocate (write_line1);
            assert false report "VHDL STOP" severity failure;
          end if;
        end if;
      end if;

    end process;

    process (clk)
    VARIABLE write_line2 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'(reset_n) = '1' then 
          if is_x(std_ulogic(E_valid)) then 
            write(write_line2, now);
            write(write_line2, string'(": "));
            write(write_line2, string'("ERROR: cpu_0_test_bench/E_valid is 'x'"));
            write(output, write_line2.all & CR);
            deallocate (write_line2);
            assert false report "VHDL STOP" severity failure;
          end if;
        end if;
      end if;

    end process;

    process (clk)
    VARIABLE write_line3 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'(reset_n) = '1' then 
          if is_x(std_ulogic(W_valid)) then 
            write(write_line3, now);
            write(write_line3, string'(": "));
            write(write_line3, string'("ERROR: cpu_0_test_bench/W_valid is 'x'"));
            write(output, write_line3.all & CR);
            deallocate (write_line3);
            assert false report "VHDL STOP" severity failure;
          end if;
        end if;
      end if;

    end process;

    process (clk, reset_n)
    VARIABLE write_line4 : line;
    begin
      if reset_n = '0' then
      elsif clk'event and clk = '1' then
        if std_logic'(W_valid) = '1' then 
          if is_x(std_ulogic(R_wr_dst_reg)) then 
            write(write_line4, now);
            write(write_line4, string'(": "));
            write(write_line4, string'("ERROR: cpu_0_test_bench/R_wr_dst_reg is 'x'"));
            write(output, write_line4.all & CR);
            deallocate (write_line4);
            assert false report "VHDL STOP" severity failure;
          end if;
        end if;
      end if;

    end process;

    process (clk, reset_n)
    VARIABLE write_line5 : line;
    begin
      if reset_n = '0' then
      elsif clk'event and clk = '1' then
        if std_logic'((W_valid AND R_wr_dst_reg)) = '1' then 
          if is_x(W_wr_data) then 
            write(write_line5, now);
            write(write_line5, string'(": "));
            write(write_line5, string'("ERROR: cpu_0_test_bench/W_wr_data is 'x'"));
            write(output, write_line5.all & CR);
            deallocate (write_line5);
            assert false report "VHDL STOP" severity failure;
          end if;
        end if;
      end if;

    end process;

    process (clk, reset_n)
    VARIABLE write_line6 : line;
    begin
      if reset_n = '0' then
      elsif clk'event and clk = '1' then
        if std_logic'((W_valid AND R_wr_dst_reg)) = '1' then 
          if is_x(R_dst_regnum) then 
            write(write_line6, now);
            write(write_line6, string'(": "));
            write(write_line6, string'("ERROR: cpu_0_test_bench/R_dst_regnum is 'x'"));
            write(output, write_line6.all & CR);
            deallocate (write_line6);
            assert false report "VHDL STOP" severity failure;
          end if;
        end if;
      end if;

    end process;

    process (clk)
    VARIABLE write_line7 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'(reset_n) = '1' then 
          if is_x(std_ulogic(internal_d_write1)) then 
            write(write_line7, now);
            write(write_line7, string'(": "));
            write(write_line7, string'("ERROR: cpu_0_test_bench/internal_d_write1 is 'x'"));
            write(output, write_line7.all & CR);
            deallocate (write_line7);
            assert false report "VHDL STOP" severity failure;
          end if;
        end if;
      end if;

    end process;

    process (clk, reset_n)
    VARIABLE write_line8 : line;
    begin
      if reset_n = '0' then
      elsif clk'event and clk = '1' then
        if std_logic'(internal_d_write1) = '1' then 
          if is_x(d_byteenable) then 
            write(write_line8, now);
            write(write_line8, string'(": "));
            write(write_line8, string'("ERROR: cpu_0_test_bench/d_byteenable is 'x'"));
            write(output, write_line8.all & CR);
            deallocate (write_line8);
            assert false report "VHDL STOP" severity failure;
          end if;
        end if;
      end if;

    end process;

    process (clk, reset_n)
    VARIABLE write_line9 : line;
    begin
      if reset_n = '0' then
      elsif clk'event and clk = '1' then
        if std_logic'((internal_d_write1 OR d_read)) = '1' then 
          if is_x(d_address) then 
            write(write_line9, now);
            write(write_line9, string'(": "));
            write(write_line9, string'("ERROR: cpu_0_test_bench/d_address is 'x'"));
            write(output, write_line9.all & CR);
            deallocate (write_line9);
            assert false report "VHDL STOP" severity failure;
          end if;
        end if;
      end if;

    end process;

    process (clk)
    VARIABLE write_line10 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'(reset_n) = '1' then 
          if is_x(std_ulogic(d_read)) then 
            write(write_line10, now);
            write(write_line10, string'(": "));
            write(write_line10, string'("ERROR: cpu_0_test_bench/d_read is 'x'"));
            write(output, write_line10.all & CR);
            deallocate (write_line10);
            assert false report "VHDL STOP" severity failure;
          end if;
        end if;
      end if;

    end process;

    process (clk)
    VARIABLE write_line11 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'(reset_n) = '1' then 
          if is_x(std_ulogic(i_read)) then 
            write(write_line11, now);
            write(write_line11, string'(": "));
            write(write_line11, string'("ERROR: cpu_0_test_bench/i_read is 'x'"));
            write(output, write_line11.all & CR);
            deallocate (write_line11);
            assert false report "VHDL STOP" severity failure;
          end if;
        end if;
      end if;

    end process;

    process (clk, reset_n)
    VARIABLE write_line12 : line;
    begin
      if reset_n = '0' then
      elsif clk'event and clk = '1' then
        if std_logic'(i_read) = '1' then 
          if is_x(i_address) then 
            write(write_line12, now);
            write(write_line12, string'(": "));
            write(write_line12, string'("ERROR: cpu_0_test_bench/i_address is 'x'"));
            write(output, write_line12.all & CR);
            deallocate (write_line12);
            assert false report "VHDL STOP" severity failure;
          end if;
        end if;
      end if;

    end process;

    process (clk, reset_n)
    VARIABLE write_line13 : line;
    begin
      if reset_n = '0' then
      elsif clk'event and clk = '1' then
        if std_logic'((i_read AND NOT i_waitrequest)) = '1' then 
          if is_x(i_readdata) then 
            write(write_line13, now);
            write(write_line13, string'(": "));
            write(write_line13, string'("ERROR: cpu_0_test_bench/i_readdata is 'x'"));
            write(output, write_line13.all & CR);
            deallocate (write_line13);
            assert false report "VHDL STOP" severity failure;
          end if;
        end if;
      end if;

    end process;

    process (clk, reset_n)
    VARIABLE write_line14 : line;
    begin
      if reset_n = '0' then
      elsif clk'event and clk = '1' then
        if std_logic'((W_valid AND R_ctrl_ld)) = '1' then 
          if is_x(av_ld_data_aligned_unfiltered) then 
            write(write_line14, now);
            write(write_line14, string'(": "));
            write(write_line14, string'("WARNING: cpu_0_test_bench/av_ld_data_aligned_unfiltered is 'x'"));
            write(output, write_line14.all & CR);
            deallocate (write_line14);
          end if;
        end if;
      end if;

    end process;

    process (clk, reset_n)
    VARIABLE write_line15 : line;
    begin
      if reset_n = '0' then
      elsif clk'event and clk = '1' then
        if std_logic'((W_valid AND R_wr_dst_reg)) = '1' then 
          if is_x(W_wr_data) then 
            write(write_line15, now);
            write(write_line15, string'(": "));
            write(write_line15, string'("WARNING: cpu_0_test_bench/W_wr_data is 'x'"));
            write(output, write_line15.all & CR);
            deallocate (write_line15);
          end if;
        end if;
      end if;

    end process;

    
    process is
      variable status : file_open_status; -- status for fopen
    VARIABLE write_line16 : line;
    VARIABLE write_line17 : line;
    
    begin  -- process
      file_open(status, trace_handle, "cpu_0.tr", WRITE_MODE);
      write(write_line16, string'("version 3"));
    write(trace_handle, write_line16.all & LF);
    deallocate (write_line16);
    write(write_line17, string'("numThreads 1"));
    write(trace_handle, write_line17.all & LF);
    deallocate (write_line17);
    
      wait;                               -- wait forever
    end process;
    process (clk)
    VARIABLE write_line18 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((((NOT reset_n OR (W_valid))) AND NOT internal_test_has_ended)) = '1' then 
          write(write_line18, now);
          write(write_line18, string'(": "));
          write(write_line18, to_hex_string(NOT reset_n, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(F_pcb, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(std_logic_vector'("00000000000000000000000000000000"), pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(D_op_intr, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(D_op_hbreak, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(D_iw, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(NOT ((D_op_intr OR D_op_hbreak)), pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(R_wr_dst_reg, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(R_dst_regnum, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(std_logic_vector'("00000000000000000000000000000000"), pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(W_rf_wr_data, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(W_mem_baddr, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(E_st_data, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(E_mem_byte_en, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(W_cmp_result, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(E_alu_result, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(W_status_reg, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(W_estatus_reg, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(W_bstatus_reg, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(W_ienable_reg, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(W_ipending_reg, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(std_logic_vector'("00000000000000000000000000000000"), pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(std_logic_vector'("00000000000000000000000000000000"), pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(std_logic_vector'("00000000000000000000000000000000"), pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(std_logic_vector'("00000000000000000000000000000000"), pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(std_logic_vector'("00000000000000000000000000000000"), pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(std_logic_vector'("00000000000000000000000000000000"), pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(std_logic_vector'("00000000000000000000000000000000"), pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(std_logic_vector'("00000000000000000000000000000000"), pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(std_logic_vector'("00000000000000000000000000000000"), pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(std_logic_vector'("00000000000000000000000000000000"), pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(R_ctrl_exception, pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(std_logic_vector'("00000000000000000000000000000000"), pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(std_logic_vector'("00000000000000000000000000000000"), pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(std_logic_vector'("00000000000000000000000000000000"), pad_none));
          write(write_line18, string'(","));
          write(write_line18, to_hex_string(std_logic_vector'("00000000000000000000000000000000"), pad_none));
          write(write_line18, string'(""));
          write(trace_handle, write_line18.all & LF);
          deallocate (write_line18);
        end if;
      end if;

    end process;

--synthesis translate_on
--synthesis read_comments_as_HDL on
--    
--    av_ld_data_aligned_filtered <= av_ld_data_aligned_unfiltered;
--synthesis read_comments_as_HDL off

end europa;

