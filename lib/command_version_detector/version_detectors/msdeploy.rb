require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class MSDeploy < StandardVersionDetector

    def executable_name
      'msdeploy'
    end

  end
end