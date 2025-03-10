# frozen_string_literal: true

require_relative 'attributes'
require_relative 'efforts'

class Equipment
  attr_reader :name, :description, :attribute_mods, :effort_mods, :defense_mod

  def initialize(name:, description:, attribute_mods: {}, effort_mods: {}, defense_mod: 0)
    @name = name
    @description = description
    @attribute_mods = attribute_mods
    @effort_mods = effort_mods
    @defense_mod = defense_mod
  end

  def ==(other)
    name == other.name
  end
end
