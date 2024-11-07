# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/life_forms/gerblin'
require_relative '../../lib/base_attributes'
require_relative '../../lib/attribute_names'
require_relative '../../lib/effort_names'

class GerblinTest < Minitest::Test
  def test_modifiers
    gerblin = Gerblin.new

    assert_equal({ AttributeNames::DEX => 1 }, gerblin.attribute_mods)
    assert_equal({ EffortNames::GUNS => 1 }, gerblin.effort_mods)
  end
end
