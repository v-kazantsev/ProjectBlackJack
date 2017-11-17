require_relative 'class_interface'
require_relative 'class_dealer'
require_relative 'class_player'
interface = Interface.new
player = Player.new
dealer = Dealer.new

interface.ask_name
#loop do
  player.make_bet
  dealer.make_bet
  2.times { dealer.deal_to_player(player) }
  2.times { dealer.deal_to_dealer }
  player.points = dealer.calc_points(player)
  dealer.points = dealer.calc_points(dealer)
  loop do
  interface.show_table(player, dealer)
  if interface.choice == '3'
    interface.show_open_hands(player,dealer)
  else
    interface.show_hands(player,dealer)
  end
  
  interface.show_choice
  break if interface.choice == 'exit'
end
