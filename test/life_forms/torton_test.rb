# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/life_forms/torton'
require_relative '../../lib/attribute_names'
require_relative '../../lib/effort_names'

class TortonTest < Minitest::Test
  def test_modifiers
    torton = Torton.new

    assert_equal({ AttributeNames::CON => 1 }, torton.attribute_mods)
    assert_equal({ Efforts::Names::ENERGY_AND_MAGIC => 1 }, torton.effort_mods)
  end
end
