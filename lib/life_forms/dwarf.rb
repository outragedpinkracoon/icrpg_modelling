# frozen_string_literal: true

require_relative 'life_form'

class Dwarf < LifeForm
  def attribute_mods
    {
      AttributeNames::STR => 1,
      AttributeNames::CON => 1
    }
  end
end
