# frozen_string_literal: true

require_relative 'attributes'
require_relative 'efforts'

class StatsCalculator
  def initialize(base_values:, life_form:, equipment_manager:)
    @base_values = base_values
    @life_form = life_form
    @equipment_manager = equipment_manager
  end

  def calculate_attributes
    Attributes::Names::ALL.each_with_object({}) do |attribute_name, obj|
      obj[attribute_name] = calculate_stat(attribute_name, :attribute_mods)
    end
  end

  def calculate_efforts
    Efforts::Names::ALL.each_with_object({}) do |effort_name, obj|
      obj[effort_name] = calculate_stat(effort_name, :effort_mods, Efforts::BASE)
    end
  end

  private

  def calculate_stat(stat_name, mods_method, base_values = @base_values)
    base_value = base_values[stat_name]
    life_form_mod = @life_form.send(mods_method)[stat_name] || 0
    equipment_mod = @equipment_manager.send(mods_method)[stat_name] || 0

    base_value + life_form_mod + equipment_mod
  end
end
