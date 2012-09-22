require File.expand_path(File.dirname(__FILE__) + '/printer')

module FluentCommandBuilder
  class VersionValidator

    attr_accessor :printer, :should_abort_on_fatal

    def initialize(command_builder_config)
      @c = command_builder_config
      @printer = Printer.new
      @should_abort_on_fatal = true
    end

    def validate
      validate_validation_level
      return if validation_level == :off

      @actual_version_string = @c.version_detector.version(@c.evaluated_path)

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
            abort if @should_abort_on_fatal
          else
            # do nothing
        end
      end
    end

    private

    def validation_level
      @c.version_validation_level
    end

    def validate_validation_level
      raise %Q[Validation level "#{validation_level}" is not supported.] unless validation_level_valid?
    end

    def validation_level_valid?
      [:off, :warn, :fatal].include? validation_level
    end




    def is_valid?
      actual_version.to_a.first(expected_version.to_a.length) == expected_version.to_a
    end

    def expected_version
      @expected_version ||= Version.new(@c.version)
    end

    def actual_version
      @actual_version ||= Version.new(@actual_version_string) if @actual_version_string
    end

    def error_message(actual_version)
      %Q[Version validation for command "#{@c.command_name}" failed. Expected version #{expected_version} but was #{actual_version}.]
    end

  end
end