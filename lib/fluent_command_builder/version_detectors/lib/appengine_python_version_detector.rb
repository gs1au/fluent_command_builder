require 'yaml'

module FluentCommandBuilder
  class AppEnginePythonVersionDetector

    def self.version(executable_name, path=nil)
      path ||= FluentCommandBuilder.path_finder.find_path executable_name
      return unless path
      version_file = File.join path, 'VERSION'
      version_hash = YAML::load_file version_file
      version_hash['release']
    end

  end
end