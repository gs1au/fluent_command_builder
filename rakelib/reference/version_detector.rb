require 'rexml/document'

module VersionDetector

  def appengine_version
    path = '/Applications/GoogleAppEngineLauncher.app'
    return unless File.exist? path
    xml = IO.read File.join(path, 'Contents/Info.plist')
    doc = REXML::Document.new xml
    key = doc.elements.each('/plist/dict/key') {}.select { |key| key.text == 'CFBundleShortVersionString' }[0]
    key.next_element.text
  end

  def bundler_version
    match_version `bundle --version`
  end

  def cucumber_version
    match_version `cucumber --version`
  end

  def dot_net_version(path)
    match_version path
  end

  def dotcover_version
    match_version `dotcover version`
  end

  def msdeploy_version
    match_version `"%PROGRAMFILES%/IIS/Microsoft Web Deploy/msdeploy"`
  end

  def osx_version
    match_version `sw_vers -productVersion`
  end

  def rake_version
    match_version `rake --version`
  end

  def visual_studio_version(path)
    match_version path
  end

  def xcodebuild_version
    match_version `xcodebuild -version`
  end

  private

  def match_version(text)
    text.match(/(?:\d+\.)(?:\d+\.?)+/) { |m| m[0] }
  end

end