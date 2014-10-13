`timescale 1ns / 1ps

module SirenGenerator( 
	input siren_signal,
	output siren_noise;
    );

	parameter 400hz = 1/400;
	parameter 700hz = 1/700;
	
	reg siren_noise = 400hz;
	
	initial begin 
		siren_noise = 0;
	end
	
	always begin
		#5 siren_noise = ~siren_noise;
	end

endmodule
