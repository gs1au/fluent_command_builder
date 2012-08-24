require File.expand_path(File.dirname(__FILE__) + '/../command_formatters/null_formatter.rb')

module FluentCommandBuilder
  class FormattableExecutor

    attr_accessor :formatter

    def initialize
      @formatter = NullFormatter.new
    end

    def execute(underlying_builder)
      print underlying_builder
      do_execute underlying_builder
    end

    protected

    def do_execute(underlying_builder)
      # this is a template method
    end

    private

    def print(underlying_builder)
      puts @formatter.format underlying_builder
    end

  end
end