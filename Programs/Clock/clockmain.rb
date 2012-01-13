#################################################################################
#CLOCKMAIN.RB																	#
#Author: Emily Castles															#
#Date: 27th October 2011														#
#Description: Program to initialize and execute three different clock classes	# 
#################################################################################

require 'clock'
require 'alarmclock'
require 'reverseclock'

#initialize an array to store data from the clock.dat file
clockdata = Array.new

#read data from the clock.dat file to the array
File.open("clock.dat").each do|line|
	clockdata << line
end

#initialize a Clock object using the data read in from the clock.dat file
clock = Clock.new(clockdata[0].to_i,clockdata[1].to_i,clockdata[2].to_i)

#initialize an Alarm CLock object using the data read in from the clock.dat file
alarmclock = AlarmClock.new(clockdata[0].to_i,clockdata[1].to_i,clockdata[2].to_i,clockdata[3].to_i,clockdata[4].to_i,clockdata[5].to_i)

#initialize a Reverse Clock object using the data read in from the clock.dat file
reverseclock = ReverseClock.new(clockdata[0].to_i,clockdata[1].to_i,clockdata[2].to_i)

clock.to_s #print the time
200000.times{clock.tick} #tick 200,000 times
clock.to_s #print the time

alarmclock.to_s #print the alarm clock time
200000.times{alarmclock.tick} #tick 200000 times
alarmclock.to_s #print the time

reverseclock.to_s #print the reverse clock time
200000.times{reverseclock.tick} #tick 200000 times
reverseclock.to_s#print the reverse clock time
