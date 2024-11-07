# frozen_string_literal: true

require_relative 'life_form'

class Elf < LifeForm
  def attribute_mods
    {
      BaseAttributes::Names::DEX => 1,
      BaseAttributes::Names::CHA => 1
    }
  end
end
