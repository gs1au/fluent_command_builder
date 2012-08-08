require File.expand_path(File.dirname(__FILE__) + '/lib/standard_version_detector')

module FluentCommandBuilder
  module Cucumber
    def self.version(path=nil)
      StandardVersionDetector.version 'cucumber', '--version', path
    end
  end
end