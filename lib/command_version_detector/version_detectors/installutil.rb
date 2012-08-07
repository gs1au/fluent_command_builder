require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class InstallUtil < StandardVersionDetector

    def executable_name
      'installutil'
    end

  end
end