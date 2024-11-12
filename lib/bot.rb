# frozen_string_literal: true

require_relative 'game'

ALL_GUESSES = (0..1295).map do |i|
  [(i / 6 / 6 / 6 % 6) + 1,
   (i / 6 / 6 % 6) + 1,
   (i / 6 % 6) + 1,
   (i % 6) + 1]
end

# Represents the Computer Player Trying to Guess A Game
class Bot < Player
  private

  def eliminate_responses(solution_array, comparison_code, response_desired)
    solution_array.select do |code|
      comparison_code.compare(code) == response_desired
    end
  end

  def next_guess(prev_guess, solution_array)
    maxima_in_all = ALL_GUESSES.map do |guess|
      eliminate_responses(
        solution_array, guess, Code.new(prev_guess).compare(guess)
      ).length
    end
    minimum = maxima_in_all.min
    solution_array.each do |guess|
      return guess if maxima_in_all[ALL_GUESSES.index(guess)] == minimum
    end
    minimum
  end
end
