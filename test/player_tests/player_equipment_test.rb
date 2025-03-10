# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/player'
require_relative '../../lib/player_types'
require_relative '../../lib/base_attributes'
require_relative '../../lib/attributes'
require_relative '../../lib/equipment'
require_relative '../../lib/life_forms/human'
require_relative '../../lib/life_forms/dwarf'

class PlayerEquipmentTest < Minitest::Test
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

  def test_player_can_equip_and_unequip_items
    sword = Equipment.new(
      name: 'Magic Sword',
      description: 'A sword that increases strength',
      attribute_mods: { Attributes::Names::STR => 2 }
    )

    @player.equip(sword)

    assert_equal(3, @player.attributes[Attributes::Names::STR])

    @player.unequip(sword)

    assert_equal(1, @player.attributes[Attributes::Names::STR])
  end

  def test_multiple_items_stack_modifiers
    sword = Equipment.new(
      name: 'Magic Sword',
      description: 'A sword that increases strength',
      attribute_mods: { Attributes::Names::STR => 2 }
    )

    shield = Equipment.new(
      name: 'Magic Shield',
      description: 'A shield that increases constitution',
      attribute_mods: { Attributes::Names::CON => 1 }
    )

    @player.equip(sword)
    @player.equip(shield)

    assert_equal(3, @player.attributes[Attributes::Names::STR])
    assert_equal(3, @player.attributes[Attributes::Names::CON])
  end

  def test_equipment_can_modify_efforts
    staff = Equipment.new(
      name: 'Magic Staff',
      description: 'A staff that increases energy and magic',
      effort_mods: { Efforts::Names::ENERGY_AND_MAGIC => 2 }
    )

    @player.equip(staff)

    assert_equal(12, @player.efforts[Efforts::Names::ENERGY_AND_MAGIC])
  end

  def test_equipment_modifiers_combine_with_life_form_modifiers
    sword = Equipment.new(
      name: 'Magic Sword',
      description: 'A sword that increases strength',
      attribute_mods: { Attributes::Names::STR => 2 }
    )

    @player.life_form = Dwarf.new
    @player.equip(sword)

    # Dwarf gives +1 STR, sword gives +2 STR, base is 1
    assert_equal(4, @player.attributes[Attributes::Names::STR])
  end
end
