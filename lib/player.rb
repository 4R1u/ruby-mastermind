# frozen_string_literal: true

require_relative 'game'

# TODO: implement player being able to create the code
# Represents a player
class Player
  attr_reader :wins

  def initialize
    @wins = 0
  end

  def attempt(game, arr)
    try = game.guess(arr)
    @wins += 1 if try[:red] == 4
  end
end
