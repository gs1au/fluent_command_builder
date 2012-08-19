require File.expand_path(File.dirname(__FILE__) + '/version')
require File.expand_path(File.dirname(__FILE__) + '/version_validator')

module FluentCommandBuilder

  def self.version_validation_enabled
    @version_validation_enabled ||= false
  end

  def self.version_validation_enabled=(value)
    @version_validation_enabled = value
  end

  class CommandBase

    def initialize(underlying_builder)
      @b = underlying_builder
    end

    def execute!
      yield @b if block_given?
      validate_version if FluentCommandBuilder.version_validation_enabled
      @b.execute
    end

    def to_s
      return yield @b if block_given?
      @b.to_s
    end

    private

    def validate_version
      validator = VersionValidator.new self.class, @b.path
      puts "WARNING: Command Builder version #{validator.version_in_use.to_s(2)} does not match tool version #{validator.version_on_path.to_s(2)}." unless validator.is_valid?
    end

  end
end