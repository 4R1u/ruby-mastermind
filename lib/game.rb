# frozen_string_literal: true

require_relative 'code'

# This represents the board on which the game is played.
class Game
  attr_reader :state

  def initialize(code = Code.new)
    @code = code.is_a?(Code) ? code : Code.new
    @guesses_left = 10
    @state = ''
  end

  def guess(arr)
    return unless @guesses_left.positive?

    @guesses_left -= 1
    @code.compare(arr)
  end
end
