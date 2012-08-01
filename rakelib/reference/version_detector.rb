require 'rexml/document'

module VersionDetector

  def appengine_version
    path = '/Applications/GoogleAppEngineLauncher.app'
    xml = IO.read File.join(path, 'Contents/Info.plist')
    doc = REXML::Document.new xml
    key = doc.elements.each('/plist/dict/key') {}.select { |key| key.text == 'CFBundleShortVersionString' }[0]
    key.next_element.text
  end

  def cucumber_version
    `cucumber --version`
  end

  def dot_net_version(path)
    path.gsub! '\\', '/'
    path.match(/\/v(.+)\//)[1]
  end

  def dotcover_version
    `dotcover version`.match(/v(\d+\.\d+.\d+\.\d+)/)[1]
  end

  def rake_version
    `rake --version`.match(/version (.+)/)[1]
  end

end