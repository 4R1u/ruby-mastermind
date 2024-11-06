# frozen_string_literal: true

require 'colorize'

# Sequence of colors.
class Code
  def initialize(arr = Array.new(4) { rand(1..6) })
    @sequence = Array.new(4) { rand(1..6) }
    return unless !arr.is_a?(Array) || (arr.all?((1..6)) && arr.length == 4)

    @sequence = arr
  end

  def view
    colors = [0, :red, :yellow, :green, :blue, :light_yellow, :magenta]
    @sequence.each do |num|
      print num.to_s.colorize(color: colors[num], background: :black)
    end
    puts
  end

  def compare(arr)
    return unless arr.length == 4

    result = { white: 0, red: 0 }
    arr.each_with_index do |num, index|
      if num == @sequence[index]
        result[:red] += 1
      elsif @sequence.include?(num)
        result[:white] += 1
      end
    end
    result
  end
end
