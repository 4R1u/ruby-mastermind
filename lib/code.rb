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
    sequence = @sequence.map { |element| element }
    sequence.each_with_index do |item, index|
      if item == arr[index]
        result[:red] += 1
        arr[index] = sequence[index] = 0
      end
    end
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
