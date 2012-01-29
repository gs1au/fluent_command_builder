require_relative 'node_code_generator'
require_relative 'ruby_naming_convention'

class CommandCodeGenerator

  def initialize command, version
    @command = command
    @version = version
    @node_code_generator = NodeCodeGenerator.new
    @naming_convention = RubyNamingConvention.new
  end

  def render writer
    writer.line %Q[require File.expand_path(File.dirname(__FILE__) + '/../command_builder')]
    writer.line
    writer.module 'FluentCommandBuilder' do
      writer.module command_module_name do
        writer.module version_module_name do
          write_command @command, writer
          writer.method method_name do
            writer.initializer class_name, 'CommandBuilder.new'
          end
        end
      end
      writer.method version_method_name do
        writer.initializer  "#{command_module_name}::#{version_module_name}::#{class_name}", 'CommandBuilder.new'
      end
    end
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
    command_name.downcase
  end

  def version_method_name
    "#{method_name}_#{version}".downcase
  end

  def command_name
    @command.node_text.gsub('-', '_').gsub(/\W/, '')
  end

  def version
    @version.gsub(/[\.]/, '').gsub(/ /, '_')
  end

  def write_command command, writer
    @node_code_generator.render command, writer
    command.child_nodes.each { |c| write_command c, writer }
  end

end
