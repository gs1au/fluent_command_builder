namespace :ref do
  is_windows = RUBY_PLATFORM =~ /(win|w)32$/
  Dir[File.expand_path(File.dirname(__FILE__) + '/ref/win/*.rake')].each { |f| load f } if is_windows
  Dir[File.expand_path(File.dirname(__FILE__) + '/ref/unix/*.rake')].each { |f| load f } unless is_windows
end