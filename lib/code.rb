# frozen_string_literal: true

require 'colorize'

# Sequence of colors.
class Code
  def initialize(arr = Array.new(4) { rand(1..6) })
    @sequence = Array.new(4) { rand(1..6) }
    return unless !arr.is_a?(Array) || (arr.all?((1..6)) && arr.length == 4)

    @sequence = arr
  end

  def self.valid_guess?(str)
    str.length == 4 && str.chars.all?('1'..'6')
  end

  def view
    colors = [0, :red, :yellow, :green, :blue, :light_yellow, :magenta]
    result = ''
    @sequence.each do |num|
      result += num.to_s.colorize(color: colors[num], background: :black)
    end
    result
  end

  def compare(arr)
    return unless arr.length == 4

    result = { white: 0, red: 0 }
    sequence = @sequence.map { |element| element }
    arr = arr.map { |element| element }
    result = count_red_pegs(arr, sequence, result)
    count_white_pegs(arr, sequence, result)
  end

  private

  def count_red_pegs(arr, sequence, result)
    sequence.each_with_index do |item, index|
      if item == arr[index]
        result[:red] += 1
        arr[index] = sequence[index] = 0
      end
    end
    result
  end

  def count_white_pegs(arr, sequence, result)
    arr.each_with_index do |item, index|
      next if item.zero?

      location = sequence.index(item)
      if location
        result[:white] += 1
        arr[index] = sequence[location] = 0
      end
    end
    result
  end
end
