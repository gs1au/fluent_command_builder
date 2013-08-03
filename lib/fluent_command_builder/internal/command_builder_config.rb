require 'getversion'
require_relative '../version_validator'
require_relative 'path'
require_relative 'path_validator'

module FluentCommandBuilder
  class CommandBuilderConfig

    attr_accessor :path, :command_name, :version,
                  :path_validation_level, :version_validation_level,
                  :path_validator, :version_validator

    def initialize(command_name, version=nil)
      @path = nil
      @command_name = command_name
      @version = version
      @path_validation_level = :fatal
      @version_validation_level = :fatal
      @path_validator = PathValidator.new self
      @version_validator = nil
    end

    def validate_path
      @path_validator.validate
    end

    def validate_version
      return unless @version
      v = @version_validator || version_validator.new(@command_name) { |path| GetVersion[path] }
      p = Path.new @path
      v.validate @version, p.evaluated_path
    end

    def executable
      p = Path.new @path.to_s, @command_name
      p.normalised_path
    end

  end
end