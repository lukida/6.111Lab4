library verilog;
use verilog.vl_types.all;
entity FSM is
    generic(
        armed           : integer := 0;
        wait1           : integer := 1;
        siren_state     : integer := 2;
        disarm          : integer := 3;
        timer           : integer := 4;
        timer_expired   : integer := 5;
        unknown         : integer := 6
    );
    port(
        clock           : in     vl_logic;
        passengerdoor   : in     vl_logic;
        driverdoor      : in     vl_logic;
        ignition        : in     vl_logic;
        hidden          : in     vl_logic;
        brakepedal      : in     vl_logic;
        timer_status    : in     vl_logic;
        reset           : in     vl_logic;
        fuelpump        : out    vl_logic;
        status          : out    vl_logic;
        siren           : out    vl_logic;
        state           : out    vl_logic_vector(3 downto 0)
    );
end FSM;
