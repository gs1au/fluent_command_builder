require File.expand_path(File.dirname(__FILE__) + '/../../version')

module FluentCommandBuilder
  class StandardVersionDetector
    def self.version(executable_name, executable_args, path=nil)
      path ||= FluentCommandBuilder.path_finder.find_path executable_name
      return unless path
      executable = File.join path, executable_name
      command = %Q["#{executable}" #{executable_args} 2>&1]
      output = FluentCommandBuilder.executor.execute_backticks command
      Version.match(output).version
    end
  end
end