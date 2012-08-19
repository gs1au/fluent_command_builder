require 'term/ansicolor'; include Term::ANSIColor
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

      unless validator.can_validate?
        print yellow, %Q[WARNING: Version validation for command "#{@b.command_name}" aborted. An internal error occurred.], reset, "\n"
        return
      end

      unless validator.is_valid?
        print yellow, %Q[WARNING: Version validation for command "#{@b.command_name}" failed. Expected version #{validator.version_in_use.to_s(2)} but was #{validator.version_on_path.to_s(2)}.], reset, "\n"
      end
    end

  end
end