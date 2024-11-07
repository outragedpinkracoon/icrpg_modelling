# frozen_string_literal: true

require_relative 'life_form'

class Torton < LifeForm
  def attribute_mods
    { BaseAttributes::Names::CON => 1 }
  end

  def effort_mods
    { BaseEfforts::Names::ENERGY_AND_MAGIC => 1 }
  end
end
