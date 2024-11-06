# frozen_string_literal: true

require_relative 'code'

# This represents the board on which the game is played.
class Game
  def initialize(code = Code.new([]))
    @code = code
    @guesses_left = 10
  end

  def guess(arr)
    return unless @guesses_left > 0

    @guesses_left -= 1
    @sequence.compare(arr)
  end
end
