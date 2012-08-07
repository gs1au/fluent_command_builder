require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class NUnit < StandardVersionDetector

    def executable_name
      'nunit-console'
    end

    def executable_args
      '/help'
    end

    def self.version(path=nil)
      NUnit.new.version path
    end

  end
end