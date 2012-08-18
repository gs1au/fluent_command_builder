require File.expand_path(File.dirname(__FILE__) + '/executors/backticks_executor')
require File.expand_path(File.dirname(__FILE__) + '/executors/dry_run_executor')
require File.expand_path(File.dirname(__FILE__) + '/executors/rake_sh_executor')
require File.expand_path(File.dirname(__FILE__) + '/executors/system_executor')

module FluentCommandBuilder
  class Executor

    attr_accessor :backticks_executor, :dry_run_executor, :rake_sh_executor, :system_executor

    def initialize
      @backticks_executor = BackticksExecutor.new
      @dry_run_executor = DryRunExecutor.new
      @rake_sh_executor = RakeShExecutor.new
      @system_executor = SystemExecutor.new
    end

    def execute_backticks(command)
      @backticks_executor.execute command
    end

    def execute_dry_run(command)
      @dry_run_executor.execute command
    end

    def execute_rake_sh(command)
      @rake_sh_executor.execute command
    end

    def execute_system(command)
      @system_executor.execute command
    end

  end

  def self.executor
    @executor ||= Executor.new
  end

  def self.executor=(value)
    @executor = value
  end

end
