require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class Cucumber

    def version(path=nil)
      d = StandardVersionDetector.new 'cucumber', '--version'
      d.version path
    end

  end
end