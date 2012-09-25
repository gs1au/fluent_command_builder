require File.expand_path(File.dirname(__FILE__) + '/../internal/path_finder')

module FluentCommandBuilder
  class DotNetFrameworkVersionDetector

    attr_accessor :path_finder, :backticks_executor

    def initialize
      @path_finder = FluentCommandBuilder.path_finder
      @backticks_executor = BackticksExecutor.new
    end

    def version(path=nil)
      path ||= @path_finder.find_path 'msbuild'
      return unless path && File.exist?(path)
      Dir.chdir path do
        command = 'msbuild /version'
        output = @backticks_executor.execute command
        output.scan(/\[Microsoft .NET Framework, Version (.+)\]/).first
      end
    end

  end
end