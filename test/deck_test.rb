require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_can_read_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_it_can_find_rank_of_card_at

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 14, deck.rank_of_card_at(2)
    assert_equal cards, deck.cards
  end

  def test_it_can_find_high_ranking_cards

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [], deck.high_ranking_cards
  end

  def test_it_can_find_percent_high_ranking
    skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_it_can_remove_card
    skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal cards, deck.remove_card
    assert_equal cards, deck.cards
    assert_equal [], deck.high_ranking_cards
    assert_equal 50.0, deck.percent_high_ranking
  end

  def test_it_can_add_new_card
    skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal cards, deck.add_card(card4)
    assert_equal cards, deck.cards
    assert_equal [], deck.high_ranking_cards
    assert_equal 33.33, deck.percent_high_ranking
  end
end







# pry(main)> deck.rank_of_card_at(0)
# #=> 12
#
# pry(main)> deck.rank_of_card_at(2)
# #=> 14
#
# pry(main)> deck.cards
# #=> [#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.percent_high_ranking
# #=> 66.67
#
# pry(main)> deck.remove_card
# #=> #<Card:0x007fbfd18490e8 @rank=12, @suit=:diamond, @value="Queen">
#
# pry(main)> deck.cards
# #=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.percent_high_ranking
# #=> 50.0
#
# pry(main)> card4 = Card.new(:club, '5', 5)
# #=> #<Card:0x007fbfd2963978 @rank=5, @suit=:club, @value="5">
#
# pry(main)> deck.add_card(card4)
#
# pry(main)> deck.cards
# #=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>, #<Card:0x007fbfd2963978...>]
#
# pry(main)> deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.percent_high_ranking
# #=> 33.33
