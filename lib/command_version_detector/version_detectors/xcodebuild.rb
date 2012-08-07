require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class XCodeBuild < StandardVersionDetector

    def executable_name
      'xcodebuild'
    end

    def executable_args
      '-version'
    end

    def self.version(path=nil)
      XCodeBuild.new.version path
    end

  end
end
