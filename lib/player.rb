# frozen_string_literal: true

require_relative 'game'

# TODO: implement player being able to create the code
# Represents a player
class Player
  attr_reader :wins, :losses

  def initialize
    @wins = 0
    @losses = 0
  end

  def attempt(game, arr)
    try = game.guess(arr)
    if game.win_state == 'Won'
      @wins += 1
    elsif game.win_state == 'Lost'
      @losses += 1
    end
    try
  end
end
