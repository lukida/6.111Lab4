`timescale 1ns / 1ps

module FSMTest3;

	// Inputs
	reg clock;
	reg passengerdoor;
	reg driverdoor;
	reg ignition;
	reg hidden;
	reg brakepedal;
	reg timer_status;
	reg reset;

	// Outputs
	wire fuelpump;
	wire status;
	wire siren;
	wire test_state;

	// Instantiate the Unit Under Test (UUT)
	FSM uut (
		.clock(clock), 
		.passengerdoor(passengerdoor), 
		.driverdoor(driverdoor), 
		.ignition(ignition), 
		.hidden(hidden), 
		.brakepedal(brakepedal), 
		.timer_status(timer_status), 
		.reset(reset), 
		.fuelpump(fuelpump), 
		.status(status), 
		.siren(siren), 
		.test_state(test_state)
	);

	always begin
		#5 clock = ~clock;
	end
	
	initial begin
		// Initialize Inputs
		clock = 0;
		passengerdoor = 0;
		driverdoor = 0;
		ignition = 0;
		hidden = 0;
		brakepedal = 0;
		timer_status = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		ignition = 1;
		// Add stimulus here

	end
      
endmodule

