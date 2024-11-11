# frozen_string_literal: true

require_relative 'game'

# Represents the Computer Player Trying to Guess A Game
class Bot < Player
  def initialize
    super.initialize
    @all_possible_solutions = []
    1296.times do |i|
      @all_possible_solutions <<
        [i / 6 / 6 / 6 % 6, i / 6 / 6 % 6, i / 6 % 6, i % 6]
    end
  end
end
