# frozen_string_literal: true

# Sequence of colors.
class Code
  def initialize(arr)
    return unless arr.all?((1..6)) && arr.length == 4

    @sequence = arr
  end
end
