library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity traffic_light is
	Port ( i_clk, i_rst : in STD_LOGIC;
		o_green, o_yellow, o_red : out STD_LOGIC);
end traffic_light;

architecture Behavioral of traffic_light is

signal cnt_quarter_sec : std_logic_vector (2 downto 0) := "000";
signal cnt_sec : std_logic_vector (3 downto 0) := "0000";

begin
process(i_clk, i_rst)

begin

if (i_rst = '1') then 
    cnt_sec <= "0000";
    cnt_quarter_sec <= "000";
end if;

if (rising_edge(i_clk)) then
	cnt_quarter_sec <= cnt_quarter_sec + 1;
end if;

if (cnt_quarter_sec = 5) then
    cnt_sec <= cnt_sec + 1;
    cnt_quarter_sec <= "000";
end if;

if (cnt_sec < 4) then
	o_green <= '0'; 
	o_yellow <= '0';
	o_red <= '1';
elsif (cnt_sec < 5) then
	o_green <= '0'; 
	o_yellow <= '1';
	o_red <= '1';
elsif (cnt_sec < 9) then
	o_green <= '1'; 
	o_yellow <= '0';
	o_red <= '0';
elsif (cnt_sec < 10) then
	if (conv_integer(cnt_quarter_sec) rem 2 = 0) then
		o_green <= '1';
	else
		o_green <= '0';
	end if;
	o_yellow <= '0';
	o_red <= '0';
elsif (cnt_sec > 10) then
	cnt_sec <= "0000";
    cnt_quarter_sec <= "000";
end if;

end process;

end Behavioral;