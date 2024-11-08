# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/player'
require_relative '../lib/player_types'
require_relative '../lib/base_attributes'
require_relative '../lib/attribute_names'
require_all('../lib/life_forms')

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
    @player = Player.new(
      name: 'fred',
      world: 'deans',
      life_form: Human.new,
      type: PlayerTypes::MAGE,
      story: 'this is my story',
      attributes: BaseAttributes.new(**@attributes)
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

  # No need to test them all - this is done in attributes tests
  def test_player_attributes
    assert_equal(1, @player.attributes.str)
  end

  def test_hero_coin
    refute_predicate(@player, :hero_coin?)
    @player.give_hero_coin

    assert_predicate(@player, :hero_coin?)
    @player.remove_hero_coin

    refute_predicate(@player, :hero_coin?)
  end

  def test_player_efforts
    assert_equal(4, @player.efforts.basic)
  end
end
