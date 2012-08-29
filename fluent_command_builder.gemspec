Gem::Specification.new do |spec|
  spec.name = 'fluent_command_builder'
  spec.version = '0.8.7'
  spec.summary = 'An intuitive command line builder with a fluent interface.'
  spec.description = 'Fluent Command Builder makes building command lines easy and clean.'
  spec.authors = ['Matthew Riley']
  spec.email = 'matthew-github@matthewriley.name'
  spec.files = Dir['lib/**/*.rb']
  spec.homepage = 'http://rubygems.org/gems/fluent_command_builder'
  spec.add_dependency 'rake'
  spec.add_dependency 'term-ansicolor'
end