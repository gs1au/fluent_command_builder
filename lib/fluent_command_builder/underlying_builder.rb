require File.expand_path(File.dirname(__FILE__) + '/argument_formatter')
require File.expand_path(File.dirname(__FILE__) + '/execution_context')

module FluentCommandBuilder
  class UnderlyingBuilder
    include ArgumentFormatter

    attr_reader :command_name, :version, :args, :passwords
    attr_accessor :path, :actual_version_lambda

    def initialize(command_name, version=nil)
      @command_name = command_name
      @version = version
      @args = nil
      @passwords = []
      @path = nil
      @actual_version_lambda = nil
      @execution_context = FluentCommandBuilder.execution_context
    end

    def append(value)
      v = value.to_s
      v = @args ? v : v.lstrip
      @args = @args.to_s + v
    end

    def executable
      e = @path ? File.join(@path, @command_name) : @command_name
      e.gsub! '/', '\\' if e.include? '\\'
      e
    end

    def execute
      @execution_context.execute self
    end

    def actual_version
      @actual_version_lambda.call @path if @actual_version_lambda
    end

    def to_s
      "#{quote_if_includes_space executable} #{@args}".strip
    end

  end
end