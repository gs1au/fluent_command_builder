require File.expand_path(File.dirname(__FILE__) + '/lib/appengine_python_version_detector')

module FluentCommandBuilder
  module DevAppserverPython
    def self.version(path=nil)
      AppEnginePythonVersionDetector.version 'dev_appserver.py', path
    end
  end
end