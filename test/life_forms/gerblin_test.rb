# frozen_string_literal: true

require_relative '../test_setup'

class GerblinTest < Minitest::Test
  def test_modifiers
    gerblin = Gerblin.new

    assert_equal({ Attributes::Names::DEX => 1 }, gerblin.attribute_mods)
    assert_equal({ Efforts::Names::GUNS => 1 }, gerblin.effort_mods)
  end
end
