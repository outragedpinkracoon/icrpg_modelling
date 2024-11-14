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
    calculate_attribute(AttributeNames::STR)
  end

  def con
    calculate_attribute(AttributeNames::CON)
  end

  def dex
    calculate_attribute(AttributeNames::DEX)
  end

  def cha
    calculate_attribute(AttributeNames::CHA)
  end

  def int
    calculate_attribute(AttributeNames::INT)
  end

  def wis
    calculate_attribute(AttributeNames::WIS)
  end

  private

  def calculate_attribute(attribute_name)
    base_attributes.send(attribute_name) + (@life_form.attribute_mods[attribute_name] || 0)
  end
end
