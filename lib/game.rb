# frozen_string_literal: true

require_relative 'code'

# This represents the board on which the game is played.
class Game
  def initialize(code = Code.new([]))
    @code = code
  end
end
