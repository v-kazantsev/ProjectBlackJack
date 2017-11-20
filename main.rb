require_relative 'class_interface'
require_relative 'class_dealer'
require_relative 'class_player'
interface = Interface.new
player = Player.new
dealer = Dealer.new
interface.ask_name
loop do
  if player.money < 10 || dealer.money < 10
    interface.game_over
    break
  end
  player.make_bet
  dealer.bank += 10
  dealer.make_bet
  dealer.bank += 10
  2.times { dealer.deal_to_player(player) }
  2.times { dealer.deal_to_dealer }
  player.points = dealer.calc_points(player)
  dealer.points = dealer.calc_points(dealer)
  interface.show_table(player, dealer)
  interface.show_hands(player,dealer)
  interface.show_choice
  loop do
    choice = gets.chomp
      if choice == '2'
        dealer.deal_to_player(player)
        player.points = dealer.calc_points(player)
        interface.show_table(player, dealer)
        interface.show_3_2(player,dealer)
      elsif 
        choice == '1'
        player.passed += 1
        if dealer.points <=18
          dealer.deal_to_dealer
          interface.dealer_take_card
        else
          interface.dealer_pass
        end
        dealer.points = dealer.calc_points(dealer)
        interface.show_table(player, dealer)
        interface.show_hands(player,dealer)
      end
    interface.show_choice
    break if player.points >= 21 || dealer.points >= 21 || player.passed == 3 ||
             choice == '3'
  end
  dealer.who_winner(player,dealer)
  interface.show_table(player,dealer)
  interface.show_open_hands(player,dealer)
  interface.show_winner(dealer)
  sleep(1)
  interface.play_again
  choice = gets.chomp
  break if choice == '2'
  player.hand.clear
  dealer.hand.clear
  player.passed = 0
end
