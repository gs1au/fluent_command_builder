require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class NuGet < StandardVersionDetector

    def executable_name
      'nuget'
    end

    def self.version(path=nil)
      NuGet.new.version path
    end

  end
end