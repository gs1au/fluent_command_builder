require File.expand_path(File.dirname(__FILE__) + '/lib/standard_version_detector')

module FluentCommandBuilder
  module SevenZip
    def self.version(path=nil)
      StandardVersionDetector.version '7za', '', path
    end
  end
end