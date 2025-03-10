# frozen_string_literal: true

require_relative 'test_setup'

class StatsCalculatorTest < Minitest::Test
  def setup
    @base_attributes = {
      Attributes::Names::STR => 1,
      Attributes::Names::DEX => 0,
      Attributes::Names::CON => 2,
      Attributes::Names::INT => 3,
      Attributes::Names::WIS => 0,
      Attributes::Names::CHA => 0
    }

    @base_efforts = Efforts::BASE

    @life_form = Human.new
    @equipment_manager = EquipmentManager.new
    @calculator = StatsCalculator.new(
      base_values: @base_attributes,
      life_form: @life_form,
      equipment_manager: @equipment_manager
    )
  end

  def test_calculate_attributes_with_base_values
    expected = {
      Attributes::Names::STR => 1,
      Attributes::Names::DEX => 0,
      Attributes::Names::CON => 2,
      Attributes::Names::INT => 4,  # 3 base + 1 from Human
      Attributes::Names::WIS => 0,
      Attributes::Names::CHA => 1   # 0 base + 1 from Human
    }

    assert_equal expected, @calculator.calculate_attributes
  end

  def test_calculate_attributes_with_equipment
    sword = Equipment.new(
      name: 'Sword',
      description: 'A sharp sword',
      attribute_mods: { Attributes::Names::STR => 1 },
      effort_mods: { Efforts::Names::WEAPONS_AND_TOOLS => 1 },
      defense_mod: 2
    )

    @equipment_manager.equip(sword)

    expected = {
      Attributes::Names::STR => 2,  # 1 base + 1 from sword
      Attributes::Names::DEX => 0,
      Attributes::Names::CON => 2,
      Attributes::Names::INT => 4,  # 3 base + 1 from Human
      Attributes::Names::WIS => 0,
      Attributes::Names::CHA => 1   # 0 base + 1 from Human
    }

    assert_equal expected, @calculator.calculate_attributes
  end

  def test_calculate_efforts_with_base_values
    expected = {
      Efforts::Names::BASIC => 4,
      Efforts::Names::WEAPONS_AND_TOOLS => 6,
      Efforts::Names::GUNS => 8,
      Efforts::Names::ENERGY_AND_MAGIC => 10,
      Efforts::Names::ULTIMATE => 12
    }

    assert_equal expected, @calculator.calculate_efforts
  end

  def test_calculate_efforts_with_equipment
    sword = Equipment.new(
      name: 'Sword',
      description: 'A sharp sword',
      attribute_mods: { Attributes::Names::STR => 1 },
      effort_mods: { Efforts::Names::WEAPONS_AND_TOOLS => 1 },
      defense_mod: 2
    )

    @equipment_manager.equip(sword)

    expected = {
      Efforts::Names::BASIC => 4,
      Efforts::Names::WEAPONS_AND_TOOLS => 7, # 6 base + 1 from sword
      Efforts::Names::GUNS => 8,
      Efforts::Names::ENERGY_AND_MAGIC => 10,
      Efforts::Names::ULTIMATE => 12
    }

    assert_equal expected, @calculator.calculate_efforts
  end
end
