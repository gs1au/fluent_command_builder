require File.expand_path(File.dirname(__FILE__) + '/lib/standard_version_detector')

module FluentCommandBuilder
  module XCodeBuild
    def self.version(path=nil)
      StandardVersionDetector.version 'xcodebuild', '-version', path
    end
  end
end