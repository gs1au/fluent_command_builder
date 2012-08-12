require 'erb'
require_relative 'lib/code_names'
require_relative 'lib/node_code_generator'
require_relative 'lib/ruby_code_writer'

module CodeGenerator
  class CommandCodeGenerator
    include CodeNames

    def initialize(command, version)
      @command = command
      @version = version
    end

    def render(writer)
      template_file = File.expand_path(File.dirname(__FILE__) + '/templates/version_module.erb')
      template = ERB.new File.read(template_file)
      writer.write template.result(binding)
    end

    private

    def command_class
      stream = StringIO.new
      writer = RubyCodeWriter.new stream
      node_code_generator = NodeCodeGenerator.new @command, @command, writer
      node_code_generator.render
      stream.string
    end

  end
end