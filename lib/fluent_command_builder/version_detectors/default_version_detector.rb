require File.expand_path(File.dirname(__FILE__) + '/../version')
require File.expand_path(File.dirname(__FILE__) + '/standard_version_detector')

module FluentCommandBuilder
  class DefaultVersionDetector

    def initialize(command_name)
      @command_name = command_name
      @command_args = %w(--version -version /version --help -help /help version help)
    end

    def version(path=nil)
      path ||= FluentCommandBuilder.path_finder.find_path @command_name
      return unless path

      @command_args.each do |command_arg|
        version = try_get_version command_arg
        return version if version
      end

      try_get_version
    end

    private

    def try_get_version(command_arg=nil)
      d = StandardVersionDetector.new @command_name, command_arg
      d.version
    end

  end
end