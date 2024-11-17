# frozen_string_literal: true

require_relative 'life_form'

class Elf < LifeForm
  def attribute_mods
    {
      Attributes::Names::DEX => 1,
      Attributes::Names::CHA => 1
    }
  end
end
