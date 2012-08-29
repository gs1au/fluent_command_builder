require File.expand_path(File.dirname(__FILE__) + '/printer')

module FluentCommandBuilder
  class PathValidator

    def initialize(underlying_builder)
      @underlying_builder = underlying_builder
      @printer = Printer.new
    end

    def validate
      return unless can_validate?
      return if is_valid?
      version = @underlying_builder.version || '(unknown)'
      message = %Q[Path for command "#{@underlying_builder.command_name}", version "#{version}" does not exist. Path: #{path}]
      @printer.print_error message
      raise message
    end

    private

    def can_validate?
      !path.nil?
    end

    def is_valid?
      File.exist? path
    end

    def path
      @underlying_builder.path
    end

  end
end