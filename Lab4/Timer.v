`timescale 1ns / 1ps
module Timer(
	input reset,
	input reprogram, 
    input [1:0] choose_timer,
    input [3:0] timer_length,
    input [1:0] timer_interval,
	output reg [3:0] countdown
    );
	
	//making all the regs to hold the changing times
	reg [3:0] t_alarm_on;
	reg [3:0] t_passenger_delay;
	reg [3:0] t_driver_delay;
	reg [3:0] t_arm_delay;

	//making parameters
    parameter [1:0] T_ALARM_ON = 2'b11;
    parameter [1:0] T_PASSENGER_DELAY = 2'b10;
    parameter [1:0] T_DRIVER_DELAY = 2'b01;
    parameter [1:0] T_ARM_DELAY = 2'b00;
	
	initial begin
		t_alarm_on = 4'b1010;
		t_passenger_delay = 4'b1111;
		t_driver_delay = 4'b1000;
		t_arm_delay = 4'b0110;
	end
	
	always @(*) begin
		if (reprogram) begin //user input
			case (choose_timer)
				T_ALARM_ON: t_alarm_on = timer_length;
   				T_PASSENGER_DELAY: t_passenger_delay = timer_length;
   				T_DRIVER_DELAY: t_driver_delay = timer_length;
   				T_ARM_DELAY: t_arm_delay = timer_length;
			endcase
		end
		else if (reset) begin
			t_alarm_on = 4'b1010;
			t_passenger_delay = 4'b1111;
			t_driver_delay = 4'b1000;
			t_arm_delay = 4'b0110;
		end
		else begin
			case (timer_interval) 
				T_ALARM_ON: countdown = t_alarm_on;
   				T_PASSENGER_DELAY: countdown = t_passenger_delay;
   				T_DRIVER_DELAY: countdown = t_driver_delay;
   				T_ARM_DELAY: countdown = t_arm_delay;
			endcase
		end
	end
	

endmodule
