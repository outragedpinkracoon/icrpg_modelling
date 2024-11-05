# frozen_string_literal: true

# Represents a life form in the game
class LifeForm
  module Names
    ELF = :elf
    DWARF = :dwarf
    HUMAN = :human
    GERBLIN = :gerblin
    TORTON = :torton

    ALL = [ELF, DWARF, HUMAN, GERBLIN, TORTON].freeze
  end

  attr_reader :name

  def initialize(name:)
    @name = name
  end
end
