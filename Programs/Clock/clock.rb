#################################################################################
#CLOCK.RB																		#
#Author: Emily Castles															#
#Date: 27th October 2011														#
#Description: Definition of Clock class											# 
#################################################################################

class Clock

	attr_accessor :hours, :mins, :secs
	
	#reads hours, minutes and seconds into the Clock object to initilaize
	def initialize (h,m,s)
	
		#check that the hours are within the range 0  to 23, if not use a default value of 0 for the hours
		if h>=0 && h <=23
			then
			@hours = h
		else
			puts "Error: #{h} is an invlaid entry of hours\nA default value of 0 will be used"
			@hours = 0		
		end
		
		#check that the minutes are within the range 0 to 59, if not use a default value of 0 for the minutes
		if m>=0 && m<=59
			then
			@mins = m
		else
			puts "Error: #{m} is an invalid entry of minutes\nA default value of 0 will be used"
			@mins = 0
		end
		
		#check that the seconds are within the range 0 to 59, if not use a default value of 0 for the seconds
		if s>=0 && s<=59
			then
			@secs = s
		else
			puts "Error: #{s} is an invalid entry of seconds\nA default value of 0 will be used"
			@secs = 0
		end
	end
	
	#prints out a time 	(inherited by all subclasses of Clock)
	def to_s
		puts "#{@hours}:#{@mins}:#{@secs}"
	end
	
	#increments the clock by 1 second. Increments minutes and hours appropriately at upper boundaries
	def tick
	
		@secs +=1
		
		if @secs == 60
			then
			@mins += 1
			@secs = 0
			if @mins == 60
				then
				@hours += 1
				@mins = 0
				if @hours == 24
					then
					@hours = 0
				end
			end
		end
	end

end


