require File.expand_path(File.dirname(__FILE__) + '/version')
require 'rake'
include Rake::DSL

module FluentCommandBuilder
  class CommandBase

    def initialize(underlying_builder)
      @b = underlying_builder
    end

    def execute!
      yield @b if block_given?
      @b.execute
    end

    def to_s
      return yield @b if block_given?
      @b.to_s
    end

    private

    def validate_version
      is_valid = version_in_use.compact == version_on_path.compact
      puts 'WARNING' unless is_valid
    end

    def version_in_use
      Version.new module_at_index(2)::VERSION
    end

    def version_on_path
      Version.new module_at_index(3).version(@b.path)
    end

    def module_at_index(index)
      module_name = self.class.name.split('::').first(index + 1).join('::')
      eval module_name
    end

  end
end