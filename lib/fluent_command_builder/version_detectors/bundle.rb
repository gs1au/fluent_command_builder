require File.expand_path(File.dirname(__FILE__) + '/lib/standard_version_detector')

module FluentCommandBuilder
  module Bundle
    def self.version(path=nil)
      StandardVersionDetector.version 'bundle', '--version', path
    end
  end
end