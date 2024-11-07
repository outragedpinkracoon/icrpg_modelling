# frozen_string_literal: true

class LifeForm
  module Names
    ELF = :elf
    DWARF = :dwarf
    HUMAN = :human
    GERBLIN = :gerblin
    TORTON = :torton

    ALL = [ELF, DWARF, HUMAN, GERBLIN, TORTON].freeze
  end

  def attribute_mods
    {}
  end

  def effort_mods
    {}
  end
end
