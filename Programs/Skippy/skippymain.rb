#########################################################################
#SKIPPYMAIN																#
#Author: Emily Castles													#
#Date: 7th October 2011													#
#Description: Program to guide skippy the kangaroo home through a grid	# 
#########################################################################

require 'skippyclasses' #classes are defined in this file

puts "************************************************"
puts "*******Welcome to Skippy's Walk of Shame********"
puts "************************************************"

puts " "
puts "Please enter the dimension of Skippy's grid:"
grid_size = gets.chomp.to_i #reads user input to a local variable and converts to an integer

#error check user input
if grid_size < 1
	then puts "Error - please enter an integer greater than or equal to 1"
end

walk = RandomWalk.new(grid_size)#initialize an instance of RandomWalk class
puts "Here is Skippy's journey:"
walk.start! #start the journey - continue until skippy reaches home
puts "Total number of hops taken: #{walk.hops}" #print total number of hops taken
walk.stats #process stats and print to screen


 