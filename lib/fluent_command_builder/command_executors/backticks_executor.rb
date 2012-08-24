require File.expand_path(File.dirname(__FILE__) + '/executor_base')

module FluentCommandBuilder
  class BackticksExecutor < ExecutorBase

    def do_execute(underlying_builder)
      `#{underlying_builder}`
    end

  end
end