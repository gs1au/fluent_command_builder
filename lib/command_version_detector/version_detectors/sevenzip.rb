require File.expand_path(File.dirname(__FILE__) + '/../standard_version_detector')

module CommandVersionDetector
  class SevenZip < StandardVersionDetector

    def executable_name
      '7za'
    end

    def self.version(path=nil)
      SevenZip.new.version path
    end

  end
end