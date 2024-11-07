# frozen_string_literal: true

require_relative 'life_form'

class Elf < LifeForm
  def attribute_mods
    {
      PlayerAttributes::Names::DEX => 1,
      PlayerAttributes::Names::CHA => 1
    }
  end
end
