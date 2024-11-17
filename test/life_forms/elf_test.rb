# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/life_forms/elf'
require_relative '../../lib/attributes'

class ElfTest < Minitest::Test
  def test_elf
    elf = Elf.new

    assert_equal(
      { Attributes::Names::DEX => 1, Attributes::Names::CHA => 1 }, elf.attribute_mods
    )
  end
end
