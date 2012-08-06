require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class MSDeploy

    def version(path=nil)
      d = StandardVersionDetector.new 'msdeploy'
      d.version path
    end

  end
end