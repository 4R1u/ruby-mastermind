# frozen_string_literal: true

require_relative 'code'

# This represents the board on which the game is played.
class Game
  attr_reader :state, :win_state

  def initialize(code = Code.new)
    @code = code.is_a?(Code) ? code : Code.new
    @guesses_left = 10
    @state = ''
    @win_state = 'Indecisive'
  end

  def guess(arr)
    return if @win_state == 'Won'

    unless @guesses_left.positive?
      @win_state = 'Lost'
      return
    end

    @guesses_left -= 1
    result = @code.compare(arr)
    puts @state += Code.new(arr).view << ' ' <<
                   view_result(result) << "\n"
    @win_state = 'Won' if result[:red] == 4
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
