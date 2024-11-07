# frozen_string_literal: true

require_relative 'base_efforts'

class Player
  class PlayerStateError < StandardError; end
  attr_accessor :name, :world, :type, :story
  attr_reader :attributes, :efforts, :life_form

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

  def life_form=(_)
    raise PlayerStateError, "Cannot change a players's life form, must create a new player"
  end

  def remove_hero_coin
    @hero_coin = false
  end

  def hero_coin?
    @hero_coin
  end
end
