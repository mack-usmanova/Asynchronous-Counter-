----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2025 06:47:40 PM
-- Design Name: 
-- Module Name: mod6 - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

entity mod6 is
    Port (
        CKA, RESET, R0, R5: in  STD_LOGIC;     -- falling-edge sensitive input clock
        y1,y2,y3,y4: inout std_logic;    --state variables
        QA, QB, QC  : out STD_LOGIC      --q outputs
    );
end mod6;

architecture Behavioral of mod6 is

begin

process(cka, reset,y1,y2,y3,y4,r0,r5)
begin

if r5 = '1' then  --making sure r5 has priority over r0
    y1 <= '0';     --this is not taken into the state asignment therefore it has its own code
    y2 <= '0';
    y3 <= '0';
    y4 <= '1';
    qa <= '1';
    qb <= '0';
    qc <= '1';
else
    if r0 = '1' then   --r0 = 1 will clear everything
        y1 <= '0';
        y2 <= '0';
        y3 <= '0';
        y4 <= '0';
        qa <= '0';
        qb <= '0';
        qc <= '0'; 
    else
        y1 <= ((not(cka) and y1 and not(y4))        -- i got the values from my state 8x4 asignment kmap 
                or (y1 and not(y2) and not(y3) and not(y4))
                or (y1 and y2 and y3 and not(y4))
                or (cka and not(y2) and not(y3) and not(y4))
                or (cka and y2 and y3 and not(y4))) and reset;
                
        y2 <= ((not(cka) and y1 and not(y3) and not(y4))
                or (y2 and not(y3) and not(y4))
                or (not(y1) and y2)
                or (cka and y2 and not(y4))) and reset;
                
        y3 <= ((cka and not(y1) and y2 and y4)
                or (not(y1) and y2 and y3)
                or (y3 and not(y4))
                or (not(cka) and not(y1) and not(y2) and y3)) and reset;
                
        y4 <= ((cka and not(y1) and not(y2) and y4)
                or (not(cka) and not(y1) and y2 and not(y3))
                or (not(y1) and y2 and not(y3) and y4)
                or (cka and not(y1) and y2 and y4)
                or (not(cka) and not(y1) and not(y2) and y3)
                or (not(y1) and not(y2) and y3 and y4)) and reset;
                
        QA <= ((not(y1) and not(y2) and y4)
                or (y2 and not(y4))) and reset;
                
        QB <= ((not(y1) and y2 and y4)
                or (y2 and y3)) and reset;
        
        QC <= ((not(y1) and not(y2) and y4)
                or (not(y2) and y3)) and reset;
    end if;
end if;
end process;    
    
end Behavioral;
