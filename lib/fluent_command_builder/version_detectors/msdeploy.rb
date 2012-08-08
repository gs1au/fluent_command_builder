require File.expand_path(File.dirname(__FILE__) + '/lib/standard_version_detector')

module FluentCommandBuilder
  module MSDeploy
    def self.version(path=nil)
      StandardVersionDetector.version 'msdeploy', '', path
    end
  end
end