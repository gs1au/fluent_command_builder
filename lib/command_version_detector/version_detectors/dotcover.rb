require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class DotCover < StandardVersionDetector

    def executable_name
      'dotcover'
    end

    def executable_args
      'version'
    end

    def self.version(path=nil)
      DotCover.new.version path
    end

  end
end