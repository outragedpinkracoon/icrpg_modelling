# frozen_string_literal: true

require_relative 'life_form'

class Human < LifeForm
  def attribute_mods
    {
      AttributeNames::INT => 1,
      AttributeNames::CHA => 1
    }
  end
end
