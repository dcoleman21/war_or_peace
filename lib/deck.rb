class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards

  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    high_cards = []
    cards.each do |card|
      if card.rank >= 11
        high_cards << card
      require "pry"; binding.pry
    end
  end
  #
  # def percent_high_ranking(n)
  #   #.percents
  # end
  #
  # def remove_card
  #
  # end
  #
  # def add_card
  #
  # end
end


# working of hotfix for this hotfix branch 
