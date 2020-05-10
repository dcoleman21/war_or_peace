class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    else player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    end
  end

  def winner
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
      player2
    else player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.cards.shift
      @spoils_of_war << player2.deck.cards.shift
    elsif type == :war
      @spoils_of_war.concat player1.deck.cards.shift(3)
      @spoils_of_war.concat player2.deck.cards.shift(3)
    else type == :mutually_assured_destruction
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
    # add cards in @spoils_of_war to winner of turn
    winner.deck.add_card(spoils_of_war)
    @spoils_of_war = []
  end
end
