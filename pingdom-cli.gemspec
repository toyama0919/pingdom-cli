# -*- encoding: utf-8 -*-

require File.expand_path('../lib/pingdom/cli/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "pingdom-cli"
  gem.version       = Pingdom::Cli::VERSION
  gem.summary       = %q{pingdom simple command line interface}
  gem.description   = %q{pingdom simple command line interface}
  gem.license       = "MIT"
  gem.authors       = ["Hiroshi Toyama"]
  gem.email         = "toyama0919@gmail.com"
  gem.homepage      = "https://github.com/toyama0919/pingdom-cli"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'thor', '~> 0.19.1'
  gem.add_dependency 'rest-client', '~>1.8.0'

  gem.add_development_dependency 'bundler', '~> 1.7.2'
  gem.add_development_dependency 'pry', '~> 0.10.1'
  gem.add_development_dependency 'rake', '~> 10.3.2'
  gem.add_development_dependency 'rspec', '~> 2.4'
  gem.add_development_dependency 'rubocop', '~> 0.24.1'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
  gem.add_development_dependency 'yard', '~> 0.8'
end
