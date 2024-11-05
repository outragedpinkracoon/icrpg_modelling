# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/life_form'

# Tests the LifeForm class
class LifeFormTest < Minitest::Test
  def setup
    @life_form = LifeForm.new(name: LifeForm::Names::ELF)
  end

  def test_life_form_name
    assert_equal(LifeForm::Names::ELF, @life_form.name)
  end
end
