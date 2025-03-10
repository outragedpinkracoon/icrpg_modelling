# frozen_string_literal: true

require_relative 'efforts'
require_relative 'health'
require_relative 'equipment_manager'
require_relative 'stats_calculator'

class Player
  attr_accessor :name, :world, :type, :story

  def initialize(name:, world:, life_form:, type:, story:, base_attributes:, max_health: 10)
    @name = name
    @world = world
    @type = type
    @story = story
    @base_attributes = base_attributes
    @hero_coin = false
    @health = Health.new(max_health: max_health)
    @equipment_manager = EquipmentManager.new
    @life_form = life_form
    @stats_calculator = create_stats_calculator
  end

  def life_form=(new_life_form)
    @life_form = new_life_form
    @stats_calculator = create_stats_calculator
  end

  attr_reader :life_form

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
    @stats_calculator.calculate_attributes
  end

  def efforts
    @stats_calculator.calculate_efforts
  end

  def valid
    return true, [] if base_attributes.values.sum == 6

    [false, 'Base attributes must equal 6']
  end

  private

  attr_reader :base_attributes

  def create_stats_calculator
    StatsCalculator.new(
      base_values: base_attributes,
      life_form: @life_form,
      equipment_manager: @equipment_manager
    )
  end
end
