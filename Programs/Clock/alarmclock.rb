#################################################################################
#ALARMCLOCK.RB																	#
#Author: Emily Castles															#
#Date: 27th October 2011														#
#Description: Definition of AlarmClock class - subclass of Clock class			# 
#################################################################################


require 'clock'

class AlarmClock < Clock
	attr_accessor :alarm_hours, :alarm_mins, :alarm_secs 
	
	def initialize(h,m,s,al_h,al_m,al_s)
		super h,m,s #inherits behaviour of h,m,s to initialize @hours, @mins, @secs instance variables 
		@alarmsound = :NOALARM
		
		#check that the alarm time hours are within the range 0  to 23, if not use a default value of 0 for the hours
		if al_h>=0 && al_h <=23
			then
			@alarm_hours = al_h
		else
			puts "Error: #{al_h} is an invlaid entry of hours for the alarm time.\nA default value of 0 will be used"
			@alarm_hours = 0		
		end
			
		#check that the alarm time minutes are within the range 0 to 59, if not use a default value of 0 for the minutes
		if al_m>=0 && al_m<=59
			then
			@alarm_mins = al_m
		else
			puts "Error: #{al_m} is an invalid entry of minutes for the alarm time\nA default value of 0 will be used"
			@alarm_mins = 0
		end
			
		#check that the alarm time seconds are within the range 0 to 59, if not use a default value of 0 for the seconds
		if al_s>=0 && al_s<=59
			then
			@alarm_secs = al_s
		else
			puts "Error: #{al_s} is an invalid entry of seconds for the alarm time\nA default value of 0 will be used"
			@alarm_secs = 0
		end
	
	end
	
	#increments the clock by 1 second - inherits this behaviour from superclass
	#Prints Beep Beep Beep! And the current time when the alarm clock time is reached
	def tick
		#method does what the superclass method does....
		super
		
		#...method also sounds the alarm	
		if @hours == @alarm_hours && @mins == @alarm_mins && @secs == @alarm_secs
			then
			puts "Beep Beep Beep!\nThe time is #{@hours}:#{@mins}:#{@secs}"
			@alarmsound = :ALARM #return ALARM for unit testing
		end
	end
	
	def on_or_off
		@alarmsound
	end

end

