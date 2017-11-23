require_relative 'gambler'
require_relative 'player'
require_relative 'card'

class Dealer < Gambler
  attr_accessor :bank, :deck

  def initialize
    super
    @bank = 0
    @deck = []
  end

  def make_deck
    while deck.size < 52 do
      card = Card.new
      deck << card unless deck.include? card
    end
  end

  def deal_to_player(player)
    card = deck.shift
    player.hand << card
  end

  def deal_to_dealer
    card = deck.shift
    @hand << card
  end
end
