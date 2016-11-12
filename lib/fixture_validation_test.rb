# Requires at least one test in the project
# Require 'fixture_validation_test' in test_helper after rails/test_help is required

class FixtureValidation::Test < ActiveSupport::TestCase
  fixtures :all

  test 'fixtures are valid' do
    count = 0
    klasses = []
    fixture_table_names.each do |klass_name|
      begin
        klasses << klass_name.classify.constantize
      rescue NameError
        puts "Skipping #{klass_name}"
      end
    end

    errors = []
    klasses.each do |klass|
      klass.all.each do |obj|
        errors << "Expected #{klass.to_s} fixture #{obj.id} to be valid.  Errors: #{obj.errors.to_a.join(', ')}.  Attribute values: #{obj.attributes.to_s}." unless obj.valid?
        count += 1
      end
    end

    assert errors.empty?, "\n#{errors.join("\n")}"
    Rails.logger.debug "Validated #{count} fixtures"
  end
end
