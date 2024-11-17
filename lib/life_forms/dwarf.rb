# frozen_string_literal: true

require_relative 'life_form'

class Dwarf < LifeForm
  def attribute_mods
    {
      Attributes::Names::STR => 1,
      Attributes::Names::CON => 1
    }
  end
end
