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

  def str
    base_attributes.str + (@life_form.attribute_mods[AttributeNames::STR] || 0)
  end

  def con
    base_attributes.con + (@life_form.attribute_mods[AttributeNames::CON] || 0)
  end

  def dex
    base_attributes.dex + (@life_form.attribute_mods[AttributeNames::DEX] || 0)
  end

  def cha
    base_attributes.cha + (@life_form.attribute_mods[AttributeNames::CHA] || 0)
  end

  def int
    base_attributes.int + (@life_form.attribute_mods[AttributeNames::INT] || 0)
  end

  def wis
    base_attributes.wis + (@life_form.attribute_mods[AttributeNames::WIS] || 0)
  end
end
