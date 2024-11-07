# frozen_string_literal: true

class BaseEfforts
  module Names
    BASIC = :basic
    WEAPONS_AND_TOOLS = :weapons_and_tools
    GUNS = :guns
    ENERGY_AND_MAGIC = :energy_and_magic
    ULTIMATE = :ultimate
  end

  attr_reader :basic, :weapons_and_tools, :guns, :energy_and_magic, :ultimate

  def initialize
    @basic = 4
    @weapons_and_tools = 6
    @guns = 8
    @energy_and_magic = 10
    @ultimate = 12
  end
end
