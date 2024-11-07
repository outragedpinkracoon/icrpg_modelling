# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/life_forms/elf'
require_relative '../../lib/player_attributes'
require_relative '../../lib/player_efforts'

class ElfTest < Minitest::Test
  def test_elf
    elf = Elf.new

    assert_equal({ PlayerAttributes::Names::DEX => 1, PlayerAttributes::Names::CHA => 1 }, elf.attribute_mods)
  end
end
