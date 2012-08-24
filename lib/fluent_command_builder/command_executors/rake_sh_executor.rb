require 'rake'
include Rake::DSL

module FluentCommandBuilder
  class RakeShExecutor

    def execute(underlying_builder)
      sh underlying_builder.to_s
    end

  end
end