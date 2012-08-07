require_relative 'version_detectors/tf'; include CommandVersionDetector

puts Tf.new.version 'C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE'