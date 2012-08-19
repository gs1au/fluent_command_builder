require 'rake'
include Rake::DSL

module FluentCommandBuilder
  class RakeShExecutor
    def execute(command)
      sh command
    end
  end
end