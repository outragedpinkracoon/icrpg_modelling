# frozen_string_literal: true

require_relative 'life_form'

class Elf < LifeForm
  def attribute_mods
    {
      BaseAttributeNames::DEX => 1,
      BaseAttributeNames::CHA => 1
    }
  end
end
