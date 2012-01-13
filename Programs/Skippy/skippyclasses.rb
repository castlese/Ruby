#####################################################
#Point class: 	does not reference other classes	#
#				referenced by Kangaroo class		#
#####################################################
class Point
	attr_accessor :x, :y
	
	def initialize(x,y)
		@x = x
		@y = y
	end
	
	#+ operator overloading for Point class
	def + point
		Point.new(@x+point.x, @y+point.y)
	end
	
	# == comparison operator overloading for Point class
	def == point	
		@x == point.x && @y == point.y	
	end
	
	#print method for Point class
	def
		print_point
		p "(#{x}, #{y})"	
	end
end



#####################################################
#Die class:	 	does not reference other classes	#
#				referenced by Kangaroo class		#
#####################################################
class Die
		
	def initialize
		@direction = 0 #initial value only, dice is always thrown before a move is made
		@throw_stats = {:NORTH => 0, :SOUTH => 0, :EAST => 0, :WEST => 0} #define and initialise hash table for throw stats
				
	end
	
	def throw
		@direction = rand(4) #produce random number between 0 and 3 which will correspond to a direction
		
		if @direction == 0
			then @throw_stats[:NORTH] += 1 #increase the count for North direction in hash table
				:NORTH
		elsif @direction == 1
			then @throw_stats[:SOUTH] += 1
				:SOUTH
		elsif @direction == 2
			then @throw_stats[:EAST] += 1
				:EAST
		else 
			@throw_stats[:WEST] += 1
				:WEST
		end
	end
	
	def return_stats
		@throw_stats
	end
	
end


#############################################################
#Kangaroo class: 	references Point class and Die class	#
#					referenced by Random Walk class			#
#############################################################
class Kangaroo
	
	 
	def initialize(grid_size)
		@grid = grid_size
		@location = Point.new(0,0) #initial location is 0,0
		@dice = Die.new #defines and initializes a new dice object
		@home = Point.new(@grid-1, @grid-1) #defines home position
		
		#following four statements define distance and direction to hop depending on the direction returned by the dice
		@north = Point.new(0,1)
		@south = Point.new(0,-1)
		@east = Point.new(1,0)
		@west = Point.new(-1,0)
	end
	
	#predicate method to test if skippy is at home or not (i.e. is he at the end of the grid) 
	def at_home?
		if(@location == @home) # == comparison operator has been re-defined in the Point class
			then true
		else
			false
		end
	end
	
	#instead of using a method called at_boundary? (as suggested), I have created a predicate method
	#called movable_direction? which compares skippy's current location with the dice direection
	#If skippy is at a boundary, and an illegal dice direction has been returned, movable_diretion?
	#will return false
	def movable_direction?
		if(@location.x == 0 && @direction == :WEST)
			then false
		elsif(@location.x == @grid-1 && @direction == :EAST)
			then false
		elsif(@location.y == 0 && @direction == :SOUTH)
			then false
		elsif(@location.y == @grid-1 && @direction == :NORTH)
			then false
		else
			true
		end
	end
	
	#mutator method to move in a direction according to a throw of the dice
	def hop!
		@direction = @dice.throw #throw dice and read direction into  a variable

		#if the direction is illegal (due to skippy's location at a boundary), roll the dice again 
		#until a legal direction is returned
		while !movable_direction? do
			@direction = @dice.throw
		end
		
		#using @north, @south....etc variables defined previously, move skippy as per dice direction
		if @direction == :NORTH
			then @location = @location + @north
		elsif @direction == :SOUTH
			then @location = @location + @south
		elsif @direction == :EAST
			then @location = @location + @east
		else
			@location = @location + @west
		end
					
	end
	
	#method to print skippy's current location (calls Point method to print which has been defined above)
	def print_location
		@location.print_point	
	end
	#accessor method to pass dice stats from Die class to RandomWalk class
	def get_stats
		@dice.return_stats
	end

		

end

#################################################################################################
#RandomWalk class - references Kangaroo class. Does not reference Die class or Point class		#
#					is not referenced by other classes (apart from top level of program to run)	#
#################################################################################################
class RandomWalk
	attr_accessor :hops # instead of using no_of_hops method used attr_accessor here
	
	#initializer method for the RandomWalk class 
	def initialize(grid_size)
		@stats = {}
		@grid = grid_size #reads user input into a variable
		@skippy = Kangaroo.new(@grid) #initializes an instance of the Kangaroo class
		@hops = 0 #to record total number of hops taken in a trip
		@throws = 0 #initialize total number of dice throws - used in stats calcs
	end
	
	#starts skippy's walk and continues hopping until skippy has reached home
	def start!
		
		@skippy.print_location #prints initial location (i.e., (0,0))
		while !@skippy.at_home? do
			@skippy.hop!
			@skippy.print_location #print location after each hop (don't need a method for final_location)
			@hops += 1
		end
		
	end
	
	def stats
		@stats = @skippy.get_stats #get stats hash table from Kangaroo class (which in turn gets it from Die class)
		
		#add up total number of throws (as opposed to using total number of hops to get dice stats percentages)
		@stats.each do |key, value|
			@throws += value
		end
		
		#calculate the percentage stats and read this value into the hash table, overwriting the throw count figure
		#is it ok to overwrite like this? possibly better to store the new values elsewhere so all data remains?
		@stats.each do |key, value|
			@stats[key] = (value*100.0/@throws).round #use round here instead of integers which gave inaccurate percentages
		end
		
		#print stats as per assignment brief
		puts "Dice Stats: North #{@stats[:NORTH]}%, South #{@stats[:SOUTH]}%, East #{@stats[:EAST]}%, West #{@stats[:WEST]}%"	

	end
	
	#print skippy's final location - need a method to call print_location from Kangaroo class, which calls print_point from point class
	#this method is now not used as I am printing out the location AFTER each hop already
	def final_location
		puts "Skippy's final location is: #{@skippy.print_location}"
	end
end


