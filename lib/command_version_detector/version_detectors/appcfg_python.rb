require File.expand_path(File.dirname(__FILE__) + '/../appengine_python_version_detector')

module CommandVersionDetector
  class AppCfgPython < AppEnginePythonVersionDetector

    def executable_name
      'appcfg.py'
    end

  end
end