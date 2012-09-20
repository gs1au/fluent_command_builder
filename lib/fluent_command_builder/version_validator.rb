require File.expand_path(File.dirname(__FILE__) + '/printer')

module FluentCommandBuilder
  class VersionValidator

    def initialize(command_builder_config)
      @command_builder_config = command_builder_config
      @printer = Printer.new
    end

    def validate(validation_level)
      return if validation_level == :off

      @actual_version_string = version_detector.version(path)

      unless actual_version
        @printer.print_warning error_message('unable to determine actual version')
        return
      end

      unless is_valid?
        message = error_message actual_version.to_s(expected_version.to_a.length)

        case validation_level
          when :warn
            @printer.print_warning message
          when :fatal
            @printer.print_error message
            abort
          else
            @printer.print_warning %Q[Version validation failed. Validation level "#{validation_level}" is not supported.]
        end
      end
    end

    private

    def is_valid?
      actual_version.to_a.first(expected_version.to_a.length) == expected_version.to_a
    end

    def expected_version
      @expected_version ||= Version.new(expected_version_string)
    end

    def actual_version
      @actual_version ||= Version.new(@actual_version_string) if @actual_version_string
    end

    def error_message(actual_version)
      %Q[Version validation for command "#{command_name}" failed. Expected version #{expected_version} but was #{actual_version}.]
    end

    def path
      @command_builder_config.path
    end

    def command_name
      @command_builder_config.command_name
    end

    def expected_version_string
      @command_builder_config.version
    end

    def version_detector
      @command_builder_config.version_detector
    end

  end
end