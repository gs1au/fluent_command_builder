require File.expand_path(File.dirname(__FILE__) + '/version')

module FluentCommandBuilder

  class VersionValidator

    def initialize(command_builder_class, path)
      @command_builder_class = command_builder_class
      @path = path
    end

    def is_valid?
      version_in_use.compact == version_on_path.compact
    end

    def validate
      is_valid = version_in_use.compact == version_on_path.compact
      puts "WARNING: Command Builder version #{version_in_use} does not match tool version #{version_on_path}." unless is_valid
    end

    def version_in_use
      @version_in_use ||= Version.new(module_at_index(2)::VERSION)
    end

    def version_on_path
      @version_on_path ||= Version.new(module_at_index(1).version(@path))
    end

    private

    def module_at_index(index)
      module_name = @command_builder_class.name.split('::').first(index + 1).join('::')
      eval module_name
    end

  end
end