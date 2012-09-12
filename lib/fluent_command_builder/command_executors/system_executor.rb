require File.expand_path(File.dirname(__FILE__) + '/executor_base')

module FluentCommandBuilder
  class SystemExecutor < ExecutorBase

    def do_execute(command)
      system command.to_s
    end

  end
end