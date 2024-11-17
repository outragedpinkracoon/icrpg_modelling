# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/player'
require_relative '../lib/player_types'
require_relative '../lib/base_attributes'
require_relative '../lib/attribute_names'
require_all('../lib/life_forms')

# rubocop:disable Metrics/ClassLength
class PlayerTest < Minitest::Test
  def setup
    @attributes = {
      AttributeNames::STR => 1,
      AttributeNames::DEX => 0,
      AttributeNames::CON => 2,
      AttributeNames::INT => 3,
      AttributeNames::WIS => 0,
      AttributeNames::CHA => 0
    }

    @life_form = Human.new

    @player = Player.new(
      name: 'fred',
      world: 'deans',
      life_form: @life_form,
      type: PlayerTypes::MAGE,
      story: 'this is my story',
      base_attributes: @attributes
    )
  end

  def test_player_has_name
    assert_equal 'fred', @player.name
    @player.name = 'bert'

    assert_equal 'bert', @player.name
  end

  def test_player_has_world
    assert_equal 'deans', @player.world
    @player.world = 'livi'

    assert_equal 'livi', @player.world
  end

  def test_player_life_form
    assert_instance_of Human, @player.life_form
    @player.life_form = Elf.new

    assert_instance_of Elf, @player.life_form
  end

  def test_player_has_type
    assert_equal PlayerTypes::MAGE, @player.type
    @player.type = PlayerTypes::WARRIOR

    assert_equal PlayerTypes::WARRIOR, @player.type
  end

  def test_player_has_story
    assert_equal 'this is my story', @player.story
    @player.story = 'this is my new story'

    assert_equal 'this is my new story', @player.story
  end

  def test_player_has_dwarf_plus_base_attributes
    @player.life_form = Dwarf.new

    assert_equal(2, @player.attributes[AttributeNames::STR])
    assert_equal(3, @player.attributes[AttributeNames::CON])
  end

  def test_player_has_elf_plus_base_attributes
    @player.life_form = Elf.new

    assert_equal(1, @player.attributes[AttributeNames::DEX])
    assert_equal(1, @player.attributes[AttributeNames::CHA])
  end

  def test_player_has_gerblin_plus_base_attributes
    @player.life_form = Gerblin.new

    assert_equal(1, @player.attributes[AttributeNames::DEX])
  end

  def test_player_has_human_plus_base_attributes
    @player.life_form = Human.new

    assert_equal(4, @player.attributes[AttributeNames::INT])
    assert_equal(1, @player.attributes[AttributeNames::CHA])
  end

  def test_player_has_torton_plus_base_attributes
    @player.life_form = Torton.new

    assert_equal(3, @player.attributes[AttributeNames::CON])
  end

  def test_player_can_retrieve_all_calculated_attributes
    @player.life_form = Human.new

    expected_attributes = {
      AttributeNames::INT => 4,
      AttributeNames::CHA => 1,
      AttributeNames::DEX => 0,
      AttributeNames::CON => 2,
      AttributeNames::STR => 1,
      AttributeNames::WIS => 0
    }

    expected_attributes.each do |attribute, value|
      assert_equal(value, @player.attributes[attribute])
    end
  end

  def test_hero_coin
    refute_predicate(@player, :hero_coin?)
    @player.give_hero_coin

    assert_predicate(@player, :hero_coin?)
    @player.remove_hero_coin

    refute_predicate(@player, :hero_coin?)
  end

  def test_player_efforts
    assert_equal(4, @player.base_efforts[EffortNames::BASIC])
  end

  def test_player_has_gerblin_plus_base_efforts
    @player.life_form = Gerblin.new

    assert_equal(9, @player.efforts[EffortNames::GUNS])
  end

  def test_player_has_torton_plus_base_efforts
    @player.life_form = Torton.new

    assert_equal(11, @player.efforts[EffortNames::ENERGY_AND_MAGIC])
  end

  def test_player_can_retrieve_all_calculated_efforts
    @player.life_form = Torton.new

    expected_efforts = {
      EffortNames::BASIC => 4,
      EffortNames::WEAPONS_AND_TOOLS => 6,
      EffortNames::GUNS => 8,
      EffortNames::ENERGY_AND_MAGIC => 11,
      EffortNames::ULTIMATE => 12
    }

    expected_efforts.each do |effort, value|
      assert_equal(value, @player.efforts[effort])
    end
  end
end
# rubocop:enable Metrics/ClassLength
