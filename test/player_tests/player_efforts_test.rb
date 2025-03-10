# frozen_string_literal: true

require_relative '../test_setup'

class PlayerEffortsTest < Minitest::Test
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

  def test_player_efforts
    assert_equal(4, @player.base_efforts[Efforts::Names::BASIC])
  end

  def test_player_has_gerblin_plus_base_efforts
    @player.life_form = Gerblin.new

    assert_equal(9, @player.efforts[Efforts::Names::GUNS])
  end

  def test_player_has_torton_plus_base_efforts
    @player.life_form = Torton.new

    assert_equal(11, @player.efforts[Efforts::Names::ENERGY_AND_MAGIC])
  end

  def test_player_can_retrieve_all_calculated_efforts
    @player.life_form = Torton.new

    expected_efforts = {
      Efforts::Names::BASIC => 4,
      Efforts::Names::WEAPONS_AND_TOOLS => 6,
      Efforts::Names::GUNS => 8,
      Efforts::Names::ENERGY_AND_MAGIC => 11,
      Efforts::Names::ULTIMATE => 12
    }

    expected_efforts.each do |effort, value|
      assert_equal(value, @player.efforts[effort])
    end
  end
end
