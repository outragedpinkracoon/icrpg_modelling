# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/player'
require_relative '../lib/player_attributes'
require_all('../lib/life_forms')

class PlayerTest < Minitest::Test
  def setup
    @attributes = { str: 1, dex: 0, con: 2, int: 3, wis: 0, cha: 0 }
    @player = Player.new(
      name: 'fred',
      world: 'deans',
      life_form: Human.new,
      type: Player::TYPE::MAGE,
      story: 'this is my story',
      attributes: PlayerAttributes.new(**@attributes)
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

  def test_player_has_life_form
    assert_instance_of Human, @player.life_form
    @player.life_form = Elf.new

    assert_instance_of Elf, @player.life_form
  end

  def test_player_has_type
    assert_equal Player::TYPE::MAGE, @player.type
    @player.type = Player::TYPE::WARRIOR

    assert_equal Player::TYPE::WARRIOR, @player.type
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
