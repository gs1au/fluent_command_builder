module FluentCommandBuilder
  class ExecutorBase

    attr_accessor :error_handlers

    def initialize
      @error_handlers = []
    end

    def execute(underlying_builder)
      result = do_execute underlying_builder
      @error_handlers.each { |h| h.handle_error status, failed_command_text(underlying_builder) } unless status.success?
      result
    end

    protected

    def do_execute(underlying_builder)
      # template method
    end

    def status
      $?
    end

    def failed_command_text(underlying_builder)
      underlying_builder.to_s
    end

  end
end