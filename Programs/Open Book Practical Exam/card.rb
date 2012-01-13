#declaration of constants
NO_KINDS = 13
NO_SUITS = 4
HAND_SIZE = 5
KINDS = {0=>:ACE, 1=>:TWO, 2=>:THREE, 3=>:FOUR, 4=>:FIVE, 5=>:SIX, 6=>:SEVEN, 7=>:EIGHT, 8=>:NINE, 9=>:TEN, 10=>:JACK, 11=>:QUEEN, 12=>:KING}
SUITS = {0=>:DIAMONDS, 1=>:HEARTS, 2=>:CLUBS, 3=>:SPADES}


class Card
	attr_accessor :kind, :suit
	
	def initialize (k, s)
		#TODO error check k and s within range
		@kind, @suit = KINDS[k], SUITS[s]
	end
	
	def to_s
		"#{@kind} of #{@suit}"
	end
	
	#overloading == operator for card class
	def == card
		@kind == card.kind && @suit == card.suit
	end
	
end

class Pack
	attr_accessor :pack #for test case only
	#pack stored as a hash table with boolean values representing cards presence in the pack
	def initialize
		@pack = {}
		0.upto(NO_KINDS-1) do |kind|
			0.upto(NO_SUITS-1) do |suit|
				@pack[Card.new(kind,suit)] = true #card in the pack => true, card not in pack =>false
			end
		end
	end
	
	def add(card)
		#TODO error check that pack is not already full
		@pack[card] == true
		return card
	end
	
	def remove(card)
		#TODO error check that card is in pack - this is done alread in the pick_random method
		@pack[card] = false
		return card
	end
	
	#picks a random card, removes from the pack (if it is present) and returns that card
	def pick_random

		k = rand(NO_KINDS)
		s = rand(NO_SUITS)
		card = Card.new(k,s)
		
		while @pack[card] == false do
			k = rand(NO_KINDS)
			s = rand(NO_SUITS)
			card = Card.new(k,s)
		end
		
		remove(card)
		return card
	end
	
	#creates a new hand and deals 5 cards
	def deal_hand
		hand = Hand.new
		HAND_SIZE.times do |i| 
			hand.add(pick_random)
		end
		return hand
	end

end

class Hand
	attr_accessor :hand
	
	#to allow for use of sort function on Hand class
	include Comparable
	
	#hand represented by a hash table of all cards - card value = true if it is present in the hand
	def initialize
		@hand = {}
		0.upto(NO_KINDS-1) do |kind|
			0.upto(NO_SUITS-1) do |suit|
				@hand[Card.new(kind,suit)] = false #card in the pack => true, card not in pack =>false
			end
		end
	end
	
	
	def add(card)
	#TODO error check that hand does not have more than 5 cards - taken care of by other methods at the moment
	#TODO error check that card is not already in the hand - taken care of by random card method error checking
		@hand[card] = true
	end
	
	def to_s
		str = "HAND: "
		@hand.each do |card, status|
			if status == true 
				str += "#{card.to_s}" + "; "
			end
		end
		return str
	end
	
	#spaceship operator so Comparable operators can be used (sort)
	def <=> hand
		if rank > hand.rank
			return 1
		elsif rank == hand.rank
			return 0
		else
			return -1
		end
	end
	
	#ranks hand based on count of card "kinds" which are stored in a hash table
	def rank
		hand_stats = []
		hand_stats = {:ACE=>0, :TWO=>0, :THREE=>0, :FOUR=>0, :FIVE=>0, :SIX=>0, :SEVEN=>0, :EIGHT=>0, :NINE=>0, :TEN=>0, :JACK=>0, :QUEEN=>0, :KING=>0}
		@hand.each do |card, status|
			if status == true 
				hand_stats[card.kind] += 1
			end
		end
		
		#find max "kind" count (there is a max method for this but can't figure it out so just writing it myself)
		rank = 0
		hand_stats.each do |card, count|
			if count > rank 
				rank = count
			end
		end
		
		
		return rank - 1
		
	end

end
		
################   PART 1 SCRIPT   #################
jack_hearts = Card.new(10,1)
random_card = Card.new(0,0)
count = 0
while random_card != jack_hearts do

	k = rand(NO_KINDS)
	s = rand(NO_SUITS)
	
	random_card = Card.new(k,s)
	count += 1
end
	
puts "Found #{random_card.to_s} after #{count} attempts"

##################   PART 2 SCRIPT  #################
pack = Pack.new
card1 = pack.pick_random
card2 = pack.pick_random
card3 = pack.pick_random
count = 1
while card1.kind != card2.kind || card2.kind != card3.kind || card3.kind != card1.kind do
	pack.add(card1)
	pack.add(card2)
	pack.add(card3)
	card1 = pack.pick_random
	card2 = pack.pick_random
	card3 = pack.pick_random
	count += 1
end

puts "Found three #{card1.kind}S after #{count} attempts"
puts card1.to_s
puts card2.to_s
puts card3.to_s

##################  PART 3 & 4 SCRIPT  ####################

pack = Pack.new
hands = []
4.times {|hand| hands << pack.deal_hand}
hands.sort! #how to sort descending??
hands.each {|hand| puts hand.to_s}