require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class Bundler < StandardVersionDetector

    def executable_name
      'bundle'
    end

    def executable_args
      '--version'
    end

  end
end
