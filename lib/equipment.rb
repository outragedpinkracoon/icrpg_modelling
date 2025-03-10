# frozen_string_literal: true

require_relative 'attributes'
require_relative 'efforts'

class Equipment
  attr_reader :name, :description, :attribute_mods, :effort_mods

  def initialize(name:, description:, attribute_mods: {}, effort_mods: {})
    @name = name
    @description = description
    @attribute_mods = attribute_mods
    @effort_mods = effort_mods
  end

  def ==(other)
    name == other.name
  end
end
