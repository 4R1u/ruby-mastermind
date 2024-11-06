# frozen_string_literal: true

require 'colorize'

# Sequence of colors.
class Code
  def initialize(arr)
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

  def push(num)
    if !(1..6).cover?(num)
      puts 'Must be a valid number (1-6).'
    elsif @sequence.length >= 4
      puts 'Code full'
    else
      @sequence << num
    end
    nil
  end

  def compare(arr)
    return unless array.length == 4

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
