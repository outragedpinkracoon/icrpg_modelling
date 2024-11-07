# frozen_string_literal: true

require_relative 'life_form'

class Human < LifeForm
  def attribute_mods
    {
      PlayerAttributes::Names::INT => 1,
      PlayerAttributes::Names::CHA => 1
    }
  end
end
