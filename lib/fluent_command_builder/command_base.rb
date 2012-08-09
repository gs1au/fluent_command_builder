require 'rake'
include Rake::DSL

module FluentCommandBuilder
  class CommandBase

    def initialize(builder)
      @builder = builder
    end

    def execute!
      yield @builder if block_given?
      sh to_s
    end

    def to_s
      return yield @builder if block_given?
      @builder.to_s
    end

  end
end