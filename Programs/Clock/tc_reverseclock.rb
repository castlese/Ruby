#################################################################################
#TC_REVERSECLOCK.RB																#
#Author: Emily Castles															#
#Date: 27th October 2011														#
#Description: Definition of ReverseClock class test case						# 
#################################################################################

require 'test/unit'
require 'clock'
require 'reverseclock'

class TC_ReverseClock < Test::Unit::TestCase

	def setup
		@reverseclock = ReverseClock.new(0,0,0)
	end
	
	#initialize is inherited from Clock class - no need to test initialize here as it is identical
	
	#test the tick method in ReverseClock class
	def test_tick
		@reverseclock.tick
		#test that the hours, mins and secs values are as they should be after tick is invoked
		assert_equal(@reverseclock.hours, 23, 'tick not operating correctly')
		assert_equal(@reverseclock.mins, 59, 'tick not operating correctly')
		assert_equal(@reverseclock.secs, 59, 'tick not operating correctly')
		#As before, not sure if i need to test whether the hours, mins and secs are within the appropriate bounds as have tested them already above
		#leaving it in anyway but probably don't need it.
		assert(@reverseclock.hours >= 0 && @reverseclock.hours <= 23, 'reverse clock hours value out of bounds')
		assert(@reverseclock.mins >= 0 && @reverseclock.mins <= 59, 'reverse clock minutes value out of bounds')
		assert(@reverseclock.mins >= 0 && @reverseclock.mins <= 59, 'reverse clock seconds value out of bounds')
	end
	
end