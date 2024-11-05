# frozen_string_literal: true

# Represents a Player in the game
class Player
  attr_accessor :name, :world, :life_form, :type, :story
  attr_reader :attributes, :efforts

  def initialize(name:, world:, life_form:, type:, story:, attributes:)
    @name = name
    @world = world
    @life_form = life_form
    @type = type
    @story = story
    @attributes = attributes
    @efforts = PlayerEfforts.new
    @hero_coin = false
  end

  def give_hero_coin
    @hero_coin = true
  end

  def remove_hero_coin
    @hero_coin = false
  end

  def hero_coin?
    @hero_coin
  end
end
