require File.expand_path(File.dirname(__FILE__) + '/executor_base')

module FluentCommandBuilder
  class SystemExecutor < ExecutorBase

    def do_execute(underlying_builder)
      system underlying_builder.to_s
    end

  end
end