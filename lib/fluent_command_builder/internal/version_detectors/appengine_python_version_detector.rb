require 'yaml'
require File.expand_path(File.dirname(__FILE__) + '/../path_finder')

module FluentCommandBuilder
  class AppEnginePythonVersionDetector

    def initialize(command_name)
      @command_name = command_name
    end

    def version(path=nil)
      path ||= FluentCommandBuilder.path_finder.find_path @command_name
      return unless path
      version_file = File.join path, 'VERSION'
      version_hash = YAML::load_file version_file
      version_hash['release']
    end

  end
end