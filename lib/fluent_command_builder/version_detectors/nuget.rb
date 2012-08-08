require File.expand_path(File.dirname(__FILE__) + '/lib/standard_version_detector')

module FluentCommandBuilder
  module NuGet
    def self.version(path=nil)
      StandardVersionDetector.version 'nuget', '', path
    end
  end
end