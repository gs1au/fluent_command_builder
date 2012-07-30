require 'rexml/document'

class AppEngine

  def initialize
    @path = '/Applications/GoogleAppEngineLauncher.app'
  end

  def path
    @path
  end

  def version
    xml = IO.read File.join(@path, 'Contents/info.plist')
    doc = REXML::Document.new xml
    doc.elements.each('/plist/dict/key') {}.select { |key| key.text == 'CFBundleShortVersionString' }[0]
  end

  def major_version
    version.match(/^\d+/)[0]
  end

  def minor_version
    version.match(/^\d+\.(\d+)/)[1]
  end

end