require_relative 'version_detectors/cucumber'; include CommandVersionDetector

puts Cucumber.new.version