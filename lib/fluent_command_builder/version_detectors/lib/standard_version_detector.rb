require File.expand_path(File.dirname(__FILE__) + '/path_finder')
require File.expand_path(File.dirname(__FILE__) + '/../../util.rb')

module FluentCommandBuilder
  class StandardVersionDetector
    def self.version(executable_name, executable_args, path=nil)
      path ||= PathFinder.find_path executable_name
      return unless path
      executable = File.join path, executable_name
      command = %Q["#{executable}" #{executable_args} 2>&1]
      output = `#{command}`
      match_version output
    end
  end
end