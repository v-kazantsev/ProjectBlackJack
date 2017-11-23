require_relative 'player'
require_relative 'dealer'

class Game
attr_accessor :winner

  def calc_points(obj)
    points = 0
    obj.hand.each do |card|
      if card.value > 0
        points += card.value
      else
        points = points + 11 > 21 ? points + 1 : points + 11
      end
    end
    points
  end

  def who_winner(player, dealer)
    self.winner = if player.points > 21 || dealer.points == 21
                    'dealer'
                  elsif
      dealer.points > 21 || player.points == 21
                    'player'
                  else
                    player.points > dealer.points ? 'player' : 'dealer'
                  end
    if winner == 'player'
      player.money += dealer.bank
    else
      dealer.money += dealer.bank
    end
    dealer.bank = 0
  end
end