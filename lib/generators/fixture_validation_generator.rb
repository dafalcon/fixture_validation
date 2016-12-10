require 'rails/generators/named_base'

class FixtureValidationGenerator < Rails::Generators::Base
  def create_test
    create_file 'test/models/fixture_validation_test.rb' do
      <<END
require 'test_helper'
require 'fixture_validation_test'


END
    end
  end
end
