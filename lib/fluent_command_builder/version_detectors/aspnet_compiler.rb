require File.expand_path(File.dirname(__FILE__) + '/msbuild')

module FluentCommandBuilder
  module AspnetCompiler
    def self.version(path=nil)
      MSBuild.version path
    end
  end
end