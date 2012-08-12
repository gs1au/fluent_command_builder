require 'erb'
require_relative 'lib/code_names'

module CodeGenerator
  class CommandModuleGenerator
    include CodeNames

    def initialize(command)
      @command = command
    end

    def render(writer)
      template_file = File.expand_path(File.dirname(__FILE__) + '/templates/command_module.erb')
      template = ERB.new File.read(template_file)
      writer.write template.result(binding)
    end

  end
end