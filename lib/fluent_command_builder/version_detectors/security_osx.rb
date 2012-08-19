require File.expand_path(File.dirname(__FILE__) + '/lib/standard_version_detector')

module FluentCommandBuilder
  module SecurityOSX
    def self.version(path=nil)
      StandardVersionDetector.version 'sw_vers', '-productVersion', path
    end
  end
end