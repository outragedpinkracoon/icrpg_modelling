# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/life_forms/elf'
require_relative '../../lib/base_attributes'
require_relative '../../lib/attribute_names'

class ElfTest < Minitest::Test
  def test_elf
    elf = Elf.new

    assert_equal({ AttributeNames::DEX => 1, AttributeNames::CHA => 1 }, elf.attribute_mods)
  end
end
