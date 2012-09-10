module FluentCommandBuilder
  class Version

    VERSION_REGEX = '(?:\d+\.)+(?:\d+)'
    SEQUENCE_SEPARATOR = '.'

    attr_accessor :version

    def initialize(version)
      raise "#{version} is not a valid version." unless Version.is_valid? version
      @version = version
    end

    def compact
      to_a.first(2).join
    end

    def to_s(count=nil)
      count ? truncate(count) : @version
    end

    def to_a
      @version.split SEQUENCE_SEPARATOR
    end

    def self.is_valid?(version)
      exp = Regexp.new "^#{VERSION_REGEX}$"
      version.scan(exp)[0] != nil
    end

    def self.match(value)
      exp = Regexp.new VERSION_REGEX
      version = value.scan(exp)[0]
      return unless version
      Version.new(version)
    end

    def self.version_or_nil(version)
      return unless version
      is_valid?(version) ? Version.new(version) : nil
    end

    private

    def truncate(count)
      to_a.first(count).join(SEQUENCE_SEPARATOR)
    end

  end
end