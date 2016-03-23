require 'deck'
require 'game'
require 'player'
require 'card'

class Game

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @deck = Deck.new.shuffle
    @player1.cards = @deck[0..25]
    @player2.cards = @deck[26..51]
  end

  CONVERSION = {"J"=>11, "Q" => 12, "K" => 12, "A" => 13}

  def player1_card
    player1_card = @player1.cards.pop
  end

  def player2_card
    player2_card = @player2.cards.pop
  end

  def player1_card_value
    player1_card_value = CONVERSION[player1_card.value] || player1_card.value
  end

  def player2_card_value
    player2_card_value = CONVERSION[player2_card.value] || player2_card.value
  end

  def turn
    if player1_card_value > player2_card_value
      @player1.cards << player2_card
    elsif player2_card_value > player1_card_value
      @player2.cards << player1_card
    else
      war
    end
  end

  def war
    player1_ante = []
    player2_ante = []
    3.times do |i|
      card_1 = @player1.cards.pop
      player1_ante << card_1
      card_2 = @player2.cards.pop
      player2_ante << card_2
    end
    if player1_card_value > player2_card_value
      @player1.cards << player2_card
      @player1.cards << player2_ante
    elsif player2_card_value > player1_card_value
      @player2.cards << player1_card
      @player2.cards << player1_ante
    else
      war
    end
  end

end
