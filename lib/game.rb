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
    result = @code.compare(arr)
    puts @state += Code.new(arr).view << ' ' <<
                   view_result(result) << "\n"
    result
  end

  private

  def view_result(result)
    ('.' * result[:red])
      .colorize(color: :red, background: :black) +
      ('.' * result[:white])
      .colorize(color: :white, background: :black) +
      (' ' * (4 - result[:white] - result[:red]))
      .colorize(background: :black)
  end
end
