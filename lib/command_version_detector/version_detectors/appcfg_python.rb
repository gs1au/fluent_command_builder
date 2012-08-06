require 'yaml'
require File.expand_path(File.dirname(__FILE__) + '/../path_finder')

module CommandVersionDetector
  class AppCfgPython

    def version(path=nil)
      path ||= PathFinder.find_path 'appcfg.py'
      version_file = File.join path, 'VERSION'
      version_hash = YAML::load_file version_file
      version_hash['release']
    end

  end
end