require 'test_helper'

class FixtureValidation::Test < ActiveSupport::TestCase
  include FixtureValidation
  
  test 'truth' do
    assert_kind_of Module, FixtureValidation
  end
  
end
