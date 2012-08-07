require 'yaml'
require File.expand_path(File.dirname(__FILE__) + '/path_finder')

module CommandVersionDetector
  class AppEnginePythonVersionDetector

    def version(path=nil)
      path ||= PathFinder.find_path executable_name
      version_file = File.join path, 'VERSION'
      version_hash = YAML::load_file version_file
      version_hash['release']
    end

    protected

    def executable_name
      raise 'Not implemented.'
    end

  end
end