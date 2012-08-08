require 'yaml'
require File.expand_path(File.dirname(__FILE__) + '/path_finder')

module FluentCommandBuilder
  class AppEnginePythonVersionDetector

    def self.version(executable_name, path=nil)
      path ||= PathFinder.find_path executable_name
      version_file = File.join path, 'VERSION'
      version_hash = YAML::load_file version_file
      version_hash['release']
    end

  end
end