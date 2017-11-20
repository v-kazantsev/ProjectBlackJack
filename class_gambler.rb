class Gambler
  attr_accessor :money, :points, :hand, :qtty
  def initialize
    @money = 100
    @points = 0
    @hand = []
    @qtty = 0
  end
  def make_bet
    self.money -= 10
  end
end