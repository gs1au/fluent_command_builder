require File.expand_path(File.dirname(__FILE__) + '/executor_base')

module FluentCommandBuilder
  class BackticksExecutor < ExecutorBase

    def do_execute(command)
      `#{command}`
    end

  end
end