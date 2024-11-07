# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/life_forms/dwarf'
require_relative '../../lib/base_attributes'
require_relative '../../lib/base_attribute_names'

class DwarfTest < Minitest::Test
  def test_modifiers
    dwarf = Dwarf.new

    assert_equal({ BaseAttributeNames::STR => 1, BaseAttributeNames::CON => 1 }, dwarf.attribute_mods)
  end
end
