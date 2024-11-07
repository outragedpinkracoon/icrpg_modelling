# frozen_string_literal: true

require_relative 'life_form'

class Gerblin < LifeForm
  def attribute_mods
    { PlayerAttributes::Names::DEX => 1 }
  end

  def effort_mods
    { PlayerEfforts::Names::GUNS => 1 }
  end
end
