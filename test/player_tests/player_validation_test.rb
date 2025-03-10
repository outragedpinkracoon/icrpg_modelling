# frozen_string_literal: true

require_relative '../test_setup'

class PlayerValidationTest < Minitest::Test
  def setup
    @attributes = {
      Attributes::Names::STR => 1,
      Attributes::Names::DEX => 0,
      Attributes::Names::CON => 2,
      Attributes::Names::INT => 3,
      Attributes::Names::WIS => 0,
      Attributes::Names::CHA => 0
    }

    @life_form = Human.new

    @player = Player.new(
      name: 'fred',
      world: 'deans',
      life_form: @life_form,
      type: PlayerTypes::MAGE,
      story: 'this is my story',
      base_attributes: @attributes,
      max_health: 10
    )
  end

  def test_player_is_valid
    assert(@player.valid[0])
    assert_empty(@player.valid[1])
  end

  def test_player_is_invalid_when_attributes_are_higher_than_six
    attributes = {
      Attributes::Names::STR => 1,
      Attributes::Names::DEX => 1,
      Attributes::Names::CON => 2,
      Attributes::Names::INT => 3,
      Attributes::Names::WIS => 0,
      Attributes::Names::CHA => 0
    }

    player = Player.new(
      name: 'fred',
      world: 'deans',
      life_form: Human.new,
      type: PlayerTypes::MAGE,
      story: 'this is my story',
      base_attributes: attributes
    )

    refute(player.valid[0])
    assert_equal('Base attributes must equal 6', player.valid[1])
  end

  def test_player_is_invalid_when_attributes_are_lower_than_six
    attributes = {
      Attributes::Names::STR => 1,
      Attributes::Names::DEX => 1,
      Attributes::Names::CON => 2,
      Attributes::Names::INT => 3,
      Attributes::Names::WIS => 0,
      Attributes::Names::CHA => 0
    }

    player = Player.new(
      name: 'fred',
      world: 'deans',
      life_form: Human.new,
      type: PlayerTypes::MAGE,
      story: 'this is my story',
      base_attributes: attributes
    )

    refute(player.valid[0])
    assert_equal('Base attributes must equal 6', player.valid[1])
  end
end
