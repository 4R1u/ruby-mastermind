# frozen_string_literal: true

require_relative 'game'
require_relative 'player'

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

  def score_guess(solution_array, comparison_code, response_desired)
    responses_left = 0
    solution_array.each do |code|
      responses_left += 1 if comparison_code.compare(code) == response_desired
    end
    responses_left
  end

  def remove_guess(guess)
    new_space = ALL_GUESSES.map(&:itself)
    ALL_GUESSES.each_with_index do |code, index|
      new_space[index] = (code == guess ? ALL_GUESSES[index - 1] : code)
    end
    new_space
  end

  def next_guess(prev_guess, solution_array)
    maxima_in_all = remove_guess(prev_guess).map do |guess|
      score_guess(solution_array, Code.new(guess),
                  Code.new(prev_guess).compare(guess))
    end
    minimum = maxima_in_all.min
    solution_array.each do |guess|
      return guess if maxima_in_all[ALL_GUESSES.index(guess)] == minimum
    end
    ALL_GUESSES[maxima_in_all.index(minimum)]
  end
end
