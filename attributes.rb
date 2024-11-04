class Attributes
  class StatsError < StandardError; end

  attr_reader :str, :dex, :con, :int, :wis, :cha
  MAX_POINTS = 6

  def initialize(str:, dex:, con:, int:, wis:, cha:)
    if (str + dex + con + int + wis + cha != 6)
      raise StatsError, "Stats must add up to 6"
    end

    @str = str
    @dex = dex
    @con = con
    @int = int
    @wis = wis
    @cha = cha
  end
end