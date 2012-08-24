module FluentCommandBuilder
  class HiddenPasswordFormatter

    attr_accessor :password_replacement

    def initialize
      @password_replacement = '***'
    end

    def format(underlying_builder)
      command = underlying_builder.to_s
      underlying_builder.passwords.each { |p| command.gsub! p, @password_replacement }
      command
    end

  end
end