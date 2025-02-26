library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package wb_orbit_intlk_regs_const_pkg is
  constant ADDR_ORBIT_INTLK_CTRL:                      std_logic_vector(31 downto 0) := x"00000000";
  constant ORBIT_INTLK_CTRL_EN_OFFSET:                 integer := 0;
  constant ORBIT_INTLK_CTRL_EN:                        std_logic_vector(31 downto 0) := x"00000001";
  constant ORBIT_INTLK_CTRL_CLR_OFFSET:                integer := 1;
  constant ORBIT_INTLK_CTRL_CLR:                       std_logic_vector(31 downto 0) := x"00000002";
  constant ORBIT_INTLK_CTRL_MIN_SUM_EN_OFFSET:         integer := 2;
  constant ORBIT_INTLK_CTRL_MIN_SUM_EN:                std_logic_vector(31 downto 0) := x"00000004";
  constant ORBIT_INTLK_CTRL_TRANS_EN_OFFSET:           integer := 3;
  constant ORBIT_INTLK_CTRL_TRANS_EN:                  std_logic_vector(31 downto 0) := x"00000008";
  constant ORBIT_INTLK_CTRL_TRANS_CLR_OFFSET:          integer := 4;
  constant ORBIT_INTLK_CTRL_TRANS_CLR:                 std_logic_vector(31 downto 0) := x"00000010";
  constant ORBIT_INTLK_CTRL_ANG_EN_OFFSET:             integer := 5;
  constant ORBIT_INTLK_CTRL_ANG_EN:                    std_logic_vector(31 downto 0) := x"00000020";
  constant ORBIT_INTLK_CTRL_ANG_CLR_OFFSET:            integer := 6;
  constant ORBIT_INTLK_CTRL_ANG_CLR:                   std_logic_vector(31 downto 0) := x"00000040";
  constant ORBIT_INTLK_CTRL_RESERVED_OFFSET:           integer := 7;
  constant ORBIT_INTLK_CTRL_RESERVED:                  std_logic_vector(31 downto 0) := x"7fffff80";
  constant ADDR_ORBIT_INTLK_STS:                       std_logic_vector(31 downto 0) := x"00000004";
  constant ORBIT_INTLK_STS_TRANS_BIGGER_X_OFFSET:      integer := 0;
  constant ORBIT_INTLK_STS_TRANS_BIGGER_X:             std_logic_vector(31 downto 0) := x"00000001";
  constant ORBIT_INTLK_STS_TRANS_BIGGER_Y_OFFSET:      integer := 1;
  constant ORBIT_INTLK_STS_TRANS_BIGGER_Y:             std_logic_vector(31 downto 0) := x"00000002";
  constant ORBIT_INTLK_STS_TRANS_BIGGER_LTC_X_OFFSET:  integer := 2;
  constant ORBIT_INTLK_STS_TRANS_BIGGER_LTC_X:         std_logic_vector(31 downto 0) := x"00000004";
  constant ORBIT_INTLK_STS_TRANS_BIGGER_LTC_Y_OFFSET:  integer := 3;
  constant ORBIT_INTLK_STS_TRANS_BIGGER_LTC_Y:         std_logic_vector(31 downto 0) := x"00000008";
  constant ORBIT_INTLK_STS_TRANS_BIGGER_ANY_OFFSET:    integer := 4;
  constant ORBIT_INTLK_STS_TRANS_BIGGER_ANY:           std_logic_vector(31 downto 0) := x"00000010";
  constant ORBIT_INTLK_STS_TRANS_BIGGER_OFFSET:        integer := 5;
  constant ORBIT_INTLK_STS_TRANS_BIGGER:               std_logic_vector(31 downto 0) := x"00000020";
  constant ORBIT_INTLK_STS_TRANS_BIGGER_LTC_OFFSET:    integer := 6;
  constant ORBIT_INTLK_STS_TRANS_BIGGER_LTC:           std_logic_vector(31 downto 0) := x"00000040";
  constant ORBIT_INTLK_STS_ANG_BIGGER_X_OFFSET:        integer := 7;
  constant ORBIT_INTLK_STS_ANG_BIGGER_X:               std_logic_vector(31 downto 0) := x"00000080";
  constant ORBIT_INTLK_STS_ANG_BIGGER_Y_OFFSET:        integer := 8;
  constant ORBIT_INTLK_STS_ANG_BIGGER_Y:               std_logic_vector(31 downto 0) := x"00000100";
  constant ORBIT_INTLK_STS_ANG_BIGGER_LTC_X_OFFSET:    integer := 9;
  constant ORBIT_INTLK_STS_ANG_BIGGER_LTC_X:           std_logic_vector(31 downto 0) := x"00000200";
  constant ORBIT_INTLK_STS_ANG_BIGGER_LTC_Y_OFFSET:    integer := 10;
  constant ORBIT_INTLK_STS_ANG_BIGGER_LTC_Y:           std_logic_vector(31 downto 0) := x"00000400";
  constant ORBIT_INTLK_STS_ANG_BIGGER_ANY_OFFSET:      integer := 11;
  constant ORBIT_INTLK_STS_ANG_BIGGER_ANY:             std_logic_vector(31 downto 0) := x"00000800";
  constant ORBIT_INTLK_STS_ANG_BIGGER_OFFSET:          integer := 12;
  constant ORBIT_INTLK_STS_ANG_BIGGER:                 std_logic_vector(31 downto 0) := x"00001000";
  constant ORBIT_INTLK_STS_ANG_BIGGER_LTC_OFFSET:      integer := 13;
  constant ORBIT_INTLK_STS_ANG_BIGGER_LTC:             std_logic_vector(31 downto 0) := x"00002000";
  constant ORBIT_INTLK_STS_INTLK_OFFSET:               integer := 14;
  constant ORBIT_INTLK_STS_INTLK:                      std_logic_vector(31 downto 0) := x"00004000";
  constant ORBIT_INTLK_STS_INTLK_LTC_OFFSET:           integer := 15;
  constant ORBIT_INTLK_STS_INTLK_LTC:                  std_logic_vector(31 downto 0) := x"00008000";
  constant ORBIT_INTLK_STS_TRANS_SMALLER_X_OFFSET:     integer := 16;
  constant ORBIT_INTLK_STS_TRANS_SMALLER_X:            std_logic_vector(31 downto 0) := x"00010000";
  constant ORBIT_INTLK_STS_TRANS_SMALLER_Y_OFFSET:     integer := 17;
  constant ORBIT_INTLK_STS_TRANS_SMALLER_Y:            std_logic_vector(31 downto 0) := x"00020000";
  constant ORBIT_INTLK_STS_TRANS_SMALLER_LTC_X_OFFSET: integer := 18;
  constant ORBIT_INTLK_STS_TRANS_SMALLER_LTC_X:        std_logic_vector(31 downto 0) := x"00040000";
  constant ORBIT_INTLK_STS_TRANS_SMALLER_LTC_Y_OFFSET: integer := 19;
  constant ORBIT_INTLK_STS_TRANS_SMALLER_LTC_Y:        std_logic_vector(31 downto 0) := x"00080000";
  constant ORBIT_INTLK_STS_TRANS_SMALLER_ANY_OFFSET:   integer := 20;
  constant ORBIT_INTLK_STS_TRANS_SMALLER_ANY:          std_logic_vector(31 downto 0) := x"00100000";
  constant ORBIT_INTLK_STS_TRANS_SMALLER_OFFSET:       integer := 21;
  constant ORBIT_INTLK_STS_TRANS_SMALLER:              std_logic_vector(31 downto 0) := x"00200000";
  constant ORBIT_INTLK_STS_TRANS_SMALLER_LTC_OFFSET:   integer := 22;
  constant ORBIT_INTLK_STS_TRANS_SMALLER_LTC:          std_logic_vector(31 downto 0) := x"00400000";
  constant ORBIT_INTLK_STS_ANG_SMALLER_X_OFFSET:       integer := 23;
  constant ORBIT_INTLK_STS_ANG_SMALLER_X:              std_logic_vector(31 downto 0) := x"00800000";
  constant ORBIT_INTLK_STS_ANG_SMALLER_Y_OFFSET:       integer := 24;
  constant ORBIT_INTLK_STS_ANG_SMALLER_Y:              std_logic_vector(31 downto 0) := x"01000000";
  constant ORBIT_INTLK_STS_ANG_SMALLER_LTC_X_OFFSET:   integer := 25;
  constant ORBIT_INTLK_STS_ANG_SMALLER_LTC_X:          std_logic_vector(31 downto 0) := x"02000000";
  constant ORBIT_INTLK_STS_ANG_SMALLER_LTC_Y_OFFSET:   integer := 26;
  constant ORBIT_INTLK_STS_ANG_SMALLER_LTC_Y:          std_logic_vector(31 downto 0) := x"04000000";
  constant ORBIT_INTLK_STS_ANG_SMALLER_ANY_OFFSET:     integer := 27;
  constant ORBIT_INTLK_STS_ANG_SMALLER_ANY:            std_logic_vector(31 downto 0) := x"08000000";
  constant ORBIT_INTLK_STS_ANG_SMALLER_OFFSET:         integer := 28;
  constant ORBIT_INTLK_STS_ANG_SMALLER:                std_logic_vector(31 downto 0) := x"10000000";
  constant ORBIT_INTLK_STS_ANG_SMALLER_LTC_OFFSET:     integer := 29;
  constant ORBIT_INTLK_STS_ANG_SMALLER_LTC:            std_logic_vector(31 downto 0) := x"20000000";
  constant ORBIT_INTLK_STS_MIN_SUM_BIGGER_OFFSET:      integer := 30;
  constant ORBIT_INTLK_STS_MIN_SUM_BIGGER:             std_logic_vector(31 downto 0) := x"40000000";
  constant ORBIT_INTLK_STS_RESERVED_OFFSET:            integer := 31;
  constant ORBIT_INTLK_STS_RESERVED:                   std_logic_vector(31 downto 0) := x"80000000";
  constant ADDR_ORBIT_INTLK_MIN_SUM:                   std_logic_vector(31 downto 0) := x"00000008";
  constant ADDR_ORBIT_INTLK_TRANS_MAX_X:               std_logic_vector(31 downto 0) := x"0000000c";
  constant ADDR_ORBIT_INTLK_TRANS_MAX_Y:               std_logic_vector(31 downto 0) := x"00000010";
  constant ADDR_ORBIT_INTLK_ANG_MAX_X:                 std_logic_vector(31 downto 0) := x"00000014";
  constant ADDR_ORBIT_INTLK_ANG_MAX_Y:                 std_logic_vector(31 downto 0) := x"00000018";
  constant ADDR_ORBIT_INTLK_TRANS_MIN_X:               std_logic_vector(31 downto 0) := x"0000001c";
  constant ADDR_ORBIT_INTLK_TRANS_MIN_Y:               std_logic_vector(31 downto 0) := x"00000020";
  constant ADDR_ORBIT_INTLK_ANG_MIN_X:                 std_logic_vector(31 downto 0) := x"00000024";
  constant ADDR_ORBIT_INTLK_ANG_MIN_Y:                 std_logic_vector(31 downto 0) := x"00000028";
  constant ADDR_ORBIT_INTLK_TRANS_X_DIFF:              std_logic_vector(31 downto 0) := x"0000002c";
  constant ADDR_ORBIT_INTLK_TRANS_Y_DIFF:              std_logic_vector(31 downto 0) := x"00000030";
  constant ADDR_ORBIT_INTLK_ANG_X_DIFF:                std_logic_vector(31 downto 0) := x"00000034";
  constant ADDR_ORBIT_INTLK_ANG_Y_DIFF:                std_logic_vector(31 downto 0) := x"00000038";
end package wb_orbit_intlk_regs_const_pkg;
