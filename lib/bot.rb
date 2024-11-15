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
  def solve(game)
    all_guesses = solutions = ALL_GUESSES.map(&:itself)
    guess = [1, 1, 2, 2]
    response = attempt(game, guess)
    until response[:red] == 4
      all_guesses.delete(guess)
      solutions = eliminate_responses(solutions, Code.new(guess), response)
      guess = next_guess(solutions, all_guesses)
      response = attempt(game, guess)
    end
  end

  private

  def eliminate_responses(solution_array, comparison_code, response_desired)
    solution_array.select do |code|
      comparison_code.compare(code) == response_desired
    end
  end

  def score_guess(solution_array, comparison_code)
    possible_responses = []
    5.times do |i|
      (5 - i).times { |j| possible_responses << { white: j, red: i } }
    end
    possible_responses.map do |response|
      solution_array.count do |code|
        comparison_code.compare(code) == response
      end
    end
    .max
  end

  def next_guess(solution_array, all_guesses)
    maxima_in_all = all_guesses.map do |guess|
      score_guess(solution_array, Code.new(guess))
    end
    minimum = maxima_in_all.min
    solution_array.each do |guess|
      return guess if maxima_in_all[all_guesses.index(guess)] == minimum
    end
    all_guesses[maxima_in_all.index(minimum)]
  end
end
