--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.15xf
--  \   \         Application: netgen
--  /   /         Filename: toplvl_synthesis.vhd
-- /___/   /\     Timestamp: Thu Oct 11 16:23:24 2012
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm toplvl -w -dir netgen/synthesis -ofmt vhdl -sim toplvl.ngc toplvl_synthesis.vhd 
-- Device	: xc3s500e-5-fg320
-- Input file	: toplvl.ngc
-- Output file	: C:\FPGA\eightbittdivider\netgen\synthesis\toplvl_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: toplvl
-- Xilinx	: C:\Xilinx\14.1\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------


-- synthesis translate_off
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity toplvl is
  port (
    clk : in STD_LOGIC := 'X'; 
    Saveing2 : in STD_LOGIC := 'X'; 
    save : in STD_LOGIC := 'X'; 
    ut : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    a : in STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end toplvl;

architecture Structure of toplvl is
  component Memory1
    port (
      clk : in STD_LOGIC := 'X'; 
      we : in STD_LOGIC := 'X'; 
      spo : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
      dpo : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
      a : in STD_LOGIC_VECTOR ( 3 downto 0 ); 
      d : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
      dpra : in STD_LOGIC_VECTOR ( 3 downto 0 ) 
    );
  end component;
  signal N0 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal Saveing2_IBUF_3 : STD_LOGIC; 
  signal a_0_IBUF_12 : STD_LOGIC; 
  signal a_1_IBUF_13 : STD_LOGIC; 
  signal a_2_IBUF_14 : STD_LOGIC; 
  signal a_3_IBUF_15 : STD_LOGIC; 
  signal a_4_IBUF_16 : STD_LOGIC; 
  signal a_5_IBUF_17 : STD_LOGIC; 
  signal a_6_IBUF_18 : STD_LOGIC; 
  signal a_7_IBUF_19 : STD_LOGIC; 
  signal clk_BUFGP_21 : STD_LOGIC; 
  signal save_IBUF_23 : STD_LOGIC; 
  signal weable : STD_LOGIC; 
  signal NLW_mymemory_spo_7_UNCONNECTED : STD_LOGIC; 
  signal NLW_mymemory_spo_6_UNCONNECTED : STD_LOGIC; 
  signal NLW_mymemory_spo_5_UNCONNECTED : STD_LOGIC; 
  signal NLW_mymemory_spo_4_UNCONNECTED : STD_LOGIC; 
  signal NLW_mymemory_spo_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_mymemory_spo_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_mymemory_spo_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_mymemory_spo_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_mymemory_dpo_7_UNCONNECTED : STD_LOGIC; 
  signal NLW_mymemory_dpo_6_UNCONNECTED : STD_LOGIC; 
  signal NLW_mymemory_dpo_5_UNCONNECTED : STD_LOGIC; 
  signal NLW_mymemory_dpo_4_UNCONNECTED : STD_LOGIC; 
  signal NLW_mymemory_dpo_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_mymemory_dpo_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_mymemory_dpo_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_mymemory_dpo_0_UNCONNECTED : STD_LOGIC; 
begin
  XST_GND : GND
    port map (
      G => N0
    );
  XST_VCC : VCC
    port map (
      P => N1
    );
  portarna_we_or00001 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => save_IBUF_23,
      I1 => Saveing2_IBUF_3,
      O => weable
    );
  Saveing2_IBUF : IBUF
    port map (
      I => Saveing2,
      O => Saveing2_IBUF_3
    );
  save_IBUF : IBUF
    port map (
      I => save,
      O => save_IBUF_23
    );
  a_7_IBUF : IBUF
    port map (
      I => a(7),
      O => a_7_IBUF_19
    );
  a_6_IBUF : IBUF
    port map (
      I => a(6),
      O => a_6_IBUF_18
    );
  a_5_IBUF : IBUF
    port map (
      I => a(5),
      O => a_5_IBUF_17
    );
  a_4_IBUF : IBUF
    port map (
      I => a(4),
      O => a_4_IBUF_16
    );
  a_3_IBUF : IBUF
    port map (
      I => a(3),
      O => a_3_IBUF_15
    );
  a_2_IBUF : IBUF
    port map (
      I => a(2),
      O => a_2_IBUF_14
    );
  a_1_IBUF : IBUF
    port map (
      I => a(1),
      O => a_1_IBUF_13
    );
  a_0_IBUF : IBUF
    port map (
      I => a(0),
      O => a_0_IBUF_12
    );
  ut_15_OBUF : OBUF
    port map (
      I => N0,
      O => ut(15)
    );
  ut_14_OBUF : OBUF
    port map (
      I => N0,
      O => ut(14)
    );
  ut_13_OBUF : OBUF
    port map (
      I => N0,
      O => ut(13)
    );
  ut_12_OBUF : OBUF
    port map (
      I => N1,
      O => ut(12)
    );
  ut_11_OBUF : OBUF
    port map (
      I => N1,
      O => ut(11)
    );
  ut_10_OBUF : OBUF
    port map (
      I => N1,
      O => ut(10)
    );
  ut_9_OBUF : OBUF
    port map (
      I => N1,
      O => ut(9)
    );
  ut_8_OBUF : OBUF
    port map (
      I => N1,
      O => ut(8)
    );
  ut_7_OBUF : OBUF
    port map (
      I => N0,
      O => ut(7)
    );
  ut_6_OBUF : OBUF
    port map (
      I => N0,
      O => ut(6)
    );
  ut_5_OBUF : OBUF
    port map (
      I => N0,
      O => ut(5)
    );
  ut_4_OBUF : OBUF
    port map (
      I => N0,
      O => ut(4)
    );
  ut_3_OBUF : OBUF
    port map (
      I => N1,
      O => ut(3)
    );
  ut_2_OBUF : OBUF
    port map (
      I => N1,
      O => ut(2)
    );
  ut_1_OBUF : OBUF
    port map (
      I => N1,
      O => ut(1)
    );
  ut_0_OBUF : OBUF
    port map (
      I => N1,
      O => ut(0)
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_21
    );
  mymemory : Memory1
    port map (
      clk => clk_BUFGP_21,
      we => weable,
      spo(7) => NLW_mymemory_spo_7_UNCONNECTED,
      spo(6) => NLW_mymemory_spo_6_UNCONNECTED,
      spo(5) => NLW_mymemory_spo_5_UNCONNECTED,
      spo(4) => NLW_mymemory_spo_4_UNCONNECTED,
      spo(3) => NLW_mymemory_spo_3_UNCONNECTED,
      spo(2) => NLW_mymemory_spo_2_UNCONNECTED,
      spo(1) => NLW_mymemory_spo_1_UNCONNECTED,
      spo(0) => NLW_mymemory_spo_0_UNCONNECTED,
      dpo(7) => NLW_mymemory_dpo_7_UNCONNECTED,
      dpo(6) => NLW_mymemory_dpo_6_UNCONNECTED,
      dpo(5) => NLW_mymemory_dpo_5_UNCONNECTED,
      dpo(4) => NLW_mymemory_dpo_4_UNCONNECTED,
      dpo(3) => NLW_mymemory_dpo_3_UNCONNECTED,
      dpo(2) => NLW_mymemory_dpo_2_UNCONNECTED,
      dpo(1) => NLW_mymemory_dpo_1_UNCONNECTED,
      dpo(0) => NLW_mymemory_dpo_0_UNCONNECTED,
      a(3) => N0,
      a(2) => N0,
      a(1) => N0,
      a(0) => N1,
      d(7) => a_7_IBUF_19,
      d(6) => a_6_IBUF_18,
      d(5) => a_5_IBUF_17,
      d(4) => a_4_IBUF_16,
      d(3) => a_3_IBUF_15,
      d(2) => a_2_IBUF_14,
      d(1) => a_1_IBUF_13,
      d(0) => a_0_IBUF_12,
      dpra(3) => N0,
      dpra(2) => N0,
      dpra(1) => N1,
      dpra(0) => N0
    );

end Structure;

-- synthesis translate_on
