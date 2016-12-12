require 'fixture_validation/version'
require 'active_support/concern'

module FixtureValidation
  extend ActiveSupport::Concern
  
  included do
    fixtures :all if respond_to? :fixtures
  end

  def test_validate_fixtures
    count = 0
    klasses = []
    fixture_table_names.each do |fixture_name|
      klass_name = fixture_name.classify
      begin
        klasses << klass_name.constantize
      rescue NameError
        Rails.logger.debug "No model class (#{klass_name}) found for fixture #{fixture_name}"
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

