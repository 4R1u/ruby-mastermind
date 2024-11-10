# frozen_string_literal: true

require_relative 'lib/code'
require_relative 'lib/game'
require_relative 'lib/player'

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
  break unless gets.chomp.downcase == 'y'
end
