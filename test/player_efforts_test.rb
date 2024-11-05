# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/player_efforts'

# Tests the PlayerEfforts class
class PlayerEffortsTest < Minitest::Test
  def test_efforts
    @efforts = PlayerEfforts.new

    expected_values = {
      basic: 4,
      weapons_and_tools: 6,
      guns: 8,
      energy_and_magic: 10,
      ultimate: 12
    }

    expected_values.each do |effort_type, score|
      assert_equal(score, @efforts.send(effort_type))
    end
  end
end
