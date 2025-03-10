# frozen_string_literal: true

require_relative '../test_setup'

class HumanTest < Minitest::Test
  def test_modifiers
    human = Human.new

    assert_equal({ Attributes::Names::INT => 1, Attributes::Names::CHA => 1 }, human.attribute_mods)
  end
end
