# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/attributes'

# Tests the Player class
class AttributesTest < Minitest::Test

  def test_valid_attributes
    @attributes = Attributes.new(
      str: 1,
      dex: 0,
      con: 2,
      int: 3,
      wis: 0,
      cha: 0
    )
    assert_equal @attributes.str, 1
    assert_equal @attributes.dex, 0
    assert_equal @attributes.con, 2
    assert_equal @attributes.int, 3
    assert_equal @attributes.wis, 0
    assert_equal @attributes.cha, 0
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
