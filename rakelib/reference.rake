require_relative '../lib/command_version_detector'; include CommandVersionDetector

namespace :reference do
  is_windows = RUBY_PLATFORM =~ /(win|w)32$/
  file = is_windows ? 'win' : 'nix'
  load File.expand_path(File.dirname(__FILE__) + "/reference/#{file}.rake")
end