# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/life_forms/human'
require_relative '../../lib/attribute_names'

class HumanTest < Minitest::Test
  def test_modifiers
    human = Human.new

    assert_equal({ AttributeNames::INT => 1, AttributeNames::CHA => 1 }, human.attribute_mods)
  end
end
