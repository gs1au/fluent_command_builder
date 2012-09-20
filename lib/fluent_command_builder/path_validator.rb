require File.expand_path(File.dirname(__FILE__) + '/printer')

module FluentCommandBuilder
  class PathValidator

    def initialize(command_builder_config)
      @command_builder_config = command_builder_config
      @printer = Printer.new
    end

    def validate(validation_level=:warn)
      return if File.exist? path
      message = %Q[Path for command "#{command_name}", version "#{version}" does not exist. Path: #{path}]

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

    private

    def path
      is_windows? ? windows_path : @command_builder_config.path
    end

    def windows_path
      `echo #{@command_builder_config.path}`.strip
    end

    def command_name
      @command_builder_config.command_name
    end

    def version
      @command_builder_config.version
    end

    def is_windows?
      !ENV['WINDIR'].nil?
    end

  end
end