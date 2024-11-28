library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

entity retrigger_autonegotiation is
    port (
    clk_50mhz: in std_logic;
    an_restart_config_o: out std_logic;
    an_interrupt_i: in std_logic
    );
end retrigger_autonegotiation;

architecture retrigger_autonegotiation of retrigger_autonegotiation is

signal counter: integer := 1;
signal temp: std_logic := '0';

begin

retrigger: process(clk_50mhz)
begin
if rising_edge(clk_50mhz) then
    counter <= counter + 1;
    if (counter >= 10000001) then
        temp <= NOT temp;
        counter <= 1;
    end if;
end if;
an_restart_config_o <= (temp and (not an_interrupt_i));
end process;


end retrigger_autonegotiation;
