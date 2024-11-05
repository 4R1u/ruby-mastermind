# frozen_string_literal: true

require 'colorize'

# Sequence of colors.
class Code
  @@colors = [0, :red, :yellow, :green, :blue, :orange, :purple]
  def initialize(arr)
    return unless arr.all?((1..6)) && arr.length == 4

    @sequence = arr
  end
end
