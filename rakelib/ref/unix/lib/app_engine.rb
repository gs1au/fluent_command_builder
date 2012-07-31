require 'rexml/document'

class AppEngine

  def self.version
    path = '/Applications/GoogleAppEngineLauncher.app'
    xml = IO.read File.join(path, 'Contents/Info.plist')
    doc = REXML::Document.new xml
    key = doc.elements.each('/plist/dict/key') {}.select { |key| key.text == 'CFBundleShortVersionString' }[0]
    key.next_element.text
  end

end