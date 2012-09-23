require File.expand_path(File.dirname(__FILE__) + '/path_validator')
require File.expand_path(File.dirname(__FILE__) + '/version_validator')
require File.expand_path(File.dirname(__FILE__) + '/version_detectors/default_version_detector')

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
      @version_validator = VersionValidator.new self
      @is_windows = !ENV['WINDIR'].nil?
    end

    def validate_path
      @path_validator.validate
    end

    def validate_version
      @version_validator.validate if @version
    end

    def executable
      e = @path ? File.join(@path, @command_name) : @command_name
      normalise_path e
    end

    def evaluated_executable
      evaluate_path executable
    end

    def evaluated_path
      evaluate_path @path if @path
    end

    private

    def evaluate_path(path)
      `echo #{normalise_path path}`.strip
    end

    def normalise_path(path)
      @is_windows ? path.gsub('/', '\\') : path.gsub('\\', '/')
    end

  end
end