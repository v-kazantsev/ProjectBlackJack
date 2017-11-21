require_relative 'gambler'
class Player < Gambler
  
  attr_accessor :passed

  def initialize
    super
    @passed = 0
  end
end