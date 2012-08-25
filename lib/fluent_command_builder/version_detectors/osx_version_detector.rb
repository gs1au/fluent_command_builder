require File.expand_path(File.dirname(__FILE__) + '/standard_version_detector')

module FluentCommandBuilder
  class OsxVersionDetector

    attr_accessor :backticks_executor

    def version(path=nil)
      d = StandardVersionDetector.new 'sw_vers', '-productVersion'
      d.backticks_executor = @backticks_executor if @backticks_executor
      d.version
    end

  end
end