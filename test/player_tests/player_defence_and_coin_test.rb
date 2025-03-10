# frozen_string_literal: true

require_relative '../test_setup'

class PlayerDefenceAndCoinTest < Minitest::Test
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

  def test_defense
    assert_equal(12, @player.defense)
  end

  def test_defense_with_equipment
    shield = Equipment.new(
      name: 'Magic Shield',
      description: 'A shield that increases defense',
      defense_mod: 5
    )

    @player.equip(shield)

    assert_equal(17, @player.defense)

    @player.unequip(shield)

    assert_equal(12, @player.defense)
  end

  def test_multiple_equipment_defense
    shield = Equipment.new(
      name: 'Magic Shield',
      description: 'A shield that increases defense',
      defense_mod: 5
    )

    armor = Equipment.new(
      name: 'Magic Armor',
      description: 'Armor that increases defense',
      defense_mod: 3
    )

    @player.equip(shield)
    @player.equip(armor)

    assert_equal(20, @player.defense)
  end

  def test_hero_coin
    refute_predicate(@player, :hero_coin?)
    @player.give_hero_coin

    assert_predicate(@player, :hero_coin?)
    @player.remove_hero_coin

    refute_predicate(@player, :hero_coin?)
  end
end
