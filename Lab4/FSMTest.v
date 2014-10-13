`timescale 1ns / 1ps

module FSMTest;

	// Inputs
	reg clock;
	reg passengerdoor;
	reg driverdoor;
	reg ignition;
	reg hidden;
	reg brakepedal;
	reg timer_expired;


	// Outputs
	wire fuelpump;
	wire status;
	wire [31:0] siren;
	reg state;

	// Instantiate the Unit Under Test (UUT)
	FSM uut (
		.clock(clock), 
		.passengerdoor(passengerdoor), 
		.driverdoor(driverdoor), 
		.ignition(ignition), 
		.hidden(hidden), 
		.reset(reset),
		.brakepedal(brakepedal), 
		.fuelpump(fuelpump), 
		.status(status), 
		.siren(siren)
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
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		ignition = 1;

	end
      
endmodule

