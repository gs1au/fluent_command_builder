module FluentCommandBuilder

  class PasswordFormatter
    attr_accessor :enabled, :replacement

    def initialize
      @enabled = true
      @replacement = '***'
    end

    def format(command, passwords)
      return command unless @enabled
      passwords.each { |p| command.gsub! p, @replacement }
      command
    end
  end

  def self.password_formatter
    @@password_formatter ||= PasswordFormatter.new
  end

end