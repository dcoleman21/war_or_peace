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
    player1_rank = player1.deck.rank_of_card_at(0)
    player2_rank = player2.deck.rank_of_card_at(0)
    if player1_rank == player2_rank
      determine_war_type
    else
      :basic
    end
  end

  def determine_war_type
    player1_card2_rank = player1.deck.rank_of_card_at(2)
    player2_card2_rank = player2.deck.rank_of_card_at(2)
    if player1_card2_rank == player2_card2_rank
      :mutually_assured_destruction
    else
      :war
    end
  end

  def winner
    player1_rank = player1.deck.rank_of_card_at(0)
    player2_rank = player2.deck.rank_of_card_at(0)
    if player1_rank == player2_rank
      determine_war_winner
    elsif player1_rank > player2_rank
      player1
    else
      player2
    end
  end

  def determine_war_winner
    player1_card2_rank = player1.deck.rank_of_card_at(2)
    player2_card2_rank = player2.deck.rank_of_card_at(2)
    if player1_card2_rank == player2_card2_rank
      "no winner"
    elsif player1_card2_rank > player2_card2_rank
      player1
    else
      player2
    end
  end

  def pile_cards
    #if it's a basic turn, take top 2 cards of each deck and add to spoils_of_war
    if type == :basic
      @spoils_of_war << player1.deck.cards.shift
      @spoils_of_war << player2.deck.cards.shift
    elsif type == :war
      @spoils_of_war << player1.deck.cards.shift(3)
      @spoils_of_war << player2.deck.cards.shift(3)
    else
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
    winner.deck.cards.push(*@spoils_of_war)
  end
end
