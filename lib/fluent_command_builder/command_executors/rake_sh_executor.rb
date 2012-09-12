require File.expand_path(File.dirname(__FILE__) + '/executor_base')
require 'rake'
include Rake::DSL

module FluentCommandBuilder
  class RakeShExecutor < ExecutorBase

    def do_execute(command)
      sh command.to_s
    end

    def will_print_on_execute?
      true
    end

    def will_fail_on_error?
      true
    end

  end
end