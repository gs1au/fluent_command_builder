require File.expand_path(File.dirname(__FILE__) + '/argument_formatter')
require File.expand_path(File.dirname(__FILE__) + '/execution_context')
require File.expand_path(File.dirname(__FILE__) + '/path_validator')
require File.expand_path(File.dirname(__FILE__) + '/version_validator')

module FluentCommandBuilder
  class UnderlyingBuilder
    include ArgumentFormatter

    attr_reader :command_name, :version, :args, :passwords
    attr_accessor :path, :version_detector, :version_validation_options

    def initialize(command_name, version=nil)
      @command_name = command_name
      @version = version
      @args = nil
      @passwords = []
      @version_validation_options = {}
      @path = nil
      @version_detector = nil
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
      validate_path if @path
      validate_version if @version_detector
      visible_command = @execution_context.formatter.format self
      @execution_context.execute to_s, visible_command
    end

    def to_s
      "#{quote_if_includes_space executable} #{@args}".strip
    end

    private

    def validate_path
      v = PathValidator.new @path, @command_name, @version
      v.validate
    end

    def validate_version
      v = VersionValidator.new @command_name, @path, @version, @version_detector, @version_validation_options
      v.validate
    end

  end
end