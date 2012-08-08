require File.expand_path(File.dirname(__FILE__) + '/lib/standard_version_detector')

module FluentCommandBuilder
  module Tf
    def self.version(path=nil)
      StandardVersionDetector.version 'tf', '', path
    end
  end
end