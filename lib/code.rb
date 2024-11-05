# frozen_string_literal: true

require 'colorize'

# Sequence of colors.
class Code
  def initialize(arr)
    return unless arr.all?((1..6)) && arr.length == 4

    @sequence = arr
  end

  def view
    colors = [0, :red, :yellow, :green, :blue, :orange, :purple]
    @sequence.each do |num|
      puts num.to_s.colorize(color: colors[num], background: :black)
    end
  end
end
