# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/life_forms/torton'
require_relative '../../lib/attributes'
require_relative '../../lib/efforts'

class TortonTest < Minitest::Test
  def test_modifiers
    torton = Torton.new

    assert_equal({ Attributes::Names::CON => 1 }, torton.attribute_mods)
    assert_equal({ Efforts::Names::ENERGY_AND_MAGIC => 1 }, torton.effort_mods)
  end
end
