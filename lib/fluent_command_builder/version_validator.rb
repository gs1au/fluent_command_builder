require File.expand_path(File.dirname(__FILE__) + '/printer')

module FluentCommandBuilder
  class VersionValidator

    attr_accessor :should_fail_on_unexpected_version

    def initialize(underlying_builder)
      @underlying_builder = underlying_builder
      @printer = Printer.new
      @should_fail_on_unexpected_version = false
    end

    def validate
      return unless can_validate?

      unless actual_version
        @printer.print_warning error_message('unable to determine actual version')
        return
      end

      unless is_valid?
        message = error_message actual_version.to_s(2)
        @should_fail_on_unexpected_version ? @printer.print_error(message) : @printer.print_warning(message)
        raise message if @should_fail_on_unexpected_version
      end
    end

    private

    def can_validate?
      @underlying_builder.version && @underlying_builder.actual_version_lambda
    end

    def is_valid?
      actual_version.compact == expected_version.compact
    end

    def expected_version
      Version.new(@underlying_builder.version)
    end

    def actual_version
      Version.new(@underlying_builder.actual_version) if @underlying_builder.actual_version
    end

    def error_message(actual_version)
      %Q[Version validation for command "#{@underlying_builder.command_name}" failed. Expected version #{expected_version} but was #{actual_version}.]
    end

  end
end