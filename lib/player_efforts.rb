# frozen_string_literal: true

# The efforts for a given player
class PlayerEfforts
  attr_reader :basic

  def initialize(basic:)
    @basic = basic
  end
end
