#################################################################################
#TC_ALARMCLOCK.RB																#
#Author: Emily Castles															#
#Date: 27th October 2011														#
#Description: Definition of AlarmClock class test case							# 
#################################################################################

require 'test/unit'
require 'clock'
require 'alarmclock'

class TC_AlarmClock < Test::Unit::TestCase

	#set up a new alarm clocks for testing - each alarm clock tests different parts of if/else loop in the initialize method
	def setup
		@alarmclock1 = AlarmClock.new(23,59,59,0,0,0)
		@alarmclock2 = AlarmClock.new(23,59,59,25,67,67)
	end
	
	def test_initialize
		#test for intialize for the first three variables has been carried out in tc_clock.rb
		#test here for initialization of alarm clock times
		assert_equal(@alarmclock1.alarm_hours, 0, 'assignment of hours incorrrect')
		assert_equal(@alarmclock1.alarm_mins, 0, 'assignment of mins incorrect')
		assert_equal(@alarmclock1.alarm_secs, 0, 'assignment of secs incorrect')
		assert_equal(@alarmclock2.alarm_hours, 0, 'assignment of hours incorrrect')
		assert_equal(@alarmclock2.alarm_mins, 0, 'assignment of mins incorrect')
		assert_equal(@alarmclock2.alarm_secs, 0, 'assignment of secs incorrect')
	end
		
	def test_tick
		#test of 'tick' has been carried out in tc_clock.rb
		#test here for alarm sound
		#instead of writing a specific method on_or_off that is only used by the unit test, could add an attr_accessor in the class definition for @alarmsound instance variable
		@alarmclock1.tick
		assert_equal(@alarmclock1.on_or_off, :ALARM, 'tick method not operating alarm sound correctly')
	end

	
end