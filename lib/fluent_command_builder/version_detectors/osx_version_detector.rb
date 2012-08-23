require File.expand_path(File.dirname(__FILE__) + '/standard_version_detector')

module FluentCommandBuilder
  class OsxVersionDetector

    def version(path=nil)
      d = StandardVersionDetector.new 'sw_vers', '-productVersion'
      d.version
    end

  end
end