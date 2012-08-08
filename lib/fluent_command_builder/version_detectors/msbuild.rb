require File.expand_path(File.dirname(__FILE__) + '/lib/standard_version_detector')

module FluentCommandBuilder
  module MSBuild
    def self.version(path=nil)
      StandardVersionDetector.version 'msbuild', '/version', path
    end
  end
end