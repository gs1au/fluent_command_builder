require File.expand_path(File.dirname(__FILE__) + '/lib/standard_version_detector')

module FluentCommandBuilder
  module NUnit
    def self.version(path=nil)
      StandardVersionDetector.version 'nunit-console', '/help', path
    end
  end
end