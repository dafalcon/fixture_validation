require 'test_helper'

class FixtureValidation::Test < ActiveSupport::TestCase
  include FixtureValidation

  setup do
    set_fixture_path
  end

  test 'truth' do
    assert_kind_of Module, FixtureValidation
  end

  test 'broken fixtures' do
    set_fixture_path 'broken_fixtures'
    assert_raises MiniTest::Assertion do
      test_validate_fixtures
    end
  end
end
