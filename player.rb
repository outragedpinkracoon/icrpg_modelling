# frozen_string_literal: true

# Represents a Player in the game
class Player
  attr_accessor :name, :world, :life_form, :type

  def initialize(name:, world:, life_form:, type:)
    @name = name
    @world = world
    @life_form = life_form
    @type = type
  end
end
