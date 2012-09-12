require File.expand_path(File.dirname(__FILE__) + '/stateful_version_validator')

module FluentCommandBuilder
  class VersionValidator

    attr_accessor :warn_only, :enabled

    def initialize(command_name, version_detector, expected_version)
      @command_name = command_name
      @version_detector = version_detector
      @expected_version = expected_version
      @warn_only = false
      @enabled = true
    end

    def validate(path=nil)
      return unless enabled
      v = StatefulVersionValidator.new @command_name, path, @version_detector, @expected_version
      v.warn_only = @warn_only
      v.validate
    end

  end
end