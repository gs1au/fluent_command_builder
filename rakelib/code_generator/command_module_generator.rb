require 'erb'
require_relative 'models/command_module_model'
require_relative 'lib/command_code_names'

module CodeGenerator
  class CommandModuleGenerator

    def initialize(command)
      code_names = CommandCodeNames.new command
      model = CommandModuleModel.new
      model.module_name = code_names.command_module_name
      model.factory_method_name = code_names.command_factory_method_name
      model.command_name = command.command_name
      @model = model
    end

    def render(writer)
      template_file = File.expand_path(File.dirname(__FILE__) + '/templates/command_module.erb')
      template = ERB.new File.read(template_file)
      writer.write template.result(binding)
    end

  end
end
