# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/player_efforts'

# Tests the PlayerEfforts class
class PlayerEffortsTest < Minitest::Test
  def test_valid_efforts
    @efforts = PlayerEfforts.new(
      basic: 6
    )

    assert_equal(6, @efforts.basic)
  end
end
