module CodeGenerator
  class CommandCodeNames

    ROOT_MODULE_NAME = 'FluentCommandBuilder'

    def initialize(command, version)
      @command = command
      @version = version
      @naming_convention = RubyNamingConvention.new
    end

    def module_name
      @naming_convention.module_name @command.node_name
    end

    def module_name_with_version
      version =~ /^\d/ ? "V#{version}" : version
    end

    def fully_qualified_module_name_with_version
      "#{module_name}::#{module_name_with_version}"
    end

    def factory_method_name
      @command.node_name.gsub('-', '_').gsub(/\W/, '').downcase
    end

    def factory_method_name_with_version
      "#{factory_method_name}_#{version}".downcase
    end

    def factory_method_args
      command_args.map do |arg|
        arg_name = @naming_convention.arg_name arg.arg_name
        arg_name << '=nil' if arg.optional?
        arg_name
      end
    end

    def initializer_values
      %w(builder) + command_args.map { |arg| @naming_convention.arg_name arg.arg_name }
    end

    def class_name
      @naming_convention.class_name @command.node_name
    end

    def fully_qualified_class_name
      "#{fully_qualified_module_name_with_version}::#{class_name}"
    end

    private

    def version
      @version.gsub(/[\.]/, '').gsub(/ /, '_')
    end

    def command_args
      @command.required_args + @command.optional_args
    end

  end
end