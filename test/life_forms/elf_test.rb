# frozen_string_literal: true

require_relative '../test_setup'

class ElfTest < Minitest::Test
  def test_elf
    elf = Elf.new

    assert_equal(
      { Attributes::Names::DEX => 1, Attributes::Names::CHA => 1 }, elf.attribute_mods
    )
  end
end
