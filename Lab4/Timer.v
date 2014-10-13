`timescale 1ns / 1ps
module Timer(
    input Start_Timer,
    input Timer_Length,
    input one_hz_enable,
    output Expired
    );
	
	//TODO: make the length longer than timer_length
	reg [24:0]Timer_Length_Copy;
	reg Start_Timer_Copy;
	
	initial begin
	Timer_Length_Copy = Timer_Length+1;
	Expired = 0;
	end
	
	always @(*) begin
		if (Start_Timer == 1) begin
			Timer_Length_Copy = Timer_Length;
			Expired = 0;
		end
		
		if (Timer_Length_Copy == 0) begin
			Expired = 1;
			Timer_Length_Copy = Timer_Length + 1;
		end
		else if (one_hz_enable == 1 && Timer_Length_Copy <= Timer_Length && Timer_Length_Copy > 0) begin
			Timer_Length_Copy = Timer_Length_Copy -1;
			Expired = 0;
		end
	end
	

endmodule
