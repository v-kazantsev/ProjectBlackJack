require_relative 'class_gambler'
require_relative 'class_player'
require_relative 'class_card'
class Dealer < Gambler
  attr_accessor :bank, :player_points, :dealer_points
  def initialize
    super
    @bank = 0
  end
  def deal_to_player(player)
    card = Card.new
    player.hand << card
    player.cards_qtty +=1
  end
  def calc_points(obj)
    points = 0
    obj.hand.each do |card| 
      if card.value > 0
        points += card.value
      else
        points = (points + card.value > 21) ? points + 1 : points + 11
      end
    end
    points
  end
  def deal_to_dealer
    card = Card.new
    @hand << card
  end

end

