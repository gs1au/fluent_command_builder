require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class Cucumber < StandardVersionDetector

    def executable_name
      'cucumber'
    end

    def executable_args
      '--version'
    end

    def self.version(path=nil)
      Cucumber.new.version path
    end

  end
end