require 'yaml'
require File.expand_path(File.dirname(__FILE__) + '/../internal/path_finder')

module FluentCommandBuilder
  class AppEnginePythonVersionDetector

    attr_accessor :path_finder

    def initialize(command_name)
      @command_name = command_name
      @path_finder = FluentCommandBuilder.path_finder
    end

    def version(path=nil)
      path ||= @path_finder.find_path @command_name
      return unless path && File.exist?(path)
      version_file = File.join path, 'VERSION'
      version_hash = YAML::load_file version_file
      version_hash['release']
    end

  end
end