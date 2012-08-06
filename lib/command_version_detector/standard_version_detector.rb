require File.expand_path(File.dirname(__FILE__) + '/path_finder')

module CommandVersionDetector
  class StandardVersionDetector

    def initialize(executable_name, executable_args=nil)
      @executable_name = executable_name
      @executable_args = executable_args
    end

    def version(path=nil)
      path ||= PathFinder.find_path @executable_name
      executable = File.join path, @executable_name
      output = `"#{executable}" #{@executable_args}`
      match_version output
    end

    private

    def match_version(text)
      text.match(/(?:\d+\.)(?:\d+\.?)+/) { |m| m[0] }
    end

  end
end