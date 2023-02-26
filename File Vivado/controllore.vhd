----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.02.2023 15:38:44
-- Design Name: 
-- Module Name: controllore - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller is
	port(
		i: in std_logic;
		i_clk: in std_logic;
		i_rst: in std_logic;
		oReg: out std_logic;
		oAddr: out std_logic;
		oMux: out std_logic;
		oDone: out std_logic
	);
end controller;

architecture FSM of controller is
	type state_type is (S0, S1, S2, S3, S4, S5, S6, S9, S7, S8, S10);
	signal next_state, current_state: state_type;

	begin
		state_reg: process(i_clk, i_rst)
		begin
			if(i_rst = '1') then
				current_state <= S0;
			elsif i_clk = '1' and i_clk'event then
				current_state <= next_state;
			end if;
		end process;
		
		lambda: process(current_state, i)
		begin
			case current_state is
				when S0 =>
					if(i = '0') then
						next_state <= S0;
					else
						next_state <= S1;
					end if;
				when S1 =>
					if(i = '0') then
						next_state <= S1;
					else
						next_state <= S2;
					end if;
				when S2 =>
					if(i = '0') then
						next_state <= S4;
					else
						next_state <= S3;
					end if;
				when S3 =>
					if(i = '0') then
						next_state <= S10;
					else
						next_state <= S3;
					end if;
				when S10 =>
                    if(i = '0') then
                        next_state <= S4;
                    else
                        next_state <= S10;
                    end if;
				when S4 =>
					if(i = '0') then
						next_state <= S9;
					else
						next_state <= S9;
					end if;
				when S9 =>
                    if(i = '0') then
                        next_state <= S5;
                    else
                        next_state <= S5;
                    end if;
				when S5 =>
					if(i = '0') then
						next_state <= S6;
					else
						next_state <= S6;
					end if;
				when S6 =>
					if(i = '0') then
						next_state <= S7;
					else
						next_state <= S7;
					end if;
				when S7 =>
					if(i = '0') then
						next_state <= S8;
					else
						next_state <= S1;
					end if;
				when S8 =>
					if(i = '0') then
						next_state <= S8;
					else
						next_state <= S1;
					end if;
			end case;
		end process;
		
		delta: process(current_state)
		begin
			case current_state is
				when S0 =>
					oReg <= '0';
					oAddr <= '0';
					oMux <= '0';
					oDone <= '0';
				when S1 =>
					oReg <= '1';
                    oAddr <= '0';
                    oMux <= '0';
                    oDone <= '0';
				when S2 =>
					oReg <= '1';
                    oAddr <= '0';
                    oMux <= '0';
                    oDone <= '0';
				when S3 =>
					oReg <= '0';
                    oAddr <= '1';
                    oMux <= '0';
                    oDone <= '0';
                when S10 =>
                    oReg <= '0';
                    oAddr <= '1';
                    oMux <= '0';
                    oDone <= '0';
				when S4 =>
					oReg <= '0';
                    oAddr <= '0';
                    oMux <= '0';
                    oDone <= '0';
				when S5 =>
					oReg <= '0';
                    oAddr <= '0';
                    oMux <= '1';
                    oDone <= '0';            
				when S6 =>
					oReg <= '0';
                    oAddr <= '0';
                    oMux <= '0';
                    oDone <= '0';
                when S9 =>
                    oReg <= '0';
                    oAddr <= '0';
                    oMux <= '1';
                    oDone <= '0';
				when S7 =>
					oReg <= '0';
                    oAddr <= '0';
                    oMux <= '0';
                    oDone <= '1';
				when S8 =>
					oReg <= '0';
                    oAddr <= '0';
                    oMux <= '0';
                    oDone <= '0';
			end case;
		end process;
	end FSM;