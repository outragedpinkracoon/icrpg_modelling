# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/life_forms/human'
require_relative '../../lib/player_attributes'
require_relative '../../lib/player_efforts'

class HumanTest < Minitest::Test
  def test_modifiers
    human = Human.new

    assert_equal({ PlayerAttributes::Names::INT => 1, PlayerAttributes::Names::CHA => 1 }, human.attribute_mods)
  end
end
