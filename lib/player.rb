# frozen_string_literal: true

require_relative 'base_efforts'

class Player
  attr_accessor :name, :world, :type, :story, :life_form
  attr_reader :attributes, :efforts

  def initialize(name:, world:, life_form:, type:, story:, attributes:)
    @name = name
    @world = world
    @life_form = life_form
    @type = type
    @story = story
    @attributes = attributes
    @efforts = BaseEfforts.new
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
