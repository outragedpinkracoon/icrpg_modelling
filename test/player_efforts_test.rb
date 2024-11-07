# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/player_efforts'

class PlayerEffortsTest < Minitest::Test
  def setup
    @efforts = PlayerEfforts.new
  end

  def test_basic_effort
    assert_equal(4, @efforts.basic)
  end

  def test_weapons_and_tools_effort
    assert_equal(6, @efforts.weapons_and_tools)
  end

  def test_guns_effort
    assert_equal(8, @efforts.guns)
  end

  def test_energy_and_magic_effort
    assert_equal(10, @efforts.energy_and_magic)
  end

  def test_ultimate_effort
    assert_equal(12, @efforts.ultimate)
  end
end
