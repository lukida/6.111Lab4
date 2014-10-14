`timescale 1ns / 1ps

module SirenGenerator( 
	input clock,
	input one_hz_enable,
	input siren,
	output siren_noise;
    );

	reg low_tone;
	reg high_tone;
	reg[20:0]low_tone_counter;
	reg[20:0]high_tone_counter;
	reg toggle;	

	parameter LOW_TONE = 400;
	parameter HIGH_TONE = 700;
	parameter CLOCKFREQ = 27000000;
	
	initial begin
		low_tone = LOW_TONE;
		high_tone = HIGH_TONE;
		low_tone_counter = 0;
		high_tone_counter = 0;
	end
	
	always @(posedge clock) begin
		if (low_tone_counter  == CLOCKFREQ/LOW_TONE) begin
		low_tone <= ~low_tone;
		end
		if (low_tone_counter  >= CLOCKFREQ/LOW_TONE) begin
			low_tone_counter <= 0;
		end
		else 
			low_tone_counter <= low_tone_counter +1;
		end

		if (high_tone_counter  == CLOCKFREQ/HIGH_TONE) begin
		high_tone <= ~high_tone;
		end
		if (high_tone_counter  >= CLOCKFREQ/HIGh_TONE) begin
			high_tone_counter <= 0;
		end
		else 
			high_tone_counter <= high_tone_counter +1;
		end

		if (one_hz_enable == 1) begin
			toggle <= ~toggle;
		end

		if (siren == 1) begin
			if (toggle == 0) begin
				siren_noise <= low_tone;
			end
			else begin
				siren_noise <= high_tone;
			end
		end
		else begin
			siren_noise = 0;
		end

	end
	
endmodule
