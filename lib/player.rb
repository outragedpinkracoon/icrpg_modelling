# frozen_string_literal: true

require_relative 'efforts'

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
    Efforts::BASE
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
    Attributes::Names::ALL.each_with_object({}) do |attribute_name, obj|
      obj[attribute_name] = calculate_attribute(attribute_name)
    end
  end

  def efforts
    Efforts::Names::ALL.each_with_object({}) do |effort_name, obj|
      obj[effort_name] = calculate_effort(effort_name)
    end
  end

  def valid
    return true, [] if base_attributes.values.sum == 6

    [false, 'Base attributes must equal 6']
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
