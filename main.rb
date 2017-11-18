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
  interface.show_table(player, dealer)
  interface.show_hands(player,dealer)
  loop do
  break if player.passed == 3 || interface.choice == 'exit'
  if interface.choice == '3'
    interface.show_table(player, dealer)
    interface.show_open_hands(player,dealer)
  elsif
    interface.choice == '2'
    dealer.deal_to_player(player)
    player.points = dealer.calc_points(player)
    interface.show_table(player, dealer)
    interface.show_3_2(player,dealer)
  elsif 
    interface.choice == '1'
    player.passed
    dealer.deal_to_dealer if dealer.points <=18
    dealer.points = dealer.calc_points(dealer)
    interface.show_table(player, dealer)
    interface.show_hands(player,dealer)
  end
  interface.open_cards if player.points > dealer.points
  interface.show_choice
  
end
