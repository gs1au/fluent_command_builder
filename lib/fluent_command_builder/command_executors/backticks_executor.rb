require File.expand_path(File.dirname(__FILE__) + '/executor_base')

module FluentCommandBuilder
  class BackticksExecutor < ExecutorBase

    attr_accessor :password_formatter, :passwords

    def initialize
      @password_formatter = FluentCommandBuilder.password_formatter
      @passwords = []
    end

    def do_execute(command)
      output = `#{command}`
      @password_formatter.format output, @passwords
    end

  end
end