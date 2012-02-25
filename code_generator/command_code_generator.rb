require_relative 'command_code_names'
require_relative 'node_code_generator'

module CodeGenerator
  class CommandCodeGenerator

    def initialize(command, version)
      @command = command
      @code_names = CommandCodeNames.new command, version
      @node_code_generator = NodeCodeGenerator.new
    end

    def render(writer)
      w = writer
      w.write_line %Q[require File.expand_path(File.dirname(__FILE__) + '/../command_base')]
      w.write_line %Q[require File.expand_path(File.dirname(__FILE__) + '/../command_builder')]
      w.write_line
      w.write_module 'FluentCommandBuilder' do
        w.write_module @code_names.module_name do
          w.write_module @code_names.module_name_with_version do
            w.write_line "COMMAND_NAME = '#{@command.command_name}'"
            write_command @command, w
            w.write_method @code_names.factory_method_name, @code_names.factory_method_args do
              w.write_line "builder = CommandBuilder.new COMMAND_NAME"
              w.write_line "command = #{@code_names.class_name}.new #{@code_names.initializer_values.join ', '}"
              w.write_line 'yield builder if block_given?'
              w.write_line 'command'
            end
          end
        end
        w.write_method @code_names.factory_method_name_with_version, @code_names.factory_method_args do
          w.write_line "builder = CommandBuilder.new #{@code_names.fully_qualified_module_name_with_version}::COMMAND_NAME"
          w.write_line "command = #{@code_names.fully_qualified_class_name}.new #{@code_names.initializer_values.join ', '}"
          w.write_line 'yield builder if block_given?'
          w.write_line 'command'
        end
      end
    end

    def write_command(command, writer)
      @node_code_generator.render command, writer
      command.child_nodes.each { |c| write_command c, writer }
    end

  end
end
