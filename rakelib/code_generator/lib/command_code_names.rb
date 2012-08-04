require_relative 'string_extensions'

module CodeGenerator
  class CommandCodeNames

    def initialize(command, version)
      @command = command
      @version = version.to_s
    end

    def module_name
      @command.node_name.camelcase
    end

    def version_module_name
      result = version =~ /^\d/ ? "V#{version}" : version
      result.camelcase
    end

    def factory_method_name
      @command.node_name.downcase.snakecase
    end

    def version_factory_method_name
      "#{factory_method_name}_#{version.downcase.snakecase}"
    end

    def factory_method_args
      @command.args.map do |arg|
        arg_name = arg.arg_name.snakecase
        arg_name << '=nil' if arg.optional?
        arg_name
      end
    end

    def initializer_values
      %w(builder) + @command.args.map { |arg| arg.arg_name.snakecase }
    end

    def class_name
      @command.node_name.camelcase
    end

    private

    def version
      @version.gsub '.', ''
    end

  end
end