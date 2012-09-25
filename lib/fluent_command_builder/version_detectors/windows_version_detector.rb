require File.expand_path(File.dirname(__FILE__) + '/standard_version_detector')

module FluentCommandBuilder
  class WindowsVersionDetector

    def version(path=nil)
      d = StandardVersionDetector.new 'ver'
      d.version
    end

  end
end