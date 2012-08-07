require File.expand_path(File.dirname(__FILE__) + '/path_finder')

module CommandVersionDetector
  class StandardVersionDetector

    def version(path=nil)
      path ||= PathFinder.find_path executable_name
      executable = File.join path, executable_name
      output = `"#{executable}" #{executable_args}`
      match_version output
    end

    protected

    def executable_name
      raise 'Not implemented.'
    end

    def executable_args
      ''
    end

    private

    def match_version(text)
      text.match(/(?:\d+\.)(?:\d+\.?)+/) { |m| m[0] }
    end

  end
end