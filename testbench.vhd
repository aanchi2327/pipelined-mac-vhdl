----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2026 21:55:35
-- Design Name: 
-- Module Name: testbench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mac_unit_tb is
end mac_unit_tb;

architecture Behavioral of mac_unit_tb is

    component mac_unit
        Port (
            CLK    : in  STD_LOGIC;
            RESET  : in  STD_LOGIC;
            A      : in  STD_LOGIC_VECTOR(7 downto 0);
            B      : in  STD_LOGIC_VECTOR(7 downto 0);
            C      : in  STD_LOGIC_VECTOR(15 downto 0);
            RESULT : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    signal CLK    : STD_LOGIC := '0';
    signal RESET  : STD_LOGIC := '1';

    signal A      : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal B      : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal C      : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

    signal RESULT : STD_LOGIC_VECTOR(15 downto 0);

begin

    DUT : mac_unit
        port map (
            CLK    => CLK,
            RESET  => RESET,
            A      => A,
            B      => B,
            C      => C,
            RESULT => RESULT
        );


    -- 100 MHz Clock
    clock_process : process
    begin
        while true loop

            CLK <= '0';
            wait for 5 ns;

            CLK <= '1';
            wait for 5 ns;

        end loop;
    end process;


    -- Test Cases
    stimulus_process : process
    begin

        -- Reset
        RESET <= '1';
        wait for 20 ns;

        RESET <= '0';


        -- Test 1
        -- 10 × 20 + 5 = 205
        A <= "00001010";
        B <= "00010100";
        C <= "0000000000000101";

        wait for 20 ns;


        -- Test 2
        -- 5 × 10 + 20 = 70
        A <= "00000101";
        B <= "00001010";
        C <= "0000000000010100";

        wait for 20 ns;


        -- Test 3
        -- 15 × 15 + 10 = 235
        A <= "00001111";
        B <= "00001111";
        C <= "0000000000001010";

        wait for 20 ns;


        -- Test 4
        -- 100 × 2 + 50 = 250
        A <= "01100100";
        B <= "00000010";
        C <= "0000000000110010";

        wait for 20 ns;


        -- Test 5
        -- 200 × 3 + 100 = 700
        A <= "11001000";
        B <= "00000011";
        C <= "0000000001100100";

        wait for 20 ns;


        wait;

    end process;

end Behavioral;
