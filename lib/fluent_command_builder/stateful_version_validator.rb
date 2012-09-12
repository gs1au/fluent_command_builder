require File.expand_path(File.dirname(__FILE__) + '/printer')

module FluentCommandBuilder
  class StatefulVersionValidator

    attr_accessor :warn_only

    def initialize(command_name, path, version_detector, expected_version)
      @command_name = command_name
      @path = path
      @version_detector = version_detector
      @expected_version_string = expected_version
      @warn_only = false
      @printer = Printer.new
    end

    def validate
      @actual_version_string = @version_detector.version(@path)

      unless actual_version
        @printer.print_warning error_message('unable to determine actual version')
        return
      end

      unless is_valid?
        message = error_message actual_version.to_s(expected_version.to_a.length)
        @warn_only ? @printer.print_warning(message) : @printer.print_error(message)
        raise message unless @warn_only
      end
    end

    private

    def is_valid?
      actual_version.to_a.first(expected_version.to_a.length) == expected_version.to_a
    end

    def expected_version
      @expected_version ||= Version.new(@expected_version_string)
    end

    def actual_version
      @actual_version ||= Version.new(@actual_version_string)
    end

    def error_message(actual_version)
      %Q[Version validation for command "#{@command_name}" failed. Expected version #{expected_version} but was #{actual_version}.]
    end

  end
end