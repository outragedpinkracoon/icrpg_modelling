# frozen_string_literal: true

# Represents a Player in the game
class Player
  attr_accessor :name, :world, :life_form, :type, :story
  attr_reader :attributes

  def initialize(name:, world:, life_form:, type:, story:, attributes:)
    @name = name
    @world = world
    @life_form = life_form
    @type = type
    @story = story
    @attributes = attributes
  end
end
