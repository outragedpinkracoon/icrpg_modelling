# frozen_string_literal: true

require_relative 'base_efforts'

class Player
  attr_accessor :name, :world, :type, :story, :life_form
  attr_reader :base_attributes, :efforts

  def initialize(name:, world:, life_form:, type:, story:, base_attributes:)
    @name = name
    @world = world
    @life_form = life_form
    @type = type
    @story = story
    @base_attributes = base_attributes
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
