# frozen_string_literal: true

require_relative 'life_form'

class Gerblin < LifeForm
  def attribute_mods
    { Attributes::Names::DEX => 1 }
  end

  def effort_mods
    { Efforts::Names::GUNS => 1 }
  end
end
