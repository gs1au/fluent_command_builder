require File.expand_path(File.dirname(__FILE__) + '/../../lib/command_version_detector')
require 'rake'
include Rake::DSL

module FluentCommandBuilder
  class CommandBase

    def initialize(underlying_builder)
      @underlying_builder = underlying_builder
    end

    def execute!
      yield b if block_given?
      sh to_s
    end

    def to_s
      return yield b if block_given?
      b.to_s
    end

    protected

    def b
      @underlying_builder
    end

    private

    def validate_version
      is_valid = compact_version(version_in_use) == compact_version(version_on_path)
      puts 'WARNING' unless is_valid
    end

    def version_in_use
      module_at_index(2)::VERSION
    end

    def version_on_path
      module_at_index(3).version b.path
    end

    def module_at_index(index)
      module_name = self.class.name.split('::').first(index + 1).join('::')
      eval module_name
    end

  end
end