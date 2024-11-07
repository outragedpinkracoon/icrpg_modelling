# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/life_forms/gerblin'
require_relative '../../lib/player_attributes'
require_relative '../../lib/player_efforts'

class GerblinTest < Minitest::Test
  def test_modifiers
    gerblin = Gerblin.new

    assert_equal({ PlayerAttributes::Names::DEX => 1 }, gerblin.attribute_mods)
    assert_equal({ PlayerEfforts::Names::GUNS => 1 }, gerblin.effort_mods)
  end
end
