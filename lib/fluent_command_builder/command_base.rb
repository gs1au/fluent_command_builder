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

  end
end