# frozen_string_literal: true

require_relative 'life_form'

class Dwarf < LifeForm
  def attribute_mods
    {
      PlayerAttributes::Names::STR => 1,
      PlayerAttributes::Names::CON => 1
    }
  end
end
