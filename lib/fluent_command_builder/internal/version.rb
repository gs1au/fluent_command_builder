module FluentCommandBuilder
  class Version

    VERSION_REGEX = '(?:\d+\.)+(?:\d+)'
    DELIMITER = '.'

    attr_accessor :version

    def initialize(version)
      raise "#{version} is not a valid version." unless Version.is_valid? version
      @version = version
    end

    def compact
      first 2, ''
    end

    def first(count, delimiter=DELIMITER)
       to_a.first(count).join(delimiter)
     end

    def to_s
      @version
    end

    def to_a
      @version.split DELIMITER
    end

    def self.match(value)
      exp = Regexp.new VERSION_REGEX
      version = value.scan(exp)[0]
      return unless version
      Version.new(version)
    end

    private

    def self.is_valid?(version)
      exp = Regexp.new "^#{VERSION_REGEX}$"
      version.scan(exp)[0] != nil
    end

  end
end