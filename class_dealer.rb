require_relative 'class_gambler'
require_relative 'class_player'
require_relative 'class_card'

class Dealer < Gambler
  attr_accessor :bank, :player_points, :dealer_points, :winner

  def initialize
    super
    @bank = 0
  end

  def deal_to_player(player)
    card = Card.new
    player.hand << card
  end

  def deal_to_dealer
    card = Card.new
    @hand << card
  end

  def calc_points(obj)
    points = 0
    obj.hand.each do |card| 
      if card.value > 0
        points += card.value
      else
        points = (points + 11 > 21) ? points + 1 : points + 11
      end
    end
    points
  end

  def who_winner(player,dealer)
    if player.points > 21 || dealer.points == 21
      self.winner = 'dealer'
    elsif
      dealer.points > 21 || player.points == 21
      self.winner = 'player'
    else
      self.winner = player.points > dealer.points ? 'player' : 'dealer'
    end
    if winner == 'player'
      player.money += dealer.bank
    else
      dealer.money += dealer.bank
    end
    dealer.bank = 0
  end
end

