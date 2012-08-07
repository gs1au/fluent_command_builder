require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class SecurityOsx < StandardVersionDetector

    def executable_name
      'sw_vers'
    end

    def executable_args
      '-productVersion'
    end

    def self.version(path=nil)
      SecurityOsx.new.version path
    end

  end
end