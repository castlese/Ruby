require 'test/unit'
require 'card'
#this test case is untested as my compiler is giving an error for "require" statements. 
class TC_Card < Test::Unit::TestCase

	def setup
		my_card = Card.new(11,1)
	end
	def test_initialize
		assert_equal(:QUEEN, my_card.kind)
		assert_equal(:HEARTS, my_card.suit)
	end
   
  
end

class TC_Pack < Test::Unit::TestCase

	def setup
		my_pack = Pack.new
		my_card = Card.new(11,1)
	end
	
	def test_initialize
		my_pack.pack.each {|card|assert_equal(true, my_pack.pack[card])}
	end

	#also tests remove
	def test_pick_random
		new_card = my_pack.pick_random
		assert_equal(false, my_pack.pack[new_card])
	end
	
	#test add
	def test_add
		my_pack.add(new_card)
		assert_equal(true, my_pack.pack[new_card])
	end
	
	#test deal_hand
	def test_deal_hand
		my_hand = my_pack.deal_hand
		assert_equal(5, my_hand.length)
	end
end

class TC_Hand
	#set up with 4 cards, add the fifth using the test_add method
	def setup
		card1 = Card.new(11,1)
		card2 = Card.new(1,1)
		card3 = Card.new(11,2)
		card4 = Card.new(11,3)
		my_card = Card.new(3,3)
		my_hand = Hand.new
		my_hand.hand[card1] = true
		my_hand.hand[card2] = true
		my_hand.hand[card3] = true
		my_hand.hand[card4] = true
				
	end
	
	#test add
	def test_add
		my_hand.add(my_card)
		assert_equal(true, my_hand.hand[my_card])
	end
	
	#test rank
	def test_rank
		assert_equal(2,my_hand.rank)
	end
end