# frozen_string_literal: true

class EquipmentManager
  attr_reader :equipment

  def initialize
    @equipment = []
  end

  def equip(item)
    @equipment << item
  end

  def unequip(item)
    @equipment.delete(item)
  end

  def defense_mod
    equipment.sum { |item| item.defense_mod || 0 }
  end

  def attribute_mods
    equipment.each_with_object({}) do |item, mods|
      item.attribute_mods.each do |attribute, value|
        mods[attribute] = (mods[attribute] || 0) + value
      end
    end
  end

  def effort_mods
    equipment.each_with_object({}) do |item, mods|
      item.effort_mods.each do |effort, value|
        mods[effort] = (mods[effort] || 0) + value
      end
    end
  end
end
