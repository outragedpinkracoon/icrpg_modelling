# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/life_forms/dwarf'
require_relative '../../lib/attributes'

class DwarfTest < Minitest::Test
  def test_modifiers
    dwarf = Dwarf.new

    assert_equal({ Attributes::Names::STR => 1, Attributes::Names::CON => 1 }, dwarf.attribute_mods)
  end
end
