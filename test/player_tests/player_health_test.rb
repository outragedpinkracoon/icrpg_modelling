# frozen_string_literal: true

require_relative '../test_setup'

class PlayerHealthTest < Minitest::Test
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
end
