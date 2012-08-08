require File.expand_path(File.dirname(__FILE__) + '/lib/appengine_python_version_detector')

module FluentCommandBuilder
  module AppCfgPython
    def self.version(path=nil)
      AppEnginePythonVersionDetector.version 'appcfg.py', path
    end
  end
end