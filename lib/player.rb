# frozen_string_literal: true

require_relative 'effort_names'

class Player
  attr_accessor :name, :world, :type, :story, :life_form
  attr_reader :base_attributes

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
        EffortNames::BASIC => 4,
        EffortNames::WEAPONS_AND_TOOLS => 6,
        EffortNames::GUNS => 8,
        EffortNames::ENERGY_AND_MAGIC => 10,
        EffortNames::ULTIMATE => 12
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

  def efforts
    {
      EffortNames::BASIC => calculate_effort(EffortNames::BASIC),
      EffortNames::WEAPONS_AND_TOOLS => calculate_effort(EffortNames::WEAPONS_AND_TOOLS),
      EffortNames::GUNS => calculate_effort(EffortNames::GUNS),
      EffortNames::ENERGY_AND_MAGIC => calculate_effort(EffortNames::ENERGY_AND_MAGIC),
      EffortNames::ULTIMATE => calculate_effort(EffortNames::ULTIMATE)
    }
  end

  private

  def calculate_attribute(attribute_name)
    base_attributes[attribute_name] + (@life_form.attribute_mods[attribute_name] || 0)
  end

  def calculate_effort(effort_name)
    base_efforts[effort_name] + (@life_form.effort_mods[effort_name] || 0)
  end
end
