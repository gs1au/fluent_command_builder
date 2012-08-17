require 'rake'

module FluentCommandBuilder
  class RakeShExecutor
    def execute(command)
      sh command
    end
  end
end