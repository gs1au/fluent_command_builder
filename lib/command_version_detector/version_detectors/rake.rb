require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class Rake < StandardVersionDetector

    def executable_name
      'rake'
    end

    def executable_args
      '--version'
    end

  end
end
