# Requires at least one test in the project
# Require 'fixture_validation_test' in test_helper after rails/test_help is required
require 'fixture_validation'
require 'active_support/test_case'

class FixtureValidation::Test < ActiveSupport::TestCase
  include FixtureValidation
end
