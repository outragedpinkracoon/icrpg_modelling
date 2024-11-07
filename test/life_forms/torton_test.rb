# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/life_forms/torton'
require_relative '../../lib/base_attributes'
require_relative '../../lib/base_attribute_names'
require_relative '../../lib/base_efforts'

class TortonTest < Minitest::Test
  def test_modifiers
    torton = Torton.new

    assert_equal({ BaseAttributeNames::CON => 1 }, torton.attribute_mods)
    assert_equal({ BaseEfforts::Names::ENERGY_AND_MAGIC => 1 }, torton.effort_mods)
  end
end
