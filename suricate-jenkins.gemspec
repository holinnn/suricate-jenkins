lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'suricate/jenkins/version'

Gem::Specification.new do |spec|
  spec.name          = 'suricate-jenkins'
  spec.version       = Suricate::Jenkins::VERSION
  spec.authors       = ['Aurélien AMILIN']
  spec.email         = ['aurelien.amilin@gmail.com']
  spec.summary       = %q{Jenkins plugin for Suricate}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z -- lib/`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'suricate', '>= 0.0.1'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'byebug', '~> 5.0'
  spec.add_development_dependency 'simplecov', '~> 0.10.0'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.7'
end
