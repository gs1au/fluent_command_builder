require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  class StandardVersionDetector

    def initialize(command_name, command_arg=nil)
      @command_name = command_name
      @command_arg = command_arg
    end

    def version(path=nil)
      path ||= FluentCommandBuilder.path_finder.find_path @command_name
      return unless path
      executable = File.join path, @command_name
      command = %Q["#{executable}" #{@command_arg} 2>&1]
      output = FluentCommandBuilder.executor.execute_backticks command
      v = Version.match(output)
      v ? v.version : nil
    end

  end
end