#################################################################################
#REVERSECLOCK.RB																#
#Author: Emily Castles															#
#Date: 27th October 2011														#
#Description: Definition of ReverseClock class - subclass of Clock class		# 
#################################################################################

require 'clock'

class ReverseClock < Clock
	def initialize (h,m,s)
		super h,m,s #inherits behaviour of h,m,s to initialize @hours, @mins, @secs instance variables 
	end
	
	#decrements the clock by 1 second. Decrements minutes and hours appropriately at lower boundaries
	#overriding the tick method, no inheritance of behaviour from the superclass
	def tick
		@secs -=1
			
		if @secs == -1
			then
			@mins -= 1
			@secs = 59
			if @mins == -1
				then
				@hours -= 1
				@mins = 59
				if @hours == -1
					then
					@hours = 23
				end
			end
		end
		
	end
end
