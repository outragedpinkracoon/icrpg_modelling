# frozen_string_literal: true

require_relative 'test_setup'
class EquipmentManagerTest < Minitest::Test
  def setup
    @manager = EquipmentManager.new
    @sword = Equipment.new(
      name: 'Sword',
      description: 'A sharp sword',
      attribute_mods: { Attributes::Names::STR => 1 },
      effort_mods: { Efforts::Names::WEAPONS_AND_TOOLS => 1 },
      defense_mod: 2
    )
    @shield = Equipment.new(
      name: 'Shield',
      description: 'A sturdy shield',
      attribute_mods: { Attributes::Names::CON => 1 },
      effort_mods: { Efforts::Names::BASIC => 1 },
      defense_mod: 3
    )
    @ring = Equipment.new(
      name: 'Ring of Power',
      description: 'A magical ring',
      attribute_mods: {
        Attributes::Names::STR => 1,
        Attributes::Names::DEX => 1
      },
      effort_mods: { Efforts::Names::ENERGY_AND_MAGIC => 1 },
      defense_mod: 1
    )
  end

  def test_equip_item
    @manager.equip(@sword)

    assert_equal [@sword], @manager.equipment
  end

  def test_unequip_item
    @manager.equip(@sword)
    @manager.unequip(@sword)

    assert_empty @manager.equipment
  end

  def test_defense_mod
    @manager.equip(@sword)
    @manager.equip(@shield)

    assert_equal 5, @manager.defense_mod
  end

  def test_attribute_mods
    @manager.equip(@sword)
    @manager.equip(@shield)

    expected = {
      Attributes::Names::STR => 1,
      Attributes::Names::CON => 1
    }

    assert_equal expected, @manager.attribute_mods
  end

  def test_effort_mods
    @manager.equip(@sword)
    @manager.equip(@shield)

    expected = {
      Efforts::Names::WEAPONS_AND_TOOLS => 1,
      Efforts::Names::BASIC => 1
    }

    assert_equal expected, @manager.effort_mods
  end

  def test_item_with_multiple_attribute_mods
    @manager.equip(@ring)

    expected = {
      Attributes::Names::STR => 1,
      Attributes::Names::DEX => 1
    }

    assert_equal expected, @manager.attribute_mods
  end

  def test_multiple_items_with_overlapping_attribute_mods
    @manager.equip(@sword)
    @manager.equip(@ring)

    expected = {
      Attributes::Names::STR => 2,  # 1 from sword + 1 from ring
      Attributes::Names::DEX => 1   # 1 from ring
    }

    assert_equal expected, @manager.attribute_mods
  end
end
