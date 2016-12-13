# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fixture_validation/version'

Gem::Specification.new do |spec|
  spec.name          = 'fixture_validation'
  spec.version       = FixtureValidation::VERSION
  spec.authors       = ['Dan Falcone']
  spec.email         = ['danfalcone@gmail.com']

  spec.summary       = %q{Adds a test that validates all your Rails fixtures.}
  spec.homepage      = 'https://github.com/falconed/fixture_validation'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '> 4'
  spec.add_development_dependency 'sqlite3'
end
