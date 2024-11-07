# frozen_string_literal: true

require_relative 'life_form'

class Dwarf < LifeForm
  def attribute_mods
    {
      BaseAttributes::Names::STR => 1,
      BaseAttributes::Names::CON => 1
    }
  end
end
