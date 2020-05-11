require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class GameRunner

  def start
    cards = []
    cards << Card.new(:heart, 'Jack', 11)
    cards << Card.new(:heart, '10', 10)
    cards << Card.new(:heart, '9', 9)
    cards << Card.new(:diamond, 'Jack', 11)
    cards << Card.new(:heart, '8', 8)
    cards << Card.new(:diamond, 'Queen', 12)
    cards << Card.new(:heart, '3', 3)
    cards << Card.new(:diamond, '2', 2)
    cards << Card.new(:spade, 'Ace', 1)
    cards << Card.new(:club, '2', 2)
    cards << Card.new(:spade, 'Queen', 12)
    cards << Card.new(:heart, '4', 4)
    cards << Card.new(:diamond, '3', 3)
    cards << Card.new(:spade, 'King', 13)
    cards << Card.new(:club, '7', 7)
    cards << Card.new(:diamond, '4', 4)
    cards << Card.new(:heart, '6', 6)
    cards << Card.new(:club, '10', 10)
    cards << Card.new(:spade, 'Jack', 11)
    cards << Card.new(:club, '8', 8)
    cards << Card.new(:spade, '4', 4)
    cards << Card.new(:diamond, 'Ace', 1)
    cards << Card.new(:heart, '5', 5)
    cards << Card.new(:spade, '5', 5)
    cards << Card.new(:club, '6', 6)
    cards << Card.new(:spade, '6', 6)
    cards << Card.new(:club, 'Jack', 11)
    cards << Card.new(:heart, '7', 7)
    cards << Card.new(:diamond, '5', 5)
    cards << Card.new(:spade, '7', 7)
    cards << Card.new(:club, 'Ace', 1)
    cards << Card.new(:heart, 'King', 13)
    cards << Card.new(:club, '9', 9)
    cards << Card.new(:spade, '8', 8)
    cards << Card.new(:diamond, '6', 6)
    cards << Card.new(:club, '5', 5)
    cards << Card.new(:heart, 'Queen', 12)
    cards << Card.new(:club, '4', 4)
    cards << Card.new(:diamond, '7', 7)
    cards << Card.new(:spade, '3', 3)
    cards << Card.new(:diamond, '8', 8)
    cards << Card.new(:club, 'King', 13)
    cards << Card.new(:heart, '2', 2)
    cards << Card.new(:diamond, '9', 9)
    cards << Card.new(:spade, '9', 9)
    cards << Card.new(:club, 'Queen', 12)
    cards << Card.new(:diamond, '10', 10)
    cards << Card.new(:heart, 'Ace', 1)
    cards << Card.new(:spade, '10', 10)
    cards << Card.new(:club, '3', 3)
    cards << Card.new(:spade, '2', 2)
    cards << Card.new(:diamond, 'King', 13)
    cards.shuffle
    deck1 = Deck.new(cards.pop(26))
    deck2 = Deck.new(cards)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!"

    input = gets.chomp
    turn_count = 0
    if input.downcase == 'go'
      1000000.times do
        turn = Turn.new(player1, player2)
        turn.pile_cards
        if turn.type == :basic # when played, not reading this as a :basic turn. Need to check type in turn class
          turn.spoils_of_war.count
          turn.award_spoils(turn.winner)
          puts "#{turn_count} #{winner.name} won 2 cards"
        elsif turn.type == :war
          turn.spoils_of_war
          turn.award_spoils(turn.winner)
          puts "#{turn_count} #{winner.name} won 6 cards"
        elsif turn.type == :mutually_assured_destruction # Is not liking the string "No Winner". Need to figure out winner method in turn class 
          turn.spoils_of_war = []
          puts "#{turn_count} *mutually assured destruction* 6 cards removed from play"
        end

        winner = turn.winner
        puts "#{turn_count} #{winner.name} won 2 cards"
        turn_count += 1
      end
    end
  end
end
