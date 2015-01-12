require_relative 'internal/printer'
require_relative 'internal/path'
require_relative 'internal/version'

module FluentCommandBuilder
  class VersionValidator

    attr_accessor :validation_level, :should_abort_on_fatal, :printer, :get_version

    def initialize(target_name, &get_version)
      @target_name = target_name
      @validation_level = :fatal
      @should_abort_on_fatal = true
      @printer = FluentCommandBuilder::Printer.new
      @get_version = get_version
    end

    def validate(expected_version_string, path=nil)
      validate_validation_level
      return if validation_level == :off

      p = Path.new path
      @expected_version_string = expected_version_string
      @actual_version_string = get_version File.join(p.evaluated_path, @target_name)

      unless actual_version
        @printer.print_warning error_message('unable to determine actual version')
        return
      end

      unless is_valid?
        message = error_message actual_version.first(expected_version.to_a.length)
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

    def get_version(path)
      @get_version.call path
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
      @expected_version ||= Version.new(@expected_version_string)
    end

    def actual_version
      @actual_version ||= Version.new(@actual_version_string) if @actual_version_string
    end

    def error_message(actual_version)
      m = 'Version validation '
      m += %Q[for "#{@target_name}" ] if @target_name
      m += "failed. Expected version #{expected_version} but was #{actual_version}."
      m
    end

  end
end