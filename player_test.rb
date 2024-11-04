# frozen_string_literal: true

require_relative 'test_helper'
require_relative 'player'
require_relative 'attributes'

# Tests the Player class
class PlayerTest < Minitest::Test
  def setup
    @player = Player.new(
      name: 'fred', 
      world: 'deans', 
      life_form: 'human', 
      type: 'gunslinger',
      story: 'this is my story',
      attributes: Attributes.new(
        str: 1,
        dex: 0,
        con: 2,
        int: 3,
        wis: 0,
        cha: 0
      )
    )
  end

  def test_player_has_name
    assert_equal @player.name, 'fred'
    @player.name = 'bert'
    assert_equal @player.name, 'bert'
  end

  def test_player_has_world
    assert_equal @player.world, 'deans'
    @player.world = 'livi'
    assert_equal @player.world, 'livi'
  end

  def test_player_has_life_form
    assert_equal @player.life_form, 'human'
    @player.life_form = 'elf'
    assert_equal @player.life_form, 'elf'
  end

  def test_player_has_type
    assert_equal @player.type, 'gunslinger'
    @player.type = 'wizard'
    assert_equal @player.type, 'wizard'
  end

  def test_player_has_story
    assert_equal @player.story, 'this is my story'
    @player.story = 'this is my new story'
    assert_equal @player.story, 'this is my new story'
  end

  def test_player_attributes
    assert_equal @player.attributes.str, 1
    assert_equal @player.attributes.dex, 0
    assert_equal @player.attributes.con, 2
    assert_equal @player.attributes.int, 3
    assert_equal @player.attributes.wis, 0
    assert_equal @player.attributes.cha, 0
  end
end
