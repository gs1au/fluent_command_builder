require_relative 'executor_base'

module FluentCommandBuilder
  class SystemExecutor < ExecutorBase

    def do_execute(command)
      system command.to_s
    end

  end
end