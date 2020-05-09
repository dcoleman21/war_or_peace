class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index) #this is passed as argument
    cards[index].rank   #this is asking for specific index position
  end

  def high_ranking_cards
    high_cards = []
    cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    total_card_count = cards.count
    high_cards_count = high_ranking_cards.count
    (high_cards_count.to_f / total_card_count * 100).round(2)
  end


  def remove_card
    cards.shift
  end

  def add_card(card)
    # cards << card
    cards.push(card)
  end
end
