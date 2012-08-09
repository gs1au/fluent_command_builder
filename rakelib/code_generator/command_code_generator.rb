require_relative 'lib/command_code_names'
require_relative 'lib/node_code_generator'

module CodeGenerator
  class CommandCodeGenerator

    def initialize(command, version)
      @command = command
      @version = version
    end

    def render(writer)
      w = writer
      w.write_line %Q[require File.expand_path(File.dirname(__FILE__) + '/../command_base')]
      w.write_line %Q[require File.expand_path(File.dirname(__FILE__) + '/../command_builder')]
      w.write_line
      w.write_module 'FluentCommandBuilder' do
        w.write_module command_code_names.module_name do
          w.write_line "COMMAND_NAME = '#{@command.command_name}' unless const_defined? :COMMAND_NAME"
          w.write_module command_code_names.version_module_name do

            node_code_generator = NodeCodeGenerator.new @command, writer
            node_code_generator.render

            w.write_method command_code_names.factory_method_name, command_code_names.factory_method_args do
              w.write_line "builder = CommandBuilder.new FluentCommandBuilder::#{command_code_names.module_name}::COMMAND_NAME"
              w.write_line "command = #{command_code_names.class_name}.new #{command_code_names.initializer_values.join ', '}"
              w.write_line 'yield builder if block_given?'
              w.write_line 'command'
            end
          end
        end
        w.write_method command_code_names.version_factory_method_name, command_code_names.factory_method_args do
          w.write_line "builder = CommandBuilder.new FluentCommandBuilder::#{command_code_names.module_name}::COMMAND_NAME"
          w.write_line "command = #{command_code_names.module_name}::#{command_code_names.version_module_name}::#{command_code_names.class_name}.new #{command_code_names.initializer_values.join ', '}"
          w.write_line 'yield builder if block_given?'
          w.write_line 'command'
        end
      end
    end

    private

    def command_code_names
      @command_code_names ||= CommandCodeNames.new @command, @version
    end

  end
end
