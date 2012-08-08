require File.expand_path(File.dirname(__FILE__) + '/lib/standard_version_detector')

module FluentCommandBuilder
  module Rake
    def self.version(path=nil)
      StandardVersionDetector.version 'rake', '--version', path
    end
  end
end