# frozen_string_literal: true

require_relative 'life_form'

class Torton < LifeForm
  def attribute_mods
    { BaseAttributeNames::CON => 1 }
  end

  def effort_mods
    { EffortNames::ENERGY_AND_MAGIC => 1 }
  end
end
