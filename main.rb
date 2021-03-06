require_relative 'interface'
require_relative 'dealer'
require_relative 'player'
require_relative 'game'

interface = Interface.new
player = Player.new
dealer = Dealer.new
game = Game.new
interface.ask_name
loop do
  if player.money < 10 || dealer.money < 10
    interface.game_over
    break
  end
  dealer.make_deck
  player.make_bet
  dealer.bank += 10
  dealer.make_bet
  dealer.bank += 10
  2.times { dealer.deal_to_player(player) }
  player.qtty = 2
  2.times { dealer.deal_to_dealer }
  dealer.qtty = 2
  player.points = game.calc_points(player)
  dealer.points = game.calc_points(dealer)
  interface.show_table(player, dealer)
  interface.show_hands(player,dealer)
  interface.show_choice(player)
  loop do
    choice = gets.chomp
      if choice == '2'
        dealer.deal_to_player(player)
        player.qtty += 1
        player.points = game.calc_points(player)
        interface.show_table(player, dealer)
        interface.show_hands(player,dealer)
      elsif 
        choice == '1'
        player.passed += 1
        if dealer.points < 18
          dealer.deal_to_dealer unless dealer.hand.size > 2
          dealer.qtty += 1
          interface.dealer_take_card
        else
          interface.dealer_pass
        end
        dealer.points = game.calc_points(dealer)
        interface.show_table(player, dealer)
        interface.show_hands(player,dealer)
      end
    interface.show_choice(player)
    break if player.points >= 21 || dealer.points >= 21 || player.passed == 3 ||
             choice == '3' || dealer.hand.size == 3
  end
 game.who_winner(player,dealer)
  interface.show_table(player,dealer)
  interface.show_open_hands(player,dealer)
  interface.show_winner(game)
  sleep(1)
  interface.play_again
  choice = gets.chomp
  break if choice == '2'
  player.hand.clear
  dealer.hand.clear
  player.passed = 0
end
