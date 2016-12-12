require 'test_helper'
require 'fixture_validation_test'

class FixtureValidation::Test < ActiveSupport::TestCase
  
  test "truth" do
    assert_kind_of Module, FixtureValidation
  end

  
end
