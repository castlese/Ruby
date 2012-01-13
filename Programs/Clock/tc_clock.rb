require 'test/unit'
require 'clock'

#################################################################################
#TC_CLOCK.RB																	#
#Author: Emily Castles															#
#Date: 27th October 2011														#
#Description: Definition of Clock class test case								# 
#################################################################################

class TC_Clock < Test::Unit::TestCase

	#set up a new clocks for testing - each clock tests different parts of if/else loop in the initialize method
	def setup
		@clock1 = Clock.new(23,59,59)
		@clock2 = Clock.new(25,63,63)
	end
	
	#test the initialize method by checking that all values for hours, minutes and seconds are within appropriate ranges
	def test_initialize
		assert_equal(@clock1.hours, 23, 'assignment of hours incorrrect')
		assert_equal(@clock1.mins, 59, 'assignment of mins incorrect')
		assert_equal(@clock1.secs, 59, 'assignment of secs incorrect')
		#instead of checking the bounds below, could use an assert_equal check to check that values have been assigned to 0
		assert(@clock2.hours >= 0 && @clock2.hours <= 23 , 'new clock hours value out of bounds')
		assert(@clock2.mins >= 0 && @clock2.mins <= 59, 'new clock minutes value out of bounds')
		assert(@clock2.secs >= 0 && @clock2.secs <= 59, 'new clock seconds value out of bounds')
	end
	
	#no test of to_s method as it is effectively self testing
	
	#test the tick method by checking that all values for hours, minutes and seconds are within appropriate ranges after the method has been carried out
	def test_tick
		@clock1.to_s
		@clock1.tick
		@clock1.to_s
		assert_equal(@clock1.secs, 0, 'tick not operating correctly')
		assert_equal(@clock1.mins, 0, 'tick not operating correctly')
		assert_equal(@clock1.hours, 0, 'tick not operating correctly')
		#test to check that hours, mins and secs are within appropriate bounds - do I need to include this? 
		#Probably do not need as values for hours, mins and secs are being tested above already. Leave it in anyway..
		assert(@clock1.hours >= 0 && @clock1.hours <= 23, 'clock hours value out of bounds')
		assert(@clock1.mins >= 0 && @clock1.mins <= 59, 'clock minutes value out of bounds')
		assert(@clock1.mins >= 0 && @clock1.mins <= 59, 'clock seconds value out of bounds')
	end
	
end