library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity traffic_light_tb is
end traffic_light_tb;

architecture Behavioral of traffic_light_tb is

    signal i_clk : STD_LOGIC;
    signal i_rst : STD_LOGIC;
    signal o_green : STD_LOGIC;
    signal o_yellow : STD_LOGIC;
    signal o_red : STD_LOGIC;
    
    component traffic_light is
        Port ( i_clk, i_rst : in STD_LOGIC;
		o_green, o_yellow, o_red : out STD_LOGIC);
    end component;

    component traffic_light_tester is 
        Port ( i_clk, i_rst : out STD_LOGIC);
    end component;

    begin

        t1: traffic_light_tester port map(
            i_clk => i_clk,
            i_rst => i_rst
        );

        t2: traffic_light port map(
            i_clk => i_clk,
            i_rst => i_rst,
            o_green => o_green,
            o_yellow => o_yellow,
            o_red => o_red
        );

end Behavioral;