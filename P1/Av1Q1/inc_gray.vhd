library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity inc_gray is
	generic(N : natural := 5); -- entrada generica igual a 5
	port
	(
		gray_in   : in std_logic_vector(n-1 downto 0); --criando vetor generico
		gray_out  : out std_logic_vector(n-1 downto 0) --criando vetor generico

	);
end entity;


architecture hardware of inc_gray is
	signal b: std_logic_vector(N-1 downto 0); --criando vetor generico
	signal soma: std_logic_vector(N-1 downto 0); --criando vetor generico
	
begin
	
   b(N-1) <= gray_in(N-1) xor '0'; --passando de gray para binario
    
   conversor: for i in N-2 downto 0 generate  
   b(i) <= gray_in(i) xor b(i+1); -- b armazenando a entrada convertida de gray para binario
	end generate;              
										                           
										
	soma <= std_logic_vector(unsigned(b) + 1 ); --somando 1 no vetor soma 
	
	
   gray_out(N-1) <= soma(N-1) xor '0'; -- conversao de binario para gray
    
   conversor2: for i in N-2 downto 0 generate       
   gray_out(i) <= soma(i) xor soma(i+1);
   end generate;                                               
	

end hardware;
