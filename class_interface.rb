require_relative 'class_player'
class Interface
  attr_accessor :player_name
  
  def initialize
    @player_name = 'John Doe'
  end

  def ask_name
    puts 'ВАШЕ ИМЯ?'
    self.player_name = gets.chomp
  end

  def show_hands(player,dealer)
    @str = ''
    player.hand.each { |card| @str += card.face + ' ' + card.suit + ' '}
    puts format(
      "%25s | %s", "#{player_name}: #{@str}", "ДИЛЕР: *** ***")
    puts format("%25s | %s", "ВАШИ ОЧКИ: #{player.points}", "ОЧКИ ДИЛЕРА: ")
  end

  def show_3_2(player,dealer)
    @str = ''
    player.hand.each { |card| @str += card.face + ' ' + card.suit + ' '}
    puts format(
      "%25s | %s", "#{player_name}: #{@str}", "ДИЛЕР: *** ***")
    puts format("%25s | %s", "ВАШИ ОЧКИ: #{player.points}", "ОЧКИ ДИЛЕРА: ")
  end

  def show_table(player,dealer)
    puts '-'*56
    puts "#{player_name},"
    puts format("%25s | %s", "У ВАС #{player.money} ГВИНЕЙСКИХ РУПИЙ", "У ДИЛЕРА #{dealer.money} ГВИНЕЙСКИХ РУПИЙ")
    puts '-'*56
    puts "               В БАНКЕ #{dealer.bank} ГВИНЕЙСКИХ РУПИЙ"
    puts '-'*56
  end

  def show_open_hands(player,dealer)
    @str = ''
    player.hand.each { |card| @str += card.face + ' ' + card.suit + ' '}
    @str2 = ''
    dealer.hand.each { |card| @str2 += card.face + ' ' + card.suit + ' '}
    puts format(
      "%25s | %s", "#{player_name}: #{@str} ", "ДИЛЕР: #{@str2}")
    puts format("%25s | %s", "ВАШИ ОЧКИ: #{player.points}", "ОЧКИ ДИЛЕРА: #{dealer.points} ")
  end

  def show_choice(player)
    puts 'ВАШ ВЫБОР:'
    puts '[1] ПРОПУСТИТЬ ХОД'
    puts '[2] ЕЩЕ КАРТУ' unless player.qtty > 2
    puts '[3] ОТКРЫТЬ КАРТЫ'
  end

  def dealer_pass
    puts 'ДИЛЕР ПРОПУСКАЕТ ХОД'
  end

  def dealer_take_card
    puts 'ДИЛЕР БЕРЕТ КАРТУ'
  end

  def show_winner(dealer)
    if dealer.winner == 'player'
      puts 'ВЫ ВЫИГРАЛИ'
    else
      puts 'ВЫ ПРОИГРАЛИ'
    end
  end

  def play_again
    puts '[1] ИГРАТЬ ЕЩЕ'
    puts '[2] ВЫХОД'
  end

  def game_over
    puts 'НЕДОСТАТОЧНО СРЕДСТВ ДЛЯ ПРОДОЛЖЕНИЯ ИГРЫ'
  end
end
