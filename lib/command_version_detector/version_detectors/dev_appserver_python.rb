require File.expand_path(File.dirname(__FILE__) + '/../appengine_python_version_detector')

module CommandVersionDetector
  class DevAppserverPython < AppEnginePythonVersionDetector

    def executable_name
      'dev_appserver.py'
    end

  end
end