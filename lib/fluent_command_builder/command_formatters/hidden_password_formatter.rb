module FluentCommandBuilder
  class HiddenPasswordFormatter

    attr_accessor :password_replacement

    def initialize
      @password_replacement = '***'
    end

    def format(underlying_builder)
      c = underlying_builder.to_s
      underlying_builder.passwords.each { |p| c.gsub! p, @password_replacement }
      c
    end

  end
end