# frozen_string_literal: true

require_relative '../test_setup'

class DwarfTest < Minitest::Test
  def test_modifiers
    dwarf = Dwarf.new

    assert_equal({ Attributes::Names::STR => 1, Attributes::Names::CON => 1 }, dwarf.attribute_mods)
  end
end
