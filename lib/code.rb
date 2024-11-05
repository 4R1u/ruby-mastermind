# frozen_string_literal: true

require 'colorize'

# Sequence of colors.
class Code
  def initialize(arr)
    @sequence = []
    return unless arr.all?((1..6)) && arr.length == 4

    @sequence = arr
  end

  def view
    colors = [0, :red, :yellow, :green, :blue, :orange, :purple]
    @sequence.each do |num|
      print num.to_s.colorize(color: colors[num], background: :black)
    end
    puts
  end

  def push(num)
    if !(1..6).cover?(num)
      puts 'Must be a valid number (1-6).'
    elsif @sequence.length >= 4
      puts 'Code full'
    else
      @sequence << num
    end
  end
end
