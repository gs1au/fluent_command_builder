require File.expand_path(File.dirname(__FILE__) + '/executor_base')

module FluentCommandBuilder
  class FormattableExecutor < ExecutorBase

    attr_accessor :formatter

    def initialize
      @formatter = nil
    end

    def do_execute(underlying_builder)
      puts @formatter.format(underlying_builder) if @formatter
      self.do_execute underlying_builder
    end

    def failed_command_text(underlying_builder)
      @formatter ? @formatter.format(underlying_builder) : underlying_builder.to_s
    end

  end
end