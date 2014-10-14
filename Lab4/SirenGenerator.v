`timescale 1ns / 1ps

module SirenGenerator( 
	input siren_signal,
	output siren_noise;
    );

	reg low_tone;
	reg high_tone;
	reg[20:0]low_tone_counter;
	reg[20:0]high_tone_counter;
	
	parameter LOW_TONE = 400;
	parameter HIGH_TONE = 700;
	
	initial begin
		low_tone = LOW_TONE;
		high_tone = HIGH_TONE;
		low_tone_counter = 0;
		high_tone_counter = 0;
	end
	
	always @(posedge clock) begin
		//STUFFFFFFF
	end
	
endmodule
