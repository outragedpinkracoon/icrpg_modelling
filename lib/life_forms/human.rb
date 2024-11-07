# frozen_string_literal: true

require_relative 'life_form'

class Human < LifeForm
  def attribute_mods
    {
      BaseAttributes::Names::INT => 1,
      BaseAttributes::Names::CHA => 1
    }
  end
end
