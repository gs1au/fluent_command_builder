require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class Bundler

    def version(path=nil)
      d = StandardVersionDetector.new 'bundle', '--version'
      d.version path
    end

  end
end
