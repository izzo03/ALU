library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
	Port (A : in STD_LOGIC_VECTOR (3 downto 0);
			B : in STD_LOGIC_VECTOR (3 downto 0);
			Operation : in STD_LOGIC_VECTOR(3 downto 0);
			Result_Digit : out STD_LOGIC_VECTOR (0 to 6);
			Carry_Digit : out STD_LOGIC_VECTOR (0 to 6);
			A_Digit : out STD_LOGIC_VECTOR (0 to 6);
			B_Digit : out STD_LOGIC_VECTOR (0 to 6)
			);
end ALU;

architecture Behavioral of ALU is

	function to_Digit(hex_in : STD_LOGIC_VECTOR(3 downto 0)) return STD_LOGIC_VECTOR is
		variable digit : STD_LOGIC_VECTOR(0 to 6);
	begin
		case hex_in is
			when "0000" => digit := "0000001"; -- 0
			when "0001" => digit := "1001111"; -- 1
			when "0010" => digit := "0010010"; -- 2
			when "0011" => digit := "0000110"; -- 3
			when "0100" => digit := "1001100"; -- 4
			when "0101" => digit := "0100100"; -- 5
			when "0110" => digit := "0100000"; -- 6
			when "0111" => digit := "0001111"; -- 7
			when "1000" => digit := "0000000"; -- 8
			when "1001" => digit := "0001100"; -- 9
			when "1010" => digit := "0001000"; -- A
			when "1011" => digit := "1100000"; -- B
			when "1100" => digit := "0110001"; -- C
			when "1101" => digit := "1000010"; -- D
			when "1110" => digit := "0110000"; -- E
			when "1111" => digit := "0111000"; -- F
			when others => digit := "1111111"; 
			end case;
			return digit;
	end function;


	function to_Digit1(hex_in1 : STD_LOGIC) return STD_LOGIC_VECTOR is
		variable digit1 : STD_LOGIC_VECTOR(0 to 6);
	begin
		case hex_in1 is
			when '1' => digit1 := "1001111"; -- 1
			when others => digit1 := "1111111"; 
		end case;
		return digit1;
	end function;

begin
	process(A, B, Operation)
		variable Result : STD_LOGIC_VECTOR (3 downto 0);
		variable Carry : STD_LOGIC;
		begin

			A_Digit <= to_Digit(A);
			B_Digit <= to_Digit(B);
			Carry_Digit <= "1111111";
			Result_Digit <= "1111111";


			if Operation = "0001" then 
				Result := A and B;
				Result_Digit <= to_Digit(Result);

			elsif Operation = "0010" then 
				Result := A or B;
				Result_Digit <= to_Digit(Result);

			elsif Operation = "0100" then 
				Result := A xor B;
				Result_Digit <= to_Digit(Result);

			elsif Operation = "1001" then 
				Result := A nand B;
				Result_Digit <= to_Digit(Result);

			elsif Operation = "0011" then 
				Result := A nor B;
				Result_Digit <= to_Digit(Result);

			elsif Operation = "0110" then 
				Result := A xnor B;
				Result_Digit <= to_Digit(Result);

			elsif Operation = "1100" then 
				Result := not A;
				Result_Digit <= to_Digit(Result);

			elsif Operation = "1110" then -- Πρόσθεση
            Carry := '0';

            for i in 0 to 3 loop
					Result(i) := A(i) xor B(i) xor Carry;
					Carry := (A(i) and B(i)) or (A(i) and Carry) or (B(i) and Carry);
            end loop;

            Result_Digit <= to_Digit(Result);
				Carry_Digit <= to_Digit1(Carry);
				
			end if;
	end process;
end Behavioral;
