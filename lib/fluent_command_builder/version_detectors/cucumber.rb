require File.expand_path(File.dirname(__FILE__) + '/../version_detector_base')

class Cucumber < VersionDetectorBase

  def executable_name
    'cucumber'
  end

  def version(path=nil)
    match_version execute(path, '--version')
  end

end