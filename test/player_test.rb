# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/player'
require_relative '../lib/player_types'
require_relative '../lib/base_attributes'
require_relative '../lib/attributes'
require_all('../lib/life_forms')

# rubocop:disable Metrics/ClassLength
class PlayerTest < Minitest::Test
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

  def test_player_has_health
    assert_equal 10, @player.max_health
    @player.max_health = 20

    assert_equal 20, @player.max_health
  end

  def test_player_can_take_damage
    @player.take_damage(5)

    assert_equal 5, @player.current_health
  end

  def test_player_cant_heal_above_max_health
    @player.take_damage(4)
    @player.heal(6)

    assert_equal 10, @player.current_health
  end

  def test_player_cant_take_negative_damage
    @player.take_damage(-1)

    assert_equal(10, @player.current_health)
  end

  def test_player_cant_take_damage_below_zero
    @player.take_damage(11)

    assert_equal 0, @player.current_health
  end

  def test_player_cant_heal_negative
    @player.heal(-1)

    assert_equal 10, @player.current_health
  end

  def test_player_heart_count
    assert_equal 1, @player.hearts
    @player.max_health = 11

    assert_equal 2, @player.hearts
    @player.max_health = 5

    assert_equal 1, @player.hearts
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

    assert_equal(2, @player.attributes[Attributes::Names::STR])
    assert_equal(3, @player.attributes[Attributes::Names::CON])
  end

  def test_player_has_elf_plus_base_attributes
    @player.life_form = Elf.new

    assert_equal(1, @player.attributes[Attributes::Names::DEX])
    assert_equal(1, @player.attributes[Attributes::Names::CHA])
  end

  def test_player_has_gerblin_plus_base_attributes
    @player.life_form = Gerblin.new

    assert_equal(1, @player.attributes[Attributes::Names::DEX])
  end

  def test_player_has_human_plus_base_attributes
    @player.life_form = Human.new

    assert_equal(4, @player.attributes[Attributes::Names::INT])
    assert_equal(1, @player.attributes[Attributes::Names::CHA])
  end

  def test_player_has_torton_plus_base_attributes
    @player.life_form = Torton.new

    assert_equal(3, @player.attributes[Attributes::Names::CON])
  end

  def test_player_can_retrieve_all_calculated_attributes
    @player.life_form = Human.new

    expected_attributes = {
      Attributes::Names::INT => 4,
      Attributes::Names::CHA => 1,
      Attributes::Names::DEX => 0,
      Attributes::Names::CON => 2,
      Attributes::Names::STR => 1,
      Attributes::Names::WIS => 0
    }

    expected_attributes.each do |attribute, value|
      assert_equal(value, @player.attributes[attribute])
    end
  end

  def test_defense
    assert_equal(12, @player.defense)
  end

  def test_hero_coin
    refute_predicate(@player, :hero_coin?)
    @player.give_hero_coin

    assert_predicate(@player, :hero_coin?)
    @player.remove_hero_coin

    refute_predicate(@player, :hero_coin?)
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
# rubocop:enable Metrics/ClassLength
