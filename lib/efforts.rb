# frozen_string_literal: true

module Efforts
  module Names
    BASIC = :basic
    WEAPONS_AND_TOOLS = :weapons_and_tools
    GUNS = :guns
    ENERGY_AND_MAGIC = :energy_and_magic
    ULTIMATE = :ultimate

    ALL = [BASIC, WEAPONS_AND_TOOLS, GUNS, ENERGY_AND_MAGIC, ULTIMATE].freeze
  end

  BASE = {
    Names::BASIC => 4,
    Names::WEAPONS_AND_TOOLS => 6,
    Names::GUNS => 8,
    Names::ENERGY_AND_MAGIC => 10,
    Names::ULTIMATE => 12
  }.freeze
end
