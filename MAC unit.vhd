----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2026 21:52:48
-- Design Name: 
-- Module Name: MAC unit - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity mac_unit is
    Port (
        CLK    : in  STD_LOGIC;
        RESET  : in  STD_LOGIC;
        A      : in  STD_LOGIC_VECTOR(7 downto 0);
        B      : in  STD_LOGIC_VECTOR(7 downto 0);
        C      : in  STD_LOGIC_VECTOR(15 downto 0);
        RESULT : out STD_LOGIC_VECTOR(15 downto 0)
    );
end mac_unit;

architecture Behavioral of mac_unit is

    signal result_reg : unsigned(15 downto 0) := (others => '0');

begin

    process(CLK, RESET)

        variable multiplication : unsigned(15 downto 0);
        variable addition       : unsigned(16 downto 0);

    begin

        if RESET = '1' then

            result_reg <= (others => '0');

        elsif rising_edge(CLK) then

            -- 8-bit × 8-bit = 16-bit
            multiplication :=
                unsigned(A) * unsigned(B);

            -- Multiplication + C
            addition :=
                resize(multiplication, 17) +
                resize(unsigned(C), 17);

            -- Keep lower 16 bits
            result_reg <= addition(15 downto 0);

        end if;

    end process;

    RESULT <= std_logic_vector(result_reg);

end Behavioral;