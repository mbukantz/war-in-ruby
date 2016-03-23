require 'deck'
require 'game'
require 'player'
require 'card'

class Player
  attr_accessor :cards

  def initialize
    @cards = []
  end
end
