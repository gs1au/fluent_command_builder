module FluentCommandBuilder
  class ExecutorBase

    def execute(command)
      result = do_execute command
      yield $? if block_given?
      result
    end

    def will_print_on_execute?
      false
    end

    def will_fail_on_error?
      false
    end

    protected

    def do_execute(command)
      # template method
    end

  end
end