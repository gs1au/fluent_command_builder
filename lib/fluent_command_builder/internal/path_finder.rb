require File.expand_path(File.dirname(__FILE__) + '/path_finders/unix_path_finder')
require File.expand_path(File.dirname(__FILE__) + '/path_finders/windows_path_finder')

module FluentCommandBuilder

  def self.path_finder
    @path_finder ||= is_windows? ? WindowsPathFinder.new : UnixPathFinder.new
  end

  def self.path_finder=(value)
    @path_finder = value
  end

  private

  def self.is_windows?
    !ENV['WINDIR'].nil?
  end

end