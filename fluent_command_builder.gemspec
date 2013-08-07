Gem::Specification.new do |s|
  s.name = 'fluent_command_builder'
  s.version = '0.9.8'
  s.summary = 'An intuitive command line builder with a fluent interface.'
  s.description = 'Fluent Command Builder makes building command lines easy and clean.'
  s.authors = ['Matthew Riley']
  s.email = 'matthew@matthewriley.name'
  s.files = Dir['lib/**/*.rb']
  s.homepage = 'http://rubygems.org/gems/fluent_command_builder'
  s.add_dependency 'rake', '~> 10.1'
  s.add_dependency 'term-ansicolor', '~> 1.0'
  s.add_dependency 'getversion', '~> 0.0'
  s.add_dependency 'wicked_witch', '~> 0.0'
  s.add_development_dependency 'test-unit', '~> 2.5'
  s.add_development_dependency 'mocha', '~> 0.14'
end