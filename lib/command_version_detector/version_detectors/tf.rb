require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class Tf < StandardVersionDetector

    def executable_name
      'tf'
    end

  end
end