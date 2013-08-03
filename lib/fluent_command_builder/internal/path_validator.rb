require_relative 'path'
require_relative 'printer'

module FluentCommandBuilder
  class PathValidator

    attr_accessor :printer, :should_abort_on_fatal

    def initialize(command_builder_config)
      @c = command_builder_config
      @printer = Printer.new
      @should_abort_on_fatal = true
    end

    def validate
      validate_validation_level
      return if validation_level == :off

      if @c.path
        p = Path.new @c.path
        evaluated_path = p.evaluated_path
        return if File.exist? evaluated_path
        message = %Q[Path for command "#{@c.command_name}", version "#{@c.version}" does not exist. Path: #{evaluated_path}]
      else
        return if WickedWitch[@c.command_name]
        message = %Q[Command "#{@c.command_name}" was not found on the PATH.]
      end

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

    private

    def validation_level
      @c.path_validation_level
    end

    def validate_validation_level
      raise %Q[Validation level "#{validation_level}" is not supported.] unless validation_level_valid?
    end

    def validation_level_valid?
      [:off, :warn, :fatal].include? validation_level
    end

  end
end