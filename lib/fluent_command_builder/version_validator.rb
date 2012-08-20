require File.expand_path(File.dirname(__FILE__) + '/printer')
require File.expand_path(File.dirname(__FILE__) + '/version')

module FluentCommandBuilder

  class VersionValidator

    def initialize(command_builder_class, path)
      @command_builder_class = command_builder_class
      @path = path
      @printer = Printer.new
    end

    def validate
      unless can_validate?
        @printer.print_warning %Q[Version validation for command "#{command_name}" aborted. An internal error occurred.]
        return
      end

      unless is_valid?
        @printer.print_warning %Q[Version validation for command "#{command_name}" failed. Expected version #{version_in_use.to_s(2)} but was #{version_on_path.to_s(2)}.]
      end
    end

    def can_validate?
      begin
        is_valid?
        return true
      rescue
        return false
      end
    end

    def is_valid?
      version_in_use.compact == version_on_path.compact
    end

    private

    def version_in_use
      @version_in_use ||= Version.new(module_at_index(2)::VERSION)
    end

    def version_on_path
      @version_on_path ||= Version.new(module_at_index(1).version(@path))
    end

    def command_name
      @command_name ||= module_at_index(1)::COMMAND_NAME
    end

    def module_at_index(index)
      module_name = @command_builder_class.name.split('::').first(index + 1).join('::')
      eval module_name
    end

  end
end