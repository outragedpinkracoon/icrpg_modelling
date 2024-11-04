# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/attributes'

# Tests the Player class
class AttributesTest < Minitest::Test
  def test_valid_attributes
    expected_attributes = { str: 1, dex: 0, con: 2, int: 3, wis: 0, cha: 0 }

    @attributes = Attributes.new(**expected_attributes)

    expected_attributes.each do |attribute, expected_value|
      assert_equal expected_value, @attributes.send(attribute), "Expected #{attribute} to be #{expected_value}"
    end
  end

  def test_attributes_too_low
    assert_raises(Attributes::StatsError) do
      @attributes = Attributes.new(
        str: 1,
        dex: 0,
        con: 0,
        int: 3,
        wis: 0,
        cha: 0
      )
    end
  end
end
