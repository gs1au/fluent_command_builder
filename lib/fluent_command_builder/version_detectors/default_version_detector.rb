require File.expand_path(File.dirname(__FILE__) + '/../internal/path_finder')
require File.expand_path(File.dirname(__FILE__) + '/../internal/version')
require File.expand_path(File.dirname(__FILE__) + '/standard_version_detector')

module FluentCommandBuilder
  class DefaultVersionDetector

    attr_accessor :path_finder

    def initialize(command_name)
      @command_name = command_name
      @command_args = %w(--version -version /version --help -help /help version help)
      @path_finder = FluentCommandBuilder.path_finder
    end

    def version(path=nil)
      path ||= @path_finder.find_path @command_name
      return unless path && File.exist?(path)
      @command_args.each do |command_arg|
        version = try_get_version command_arg
        return version if version
      end
      try_get_version
    end

    private

    def try_get_version(command_arg=nil)
      d = StandardVersionDetector.new @command_name, command_arg
      d.path_finder = @path_finder
      d.version
    end

  end
end