require File.expand_path(File.dirname(__FILE__) + '/printer')

module FluentCommandBuilder
  class DefaultPathValidator

    def initialize(default_path, command_name, version)
      @default_path = default_path.to_s
      @command_name = command_name
      @version = version
      @printer = Printer.new
    end

    def validate
      return unless can_validate?
      return if is_valid?
      version = @version || '(unknown)'
      message = %Q[Default Path for command "#{@command_name}", version "#{version}" does not exist. Path: #{@default_path}]
      @printer.print_warning message
    end

    private

    def can_validate?
      !@default_path.nil?
    end

    def is_valid?
      File.exist? @default_path
    end

  end
end

