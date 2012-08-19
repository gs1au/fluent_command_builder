module FluentCommandBuilder
  class Version

    attr_accessor :version

    def initialize(version)
      raise "#{version} is not a valid version." unless Version.is_valid? version
      @version = version
    end

    def compact
      @version.match(/^\d+\.\d+/)[0].sub('.', '')
    end

    def to_s(precision=nil)
      return @version unless precision
      @version.split('.').first(precision).join('.')
    end

    def self.is_valid?(version)
      version =~ /^(?:\d+\.)+(?:\d+)$/
    end

    def self.match(value)
      version = value.match(/(?:\d+\.)+(?:\d+)/) { |m| m[0] }
      version ? Version.new(version) : nil
    end
  end

  def version_module(command_module)
    version = command_module.respond_to?(:version) ? Version.new(command_module.version) : nil
    raise "Unable to determine version for #{command_module::COMMAND_NAME}." unless version
    module_name = "#{command_module.name}::V#{version.compact}"
    begin
      eval module_name
    rescue
      raise "Unable to load #{module_name}. Please consider contributing."
    end
  end
end