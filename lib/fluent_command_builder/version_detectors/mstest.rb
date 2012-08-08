require File.expand_path(File.dirname(__FILE__) + '/lib/standard_version_detector')

module FluentCommandBuilder
  module MSTest
    def self.version(path=nil)
      StandardVersionDetector.version 'mstest', '/help', path
    end
  end
end