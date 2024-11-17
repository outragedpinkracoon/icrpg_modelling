# frozen_string_literal: true

require_relative 'life_form'

class Human < LifeForm
  def attribute_mods
    {
      Attributes::Names::INT => 1,
      Attributes::Names::CHA => 1
    }
  end
end
