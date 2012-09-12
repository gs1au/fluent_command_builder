require File.expand_path(File.dirname(__FILE__) + '/printer')

module FluentCommandBuilder
  class PathValidator

    def initialize(path, command_name, version)
      @path = path
      @command_name = command_name
      @version = version
      @printer = Printer.new
    end

    def validate
      return if is_valid?
      version = @version || '(unknown)'
      message = %Q[Path for command "#{@command_name}", version "#{version}" does not exist. Path: #{@path}]
      @printer.print_error message
      raise message
    end

    private

    def is_valid?
      File.exist? path
    end

  end
end