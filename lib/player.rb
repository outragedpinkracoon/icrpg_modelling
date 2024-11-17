# frozen_string_literal: true

require_relative 'effort_names'

# TODO: add back test to check stats are not above 6!
class Player
  attr_accessor :name, :world, :type, :story, :life_form

  def initialize(name:, world:, life_form:, type:, story:, base_attributes:)
    @name = name
    @world = world
    @life_form = life_form
    @type = type
    @story = story
    @base_attributes = base_attributes
    @hero_coin = false
  end

  def base_efforts
    @base_efforts ||=
      {
        Efforts::Names::BASIC => 4,
        Efforts::Names::WEAPONS_AND_TOOLS => 6,
        Efforts::Names::GUNS => 8,
        Efforts::Names::ENERGY_AND_MAGIC => 10,
        Efforts::Names::ULTIMATE => 12
      }
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

  def attributes
    AttributeNames::ALL.each_with_object({}) do |attribute_name, obj|
      obj[attribute_name] = calculate_attribute(attribute_name)
    end
  end

  def efforts
    Efforts::Names::ALL.each_with_object({}) do |effort_name, obj|
      obj[effort_name] = calculate_effort(effort_name)
    end
  end

  private

  attr_reader :base_attributes

  def calculate_attribute(attribute_name)
    base_attributes[attribute_name] + (life_form.attribute_mods[attribute_name] || 0)
  end

  def calculate_effort(effort_name)
    base_efforts[effort_name] + (life_form.effort_mods[effort_name] || 0)
  end
end
