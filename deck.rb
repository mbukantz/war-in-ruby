require 'deck'
require 'game'
require 'player'
require 'card'

class Deck
  VALUES = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]
  SUITS = ["H","D","C","S"]

  def initialize
    @deck = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @deck << Card.new(suit,value)
      end
    end
  end

  def print_deck
    @deck.each do |card|
      puts "#{card.value} #{card.suit}"
    end
  end

  def shuffle
    @deck.shuffle
  end

end
