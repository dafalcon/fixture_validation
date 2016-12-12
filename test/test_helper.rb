# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../test/dummy/config/environment.rb', __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path('../../test/dummy/db/migrate', __FILE__)]
require 'rails/test_help'

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

class ActiveSupport::TestCase
  self.use_transactional_tests = false
  self.use_transactional_fixtures = false

  def reload_fixtures
    @@already_loaded_fixtures = nil
    setup_fixtures
  end

  def set_fixture_path(dummy_fixture_path = 'fixtures')
    # Load fixtures from the dummy app
    if ActiveSupport::TestCase.respond_to?(:fixture_path=)
      ActiveSupport::TestCase.fixture_path = File.expand_path("../dummy/test/#{dummy_fixture_path}", __FILE__)
      ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
      ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + '/files'
      reload_fixtures
    end
  end
end

