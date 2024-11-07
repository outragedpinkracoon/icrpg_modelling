# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/life_forms/human'
require_relative '../../lib/base_attributes'
require_relative '../../lib/base_efforts'

class HumanTest < Minitest::Test
  def test_modifiers
    human = Human.new

    assert_equal({ BaseAttributes::Names::INT => 1, BaseAttributes::Names::CHA => 1 }, human.attribute_mods)
  end
end
