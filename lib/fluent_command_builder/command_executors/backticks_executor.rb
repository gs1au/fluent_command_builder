require File.expand_path(File.dirname(__FILE__) + '/formattable_executor')

module FluentCommandBuilder
  class BackticksExecutor < FormattableExecutor

    def do_execute(underlying_builder)
      `#{underlying_builder}`
    end

  end
end