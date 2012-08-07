require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class MSDeploy < StandardVersionDetector

    def executable_name
      'msdeploy'
    end

    def self.version(path=nil)
      MSDeploy.new.version path
    end

  end
end