# frozen_string_literal: true

# Represents a life form in the game
class LifeForm
  attr_reader :name

  def initialize(name:)
    @name = name
  end
end
