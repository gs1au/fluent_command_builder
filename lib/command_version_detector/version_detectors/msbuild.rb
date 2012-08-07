require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class MSBuild < StandardVersionDetector

    def executable_name
      'msbuild'
    end

    def executable_args
      '/version'
    end

    def self.version(path=nil)
      MSBuild.new.version path
    end

  end
end