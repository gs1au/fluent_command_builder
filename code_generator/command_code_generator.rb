require_relative 'node_code_generator'
require_relative 'ruby_naming_convention'

module CodeGenerator
  class CommandCodeGenerator

    def initialize(command, version)
      @command = command
      @version = version
      @node_code_generator = NodeCodeGenerator.new
      @naming_convention = RubyNamingConvention.new
    end

    def render(writer)
      w = writer
      w.write_line %Q[require File.expand_path(File.dirname(__FILE__) + '/../command_base')]
      w.write_line %Q[require File.expand_path(File.dirname(__FILE__) + '/../command_builder')]
      w.write_line
      w.write_module 'FluentCommandBuilder' do
        w.write_module command_module_name do
          w.write_module version_module_name do
            w.write_line "COMMAND_NAME = '#{@command.command_name}'"
            write_command @command, w
            w.write_method method_name, command_factory_method_args do
              w.write_line "builder = CommandBuilder.new COMMAND_NAME"
              w.write_line "command = #{class_name}.new #{command_initializer_values.join ', '}"
              w.write_line 'yield builder if block_given?'
              w.write_line 'command'
            end
          end
        end
        w.write_method version_method_name, command_factory_method_args do
          w.write_line "builder = CommandBuilder.new #{command_module_name}::#{version_module_name}::COMMAND_NAME"
          w.write_line "command = #{command_module_name}::#{version_module_name}::#{class_name}.new #{command_initializer_values.join ', '}"
          w.write_line 'yield builder if block_given?'
          w.write_line 'command'
        end
      end
    end

    def args
      @command.required_args + @command.optional_args
    end

    def command_factory_method_args
      args.map do |arg|
        arg_name = @naming_convention.arg_name arg.arg_name
        arg_name << '=nil' if arg.optional?
        arg_name
      end
    end

    def command_initializer_values
      %w(builder) + args.map { |arg| @naming_convention.arg_name arg.arg_name }
    end

    def command_module_name
      @naming_convention.module_name command_name
    end

    def version_module_name
      (version =~ /^\d/).nil? ? version : "V#{version}"
    end

    def class_name
      @naming_convention.class_name command_name
    end

    def method_name
      command_name.gsub('-', '_').gsub(/\W/, '').downcase
    end

    def version_method_name
      "#{method_name}_#{version}".downcase
    end

    def command_name
      @command.node_name
    end

    def command_alias
      @command.fragments[0].fragment_text[/\((.+?)\)/, 1]
    end

    def version
      @version.gsub(/[\.]/, '').gsub(/ /, '_')
    end

    def write_command(command, writer)
      @node_code_generator.render command, writer
      command.child_nodes.each { |c| write_command c, writer }
    end

  end
end