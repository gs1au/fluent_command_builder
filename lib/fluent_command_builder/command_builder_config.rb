require File.expand_path(File.dirname(__FILE__) + '/path_validator')
require File.expand_path(File.dirname(__FILE__) + '/version_validator')
require File.expand_path(File.dirname(__FILE__) + '/version_detectors/default_version_detector')

module FluentCommandBuilder
  class CommandBuilderConfig

    attr_accessor :path, :command_name, :version, :version_detector, :version_validation_level

    def initialize(command_name, version=nil)
      @path = nil
      @command_name = command_name
      @version = version
      @version_detector = DefaultVersionDetector.new command_name
      @version_validation_level = :fatal
    end

    def validate_path(validation_level)
      return unless @path
      v = PathValidator.new self
      v.validate validation_level
    end

    def validate_version(validation_level=@version_validation_level)
      return unless @version
      v = VersionValidator.new self
      v.validate validation_level
    end

    def executable
      e = @path ? File.join(@path, @command_name) : @command_name
      tidy_path e
    end

    def evaluated_executable
      evaluate_path executable
    end

    def evaluated_path
      evaluate_path @path if @path
    end

    private

    def evaluate_path(path)
      `echo #{tidy_path path}`.strip
    end

    def tidy_path(path)
      is_windows? ? path.gsub('/', '\\') : path.gsub('\\', '/')
    end

    def is_windows?
      !ENV['WINDIR'].nil?
    end

  end
end