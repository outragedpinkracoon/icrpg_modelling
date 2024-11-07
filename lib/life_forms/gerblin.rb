# frozen_string_literal: true

require_relative 'life_form'

class Gerblin < LifeForm
  def attribute_mods
    { BaseAttributes::Names::DEX => 1 }
  end

  def effort_mods
    { BaseEfforts::Names::GUNS => 1 }
  end
end
