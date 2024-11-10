# frozen_string_literal: true

require_relative 'game'

# Represents the Computer Player Trying to Guess A Game
class Bot
  attr_reader :wins

  def initialize
    @wins = 0
  end
end
