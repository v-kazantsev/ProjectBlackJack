require_relative 'class_gambler'
class Player < Gambler
  attr_accessor :cards_qtty, :passed
  def initialize
    super
    @cards_qtty = 0
    @passed = 0
  end
  def player_passed
    self.passed +=1
  end
end