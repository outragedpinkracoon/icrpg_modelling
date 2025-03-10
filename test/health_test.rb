# frozen_string_literal: true

require_relative 'test_setup'
require_relative '../lib/health'

class HealthTest < Minitest::Test
  def setup
    @health = Health.new(max_health: 10)
  end

  def test_health_has_max_health
    assert_equal 10, @health.max_health
  end

  def test_health_has_current_health
    assert_equal 10, @health.current_health
  end

  def test_health_can_take_damage
    @health.take_damage(3)

    assert_equal 7, @health.current_health
  end

  def test_health_cant_take_damage_below_zero
    @health.take_damage(15)

    assert_equal 0, @health.current_health
  end

  def test_health_cant_take_negative_damage
    @health.take_damage(-1)

    assert_equal 10, @health.current_health
  end

  def test_health_can_heal
    @health.take_damage(3)
    @health.heal(2)

    assert_equal 9, @health.current_health
  end

  def test_health_cant_heal_above_max_health
    @health.heal(5)

    assert_equal 10, @health.current_health
  end

  def test_health_cant_heal_negative
    @health.heal(-1)

    assert_equal 10, @health.current_health
  end

  def test_health_heart_count
    assert_equal 1, @health.hearts
  end
end
