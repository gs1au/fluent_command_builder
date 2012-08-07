require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class Cucumber < StandardVersionDetector

    def executable_name
      'dotcover'
    end

    def executable_args
      'version'
    end

  end
end