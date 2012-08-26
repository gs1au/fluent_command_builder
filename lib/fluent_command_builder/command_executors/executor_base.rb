module FluentCommandBuilder
  class ExecutorBase

    def execute(underlying_builder)
      result = do_execute underlying_builder
      yield $?
      result
    end

    def will_print_on_execute?
      false
    end

    def will_fail_on_error?
      false
    end

    protected

    def do_execute(underlying_builder)
      # template method
    end

  end
end