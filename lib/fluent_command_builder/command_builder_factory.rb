require File.expand_path(File.dirname(__FILE__) + '/printer')
require File.expand_path(File.dirname(__FILE__) + '/version')

module FluentCommandBuilder
  class CommandBuilderFactory

    def initialize(command_module)
      @command_module = command_module
      @printer = Printer.new
    end

    def create(&block)
      validate_version

      begin
        version_module.create &block
      rescue
        message = %Q[Builder for command "#{@command_module::COMMAND_NAME}", version "#{version.to_s(2)}" does not exist. Please consider contributing.]
        @printer.print_error message
        raise message
      end
    end

    private

    def validate_version
      unless version
        message = %Q[Failed to create builder for command "#{@command_module::COMMAND_NAME}". Unable to determine required version.]
        @printer.print_error message
        raise message
      end
    end

    def version
      @version ||= Version.version_or_nil(@command_module.version)
    end

    def version_module
      eval "#{@command_module.name}::V#{version.compact}"
    end

  end
end