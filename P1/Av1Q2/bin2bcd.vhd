LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 


ENTITY bin2bcd IS
    PORT (
        x_bin        : IN STD_LOGIC_VECTOR(9 DOWNTO 0);  --  000 a 999
        c_bcd        : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);  --  Centena
        d_bcd        : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);  --  Dezena
        u_bcd        : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)); --  Unidade
 
END bin2bcd;


ARCHITECTURE hardware OF bin2bcd IS
    SIGNAL x_int : integer RANGE 0 TO 999;     --Sinais auxiliares
    SIGNAL c_int : integer RANGE 0 TO 9;
    SIGNAL d_int : integer RANGE 0 TO 9;
    SIGNAL u_int : integer RANGE 0 TO 9;
       
BEGIN		 

    x_int <= To_Integer(Signed(x_bin)); -- De SLV para inteiro preciso passar por signed
	 
    c_int <= x_int/100;
    d_int <= (x_int/10) - (C_int*10);
    u_int <= x_int - ((C_int*10) + D_int)*10;
   
    c_bcd <= Std_logic_vector(To_Unsigned(c_int, 4));
    d_bcd <= Std_logic_vector(To_Unsigned(d_int, 4));
    u_bcd <= Std_logic_vector(To_Unsigned(U_int, 4));
end hardware;