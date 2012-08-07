require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class MSBuild < StandardVersionDetector

    def executable_name
      'msbuild'
    end

    def executable_args
      '/version'
    end

  end
end