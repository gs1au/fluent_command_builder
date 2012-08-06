require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class NuGet

    def version(path=nil)
      d = StandardVersionDetector.new 'nuget'
      d.version path
    end

  end
end