# frozen_string_literal: true

require_relative 'life_form'

class Human < LifeForm
  def attribute_mods
    {
      BaseAttributeNames::INT => 1,
      BaseAttributeNames::CHA => 1
    }
  end
end
