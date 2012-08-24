require File.expand_path(File.dirname(__FILE__) + '/executor_base')
require 'rake'
include Rake::DSL

module FluentCommandBuilder
  class RakeShExecutor < ExecutorBase

    def do_execute(underlying_builder)
      sh underlying_builder.to_s
    end

  end
end