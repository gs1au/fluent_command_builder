require File.expand_path(File.dirname(__FILE__) + '/lib/standard_version_detector')

module FluentCommandBuilder
  module DotCover
    def self.version(path=nil)
      StandardVersionDetector.version 'dotcover', 'version', path
    end
  end
end