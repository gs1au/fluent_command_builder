require File.expand_path(File.dirname(__FILE__) + '/../version_validator')
require File.expand_path(File.dirname(__FILE__) + '/../version_detectors/default_version_detector')
require File.expand_path(File.dirname(__FILE__) + '/path')
require File.expand_path(File.dirname(__FILE__) + '/path_validator')

module FluentCommandBuilder
  class CommandBuilderConfig

    attr_accessor :path, :command_name, :version, :version_detector,
                  :path_validation_level, :version_validation_level,
                  :path_validator, :version_validator,
                  :is_windows

    def initialize(command_name, version=nil)
      @path = nil
      @command_name = command_name
      @version = version
      @version_detector = DefaultVersionDetector.new command_name
      @path_validation_level = :fatal
      @version_validation_level = :fatal
      @path_validator = PathValidator.new self
      @version_validator = nil
      @is_windows = !ENV['WINDIR'].nil?
    end

    def validate_path
      @path_validator.validate
    end

    def validate_version
      return unless @version
      v = @version_validator || VersionValidator.new(@command_name, @version_detector)
      p = Path.new @path
      v.validate @version, p.evaluated_path
    end

    def executable
      p = Path.new @path.to_s, @command_name
      p.normalised_path
    end

  end
end