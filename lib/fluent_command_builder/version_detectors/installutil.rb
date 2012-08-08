require File.expand_path(File.dirname(__FILE__) + '/lib/standard_version_detector')

module FluentCommandBuilder
  module InstallUtil
    def self.version(path=nil)
      StandardVersionDetector.version 'installutil', '', path
    end
  end
end