require_relative 'class_gambler'
class Player < Gambler
  attr_accessor :passed
  def initialize
    super
    @passed = 0
  end
end