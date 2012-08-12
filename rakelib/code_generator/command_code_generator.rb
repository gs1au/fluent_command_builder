require 'erb'
require_relative 'lib/command_code_names'
require_relative 'lib/node_code_generator'
require_relative 'lib/ruby_code_writer'
require_relative 'models/version_module_model'

module CodeGenerator
  class CommandCodeGenerator

    def initialize(command, version)
      code_names = CommandCodeNames.new command, version
      model = VersionModuleModel.new
      model.version_factory_method_name = code_names.version_factory_method_name
      model.factory_method_args = code_names.factory_method_args
      model.command_module_name = code_names.command_module_name
      model.version_module_name = code_names.version_module_name
      model.initializer_values = code_names.initializer_values
      model.command_factory_method_name = code_names.command_factory_method_name
      model.command_class_name = code_names.class_name
      model.command_class = command_class command
      @model = model
    end

    def render(writer)
      template_file = File.expand_path(File.dirname(__FILE__) + '/templates/version_module.erb')
      template = ERB.new File.read(template_file)
      writer.write template.result(binding)
    end

    private

    def command_class(command)
      stream = StringIO.new
      writer = RubyCodeWriter.new stream
      writer.indent = 3
      node_code_generator = NodeCodeGenerator.new command, command, writer
      node_code_generator.render
      stream.string
    end

  end
end