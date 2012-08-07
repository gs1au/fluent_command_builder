require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class NuGet < StandardVersionDetector

    def executable_name
      'nuget'
    end

  end
end