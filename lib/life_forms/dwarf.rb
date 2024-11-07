# frozen_string_literal: true

require_relative 'life_form'

class Dwarf < LifeForm
  def attribute_mods
    {
      BaseAttributeNames::STR => 1,
      BaseAttributeNames::CON => 1
    }
  end
end
