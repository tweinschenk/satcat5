--------------------------------------------------------------------------
-- Copyright 2021 The Aerospace Corporation.
-- This file is a part of SatCat5, licensed under CERN-OHL-W v2 or later.
--------------------------------------------------------------------------
--
-- Port-type wrapper for "cfgbus_mdio"
--
-- Xilinx IP-cores can only use simple std_logic and std_logic_vector types.
-- This shim provides that conversion.
--

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;
use     work.cfgbus_common.all;
use     work.common_functions.all;

entity wrap_cfgbus_mdio is
    generic (
    DEV_ADDR    : integer;          -- ConfigBus device address
    CLKREF_HZ   : positive;         -- ConfigBus clock rate (Hz)
    MDIO_BAUD   : positive);        -- MDIO baud rate (bps)
    port (
    -- External MDIO interface.
    mdio_clk    :   out std_logic;
    mdio_data   : inout std_logic;

    -- ConfigBus interface.
    cfg_clk     : in  std_logic;
    cfg_devaddr : in  std_logic_vector(7 downto 0);
    cfg_regaddr : in  std_logic_vector(9 downto 0);
    cfg_wdata   : in  std_logic_vector(31 downto 0);
    cfg_wstrb   : in  std_logic_vector(3 downto 0);
    cfg_wrcmd   : in  std_logic;
    cfg_rdcmd   : in  std_logic;
    cfg_reset_p : in  std_logic;
    cfg_rdata   : out std_logic_vector(31 downto 0);
    cfg_rdack   : out std_logic;
    cfg_rderr   : out std_logic;
    cfg_irq     : out std_logic);
end wrap_cfgbus_mdio;

architecture wrap_cfgbus_mdio of wrap_cfgbus_mdio is

signal cfg_cmd  : cfgbus_cmd;
signal cfg_ack  : cfgbus_ack;

begin

-- Convert ConfigBus signals.
cfg_cmd.clk     <= cfg_clk;
cfg_cmd.sysaddr <= 0;   -- Unused
cfg_cmd.devaddr <= u2i(cfg_devaddr);
cfg_cmd.regaddr <= u2i(cfg_regaddr);
cfg_cmd.wdata   <= cfg_wdata;
cfg_cmd.wstrb   <= cfg_wstrb;
cfg_cmd.wrcmd   <= cfg_wrcmd;
cfg_cmd.rdcmd   <= cfg_rdcmd;
cfg_cmd.reset_p <= cfg_reset_p;
cfg_rdata       <= cfg_ack.rdata;
cfg_rdack       <= cfg_ack.rdack;
cfg_rderr       <= cfg_ack.rderr;
cfg_irq         <= cfg_ack.irq;

-- Unit being wrapped.
u_wrap : entity work.cfgbus_mdio
    generic map(
    DEVADDR     => DEV_ADDR,
    REGADDR     => CFGBUS_ADDR_ANY,
    CLKREF_HZ   => CLKREF_HZ,
    MDIO_BAUD   => MDIO_BAUD)
    port map(
    mdio_clk    => mdio_clk,
    mdio_data   => mdio_data,
    cfg_cmd     => cfg_cmd,
    cfg_ack     => cfg_ack);

end wrap_cfgbus_mdio;
