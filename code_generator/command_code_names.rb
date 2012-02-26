require_relative 'code_generator'

module CodeGenerator
  class CommandCodeNames

    ROOT_MODULE_NAME = 'FluentCommandBuilder'

    def initialize(command, version)
      @command = command
      @version = version
    end

    def module_name
      @command.node_name.camelcase
    end

    def version_module_name
      result = version =~ /^\d/ ? "V#{version}" : version
      result.camelcase
    end

    def factory_method_name
      @command.node_name.gsub('-', '_').gsub(/\W/, '').downcase
    end

    def version_factory_method_name
      "#{factory_method_name}_#{version}".downcase
    end

    def factory_method_args
      command_args.map do |arg|
        arg_name = arg.arg_name.snakecase
        arg_name << '=nil' if arg.optional?
        arg_name
      end
    end

    def initializer_values
      %w(builder) + command_args.map { |arg| arg.arg_name.snakecase }
    end

    def class_name
      @command.node_name.camelcase
    end

    private

    def version
      @version.gsub(/[\.]/, '').gsub(' ', '_')
    end

    def command_args
      @command.required_args + @command.optional_args
    end

  end
end