Dir[File.expand_path(File.dirname(__FILE__) + '/fluent_command_builder/*.rb')].each { |f| require f }
Dir[File.expand_path(File.dirname(__FILE__) + '/fluent_command_builder/command_executors/*.rb')].each { |f| require f }
Dir[File.expand_path(File.dirname(__FILE__) + '/fluent_command_builder/command_builders/*.rb')].each { |f| require f }
