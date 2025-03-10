# frozen_string_literal: true

require_relative '../test_setup'
require_relative '../../lib/player'
require_relative '../../lib/player_types'
require_relative '../../lib/base_attributes'
require_relative '../../lib/attributes'
require_relative '../../lib/life_forms/human'
require_relative '../../lib/life_forms/elf'
require_relative '../../lib/life_forms/dwarf'
require_relative '../../lib/life_forms/gerblin'
require_relative '../../lib/life_forms/torton'

class PlayerLifeFormTest < Minitest::Test
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

  def test_player_life_form
    assert_instance_of Human, @player.life_form
    @player.life_form = Elf.new

    assert_instance_of Elf, @player.life_form
  end

  def test_player_has_dwarf_plus_base_attributes
    @player.life_form = Dwarf.new

    assert_equal(2, @player.attributes[Attributes::Names::STR])
    assert_equal(3, @player.attributes[Attributes::Names::CON])
  end

  def test_player_has_elf_plus_base_attributes
    @player.life_form = Elf.new

    assert_equal(1, @player.attributes[Attributes::Names::DEX])
    assert_equal(1, @player.attributes[Attributes::Names::CHA])
  end

  def test_player_has_gerblin_plus_base_attributes
    @player.life_form = Gerblin.new

    assert_equal(1, @player.attributes[Attributes::Names::DEX])
  end

  def test_player_has_human_plus_base_attributes
    @player.life_form = Human.new

    assert_equal(4, @player.attributes[Attributes::Names::INT])
    assert_equal(1, @player.attributes[Attributes::Names::CHA])
  end

  def test_player_has_torton_plus_base_attributes
    @player.life_form = Torton.new

    assert_equal(3, @player.attributes[Attributes::Names::CON])
  end

  def test_player_can_retrieve_all_calculated_attributes
    @player.life_form = Human.new

    expected_attributes = {
      Attributes::Names::INT => 4,
      Attributes::Names::CHA => 1,
      Attributes::Names::DEX => 0,
      Attributes::Names::CON => 2,
      Attributes::Names::STR => 1,
      Attributes::Names::WIS => 0
    }

    expected_attributes.each do |attribute, value|
      assert_equal(value, @player.attributes[attribute])
    end
  end
end
