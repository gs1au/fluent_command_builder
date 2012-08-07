require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class MSTest < StandardVersionDetector

    def executable_name
      'mstest'
    end

    def executable_args
      '/help'
    end

  end
end