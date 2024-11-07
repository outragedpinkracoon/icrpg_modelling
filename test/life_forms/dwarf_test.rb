# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/life_forms/dwarf'
require_relative '../../lib/player_attributes'
require_relative '../../lib/player_efforts'

class DwarfTest < Minitest::Test
  def test_modifiers
    dwarf = Dwarf.new

    assert_equal({ PlayerAttributes::Names::STR => 1, PlayerAttributes::Names::CON => 1 }, dwarf.attribute_mods)
  end
end
