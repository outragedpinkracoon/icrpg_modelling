# frozen_string_literal: true

require_relative 'efforts'
require_relative 'health'
require_relative 'equipment_manager'

class Player
  attr_accessor :name, :world, :type, :story, :life_form

  def initialize(name:, world:, life_form:, type:, story:, base_attributes:, max_health: 10)
    @name = name
    @world = world
    @life_form = life_form
    @type = type
    @story = story
    @base_attributes = base_attributes
    @hero_coin = false
    @health = Health.new(max_health: max_health)
    @equipment_manager = EquipmentManager.new
  end

  # plus defense related loot
  def defense
    base_defense = attributes[Attributes::Names::CON] + 10
    base_defense + @equipment_manager.defense_mod
  end

  def take_damage(amount)
    @health.take_damage(amount)
  end

  def heal(amount)
    @health.heal(amount)
  end

  def hearts
    @health.hearts
  end

  def max_health
    @health.max_health
  end

  def max_health=(value)
    @health = Health.new(max_health: value)
  end

  def current_health
    @health.current_health
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
    @equipment_manager.equip(item)
  end

  def unequip(item)
    @equipment_manager.unequip(item)
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
    calculate_stat(attribute_name, base_attributes, :attribute_mods)
  end

  def calculate_effort(effort_name)
    calculate_stat(effort_name, base_efforts, :effort_mods)
  end

  def calculate_stat(stat_name, base_values, mods_method)
    base_value = base_values[stat_name]
    life_form_mod = life_form.send(mods_method)[stat_name] || 0
    equipment_mod = @equipment_manager.send(mods_method)[stat_name] || 0

    base_value + life_form_mod + equipment_mod
  end
end
