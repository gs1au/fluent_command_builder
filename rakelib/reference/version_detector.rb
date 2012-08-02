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
    path.gsub! '\\', '/'
    path.match(/\/v(.+)\//)[1]
  end

  def dotcover_version
    `dotcover version`.match(/v(\d+\.\d+.\d+\.\d+)/)[1]
  end

  def msdeploy_version
    `"%PROGRAMFILES%/IIS/Microsoft Web Deploy/msdeploy"`.match(/Version (.+)/)[1]
  end

  def rake_version
    match_version `rake --version`
  end

  def visual_studio_version(path)
    path.gsub! '\\', '/'
    path.match(/\/Microsoft Visual Studio (.+)\//)[1]
  end

  def xcodebuild_version
    match_version `xcodebuild -version`
  end

  private

  def match_version(text)
    text.match(/(?:\d+\.?){2,4}/) { |m| m[0] }
  end

end