require File.expand_path(File.dirname(__FILE__) + '/printer')

module FluentCommandBuilder
  class VersionValidator

    def initialize(underlying_builder)
      @underlying_builder = underlying_builder
      @printer = Printer.new
    end

    def validate
      return unless can_validate?

      unless actual_version
        print_warning 'unable to determine actual version'
        return
      end

      unless is_valid?
        print_warning actual_version.to_s(2)
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

    def print_warning(message)
      @printer.print_warning %Q[Version validation for command "#{@underlying_builder.command_name}" failed. Expected version #{expected_version} but was #{message}.]
    end

  end
end