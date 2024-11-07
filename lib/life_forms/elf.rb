# frozen_string_literal: true

require_relative 'life_form'

class Elf < LifeForm
  def attribute_mods
    {
      AttributeNames::DEX => 1,
      AttributeNames::CHA => 1
    }
  end
end
