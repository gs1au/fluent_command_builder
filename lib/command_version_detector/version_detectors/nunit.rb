require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class NUnit < StandardVersionDetector

    def executable_name
      'nunit-console'
    end

    def executable_args
      '/help'
    end

  end
end