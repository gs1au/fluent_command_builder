require 'erb'
require_relative 'lib/command_definition'
require_relative 'lib/command_code_names'
require_relative 'lib/ruby_code_writer'
require_relative 'lib/node_code_generator'

class CodeGenerator

  def initialize(definitions_dir, lib_dir)
    @definitions_dir = definitions_dir
    @lib_dir = lib_dir
    @command_builders_dir = File.join lib_dir, 'fluent_command_builder', 'command_builders'
  end

  def execute
    pattern = File.join @definitions_dir, '*.txt'
    Dir[pattern].each { |f| process_definition f }
    generate_loader
  end

  private

  def process_definition(definition_file)
    puts "Processing: #{File.basename definition_file}"
    d = CommandDefinition.new File.new(definition_file)
    d.versions.each { |v| process_version d.command, v }
  end

  def process_version(command, version)
    generate_command_module command, version
    generate_version_module command, version
  end

  def generate_command_module(command, version)
    code_names = CommandCodeNames.new command, version

    # erb values
    module_name = code_names.command_module_name
    factory_method_name = code_names.command_factory_method_name
    command_name = command.command_name

    template_file = File.expand_path(File.dirname(__FILE__) + '/templates/command_module.erb')
    template = ERB.new File.read(template_file)
    result = template.result(binding)

    dest_file = File.join @command_builders_dir, "#{code_names.command_factory_method_name}.rb"
    File.open(dest_file, 'w') { |f| f.write result }
  end

  def generate_version_module(command, version)
    code_names = CommandCodeNames.new command, version

    # erb values
    version_factory_method_name = code_names.version_factory_method_name
    factory_method_args = code_names.factory_method_args
    command_module_name = code_names.command_module_name
    version_module_name = code_names.version_module_name
    initializer_values = code_names.initializer_values
    command_factory_method_name = code_names.command_factory_method_name
    command_class_name = code_names.class_name
    command_class = generate_command_class command

    template_file = File.expand_path(File.dirname(__FILE__) + '/templates/version_module.erb')
    template = ERB.new File.read(template_file)
    result = template.result(binding)

    dest_file = File.join @command_builders_dir, "#{code_names.version_factory_method_name}.rb"
    File.open(dest_file, 'w') { |f| f.write result }
  end

  def generate_command_class(command)
    stream = StringIO.new
    writer = RubyCodeWriter.new stream
    writer.indent = 3
    node_code_generator = NodeCodeGenerator.new command, command, writer
    node_code_generator.render
    stream.string
  end

  def generate_loader
    Dir.chdir @lib_dir do
      File.open 'fluent_command_builder.rb', 'w' do |f|
        pattern = File.join @command_builders_dir, '*.rb'
        puts pattern
        Dir[pattern].each do |command_builder_file|
          f.puts %Q[require File.expand_path(File.dirname(__FILE__) + '/fluent_command_builder/command_builders/#{File.basename command_builder_file}')]
        end
      end
    end
  end

end