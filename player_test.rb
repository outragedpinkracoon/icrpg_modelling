# frozen_string_literal: true

require_relative 'test_helper'
require_relative 'player'

# Tests the Player class
class PlayerTest < Minitest::Test
  def setup
    @player = Player.new(name: 'fred', world: 'deans', life_form: 'human', type: 'gunslinger')
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
end
