require File.expand_path(File.dirname(__FILE__) + '/printer')

module FluentCommandBuilder
  class PathValidator

    def initialize(command_builder_config)
      @c = command_builder_config
      @printer = Printer.new
    end

    def validate(validation_level=:warn)
      return if File.exist? @c.evaluated_path
      message = %Q[Path for command "#{@c.command_name}", version "#{@c.version}" does not exist. Path: #{@c.evaluated_path}]

      case validation_level
        when :warn
          @printer.print_warning message
        when :fatal
          @printer.print_error message
          abort
        else
          @printer.print_warning %Q[Path validation failed. Validation level "#{validation_level}" is not supported.]
      end
    end

  end
end