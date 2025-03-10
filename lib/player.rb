# frozen_string_literal: true

require_relative 'efforts'

class Player
  attr_accessor :name, :world, :type, :story, :life_form, :max_health, :current_health

  MIN_HEALTH = 0

  def initialize(name:, world:, life_form:, type:, story:, base_attributes:, max_health: 10)
    @name = name
    @world = world
    @life_form = life_form
    @type = type
    @story = story
    @base_attributes = base_attributes
    @hero_coin = false
    @max_health = max_health
    @current_health = max_health
    @equipment = []
  end

  # plus defense related loot
  def defense
    base_defense = attributes[Attributes::Names::CON] + 10
    equipment_defense = equipment.sum { |item| item.defense_mod || 0 }
    base_defense + equipment_defense
  end

  def take_damage(amount)
    return if amount.negative?

    @current_health = [@current_health - amount, MIN_HEALTH].max
  end

  def heal(amount)
    return if amount.negative?

    @current_health = [@current_health + amount, @max_health].min
  end

  def hearts
    (@max_health / 10.0).ceil
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

  def equip(item)
    @equipment << item
  end

  def unequip(item)
    @equipment.delete(item)
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

  attr_reader :base_attributes, :equipment

  # Calculate an attribute by summing base value, life form modifier, and equipment modifiers
  # attribute_name is the name of the attribute to calculate
  # base_attributes is a hash of base values for the attribute
  # attribute_mods is the method to call on the life form to get the modifiers (Attributes::Names::ALL)
  def calculate_attribute(attribute_name)
    calculate_stat(attribute_name, base_attributes, :attribute_mods)
  end

  # Calculate an effort by summing base value, life form modifier, and equipment modifiers
  # effort_name is the name of the effort to calculate
  # base_efforts is a hash of base values for the effort
  # effort_mods is the method to call on the life form to get the modifiers (Efforts::Names::ALL)
  def calculate_effort(effort_name)
    calculate_stat(effort_name, base_efforts, :effort_mods)
  end

  # Calculate a stat by summing base value, life form modifier, and equipment modifiers
  # stat_name is the name of the stat to calculate
  # base_values is a hash of base values for the stat
  # mods_method is the method to call on the life form or equipment to get the modifiers
  # (attribute_mods or effort_mods)
  def calculate_stat(stat_name, base_values, mods_method)
    base_value = base_values[stat_name]
    life_form_mod = life_form.send(mods_method)[stat_name] || 0
    equipment_mod = equipment.sum { |item| item.send(mods_method)[stat_name] || 0 }

    base_value + life_form_mod + equipment_mod
  end
end
