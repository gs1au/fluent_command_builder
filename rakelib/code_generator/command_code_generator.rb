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
      w.write_line %Q[require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')]
      w.write_line
      w.write_module 'FluentCommandBuilder' do

        w.write_method command_code_names.version_factory_method_name, command_code_names.factory_method_args do
          initializer_values = ['b'] + command_code_names.initializer_values
          w.write_line 'b = UnderlyingBuilder.new'
          w.write_line "c = FluentCommandBuilder::#{command_code_names.module_name}::#{command_code_names.version_module_name}.create " + initializer_values.join(', ')
          w.write_line 'yield b if block_given?'
          w.write_line 'c'
        end

        w.write_module command_code_names.module_name do


          w.write_module command_code_names.version_module_name do
            w.write_method 'self.create', ['underlying_builder'] + command_code_names.factory_method_args do
              initializer_values = ['underlying_builder'] + command_code_names.initializer_values
              w.write_line "#{command_code_names.class_name}.new #{initializer_values.join(', ')}"
            end

            w.write_method command_code_names.factory_method_name, command_code_names.factory_method_args do
              initializer_values = ['b'] + command_code_names.initializer_values
              w.write_line 'b = UnderlyingBuilder.new'
              w.write_line "c = FluentCommandBuilder::#{command_code_names.module_name}::#{command_code_names.version_module_name}.create " + initializer_values.join(', ')
              w.write_line 'yield b if block_given?'
              w.write_line 'c'
            end

            node_code_generator = NodeCodeGenerator.new @command, @command, writer
            node_code_generator.render
          end
        end


      end
    end

    private

    def command_code_names
      @command_code_names ||= CommandCodeNames.new @command, @version
    end

  end
end
