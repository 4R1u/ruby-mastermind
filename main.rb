# frozen_string_literal: true

require_relative 'lib/code'
require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/bot'

type = 3
puts 'Do you want to be the creator (1) of the secret code or the guesser (2)? ' \
     'Enter 1 or 2'
type = gets.to_i until [1, 2].include?(type)

if type == 1
  bot = Bot.new
  loop do
    bot.blind_solve
    puts 'Do you want to quit? [y]'
    break if gets.chomp == 'y'
  end
  puts "Wins: #{bot.wins}"

else
  human = Player.new
  loop do
    game = Game.new
    loop do
      attempt = ''
      puts 'Enter a string of 4 numbers, all between 1 and 6 inclusive'
      attempt = gets.chomp until Code.valid_guess?(attempt)
      human.attempt(game, attempt.chars.map(&:to_i))
      break unless game.win_state == 'Indecisive'
    end
    puts 'Would you like to play again? [y]'
    next if gets.chomp.downcase == 'y'

    puts "Wins: #{human.wins}"
    puts "Losses: #{human.losses}"
    puts "W/L: #{human.losses.zero? ? 'Infinity' : human.wins / human.losses.to_f}"
  end
end
