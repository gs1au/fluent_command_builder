require File.expand_path(File.dirname(__FILE__) + '/../appengine_python_version_detector')

module CommandVersionDetector
  class AppCfgPython < AppEnginePythonVersionDetector

    def executable_name
      'appcfg.py'
    end

    def self.version(path=nil)
      AppCfgPython.new.version path
    end

  end
end