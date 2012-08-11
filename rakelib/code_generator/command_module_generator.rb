require_relative 'lib/command_code_names'

module CodeGenerator
  class CommandModuleGenerator

    def initialize(command)
      @command = command
    end

    def render(writer)
      w = writer
      w.write_line %Q[require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')]
      w.write_line %Q[require File.expand_path(File.dirname(__FILE__) + '/../util')]
      w.write_line
      w.write_module 'FluentCommandBuilder' do
        w.write_method command_code_names.factory_method_name, '&block' do
          w.write_line "#{command_code_names.module_name}.create &block"
        end
        w.write_module command_code_names.module_name do
          w.write_line "COMMAND_NAME = '#{@command.command_name}'"
          w.write_method 'self.create' do
            w.write_line 'b = UnderlyingBuilder.new'
            w.write_line %Q[c = version_module(#{command_code_names.module_name}).create b]
            w.write_line 'yield b if block_given?'
            w.write_line 'c'
          end
        end
      end
    end

    private

    def command_code_names
      @command_code_names ||= CommandCodeNames.new @command
    end

  end
end