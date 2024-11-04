# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/player_attributes'

# Tests the Player class
class PlayerAttributesTest < Minitest::Test
  def test_valid_attributes
    expected_attributes = { str: 1, dex: 0, con: 2, int: 3, wis: 0, cha: 0 }

    @attributes = PlayerAttributes.new(**expected_attributes)

    expected_attributes.each do |attribute, expected_value|
      assert_equal expected_value, @attributes.send(attribute), "Expected #{attribute} to be #{expected_value}"
    end
  end

  def test_attributes_too_low
    error = assert_raises(PlayerAttributes::StatsError) do
      @attributes = PlayerAttributes.new(
        str: 1,
        dex: 0,
        con: 0,
        int: 3,
        wis: 0,
        cha: 0
      )
    end
    assert_equal 'Stats are too low - must add to 6', error.message
  end

  def test_attributes_too_high
    error = assert_raises(PlayerAttributes::StatsError) do
      @attributes = PlayerAttributes.new(
        str: 1,
        dex: 0,
        con: 0,
        int: 3,
        wis: 3,
        cha: 0
      )
    end

    assert_equal 'Stats are too high - must add to 6', error.message
  end
end