require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class Bundler < StandardVersionDetector

    def executable_name
      'bundle'
    end

    def executable_args
      '--version'
    end

    def self.version(path=nil)
      Bundler.new.version path
    end

  end
end
