require_relative 'command_argument'

class CommandDefinitionLine

  def initialize line
    @line = line.strip
  end

  def command_name
    match /^(\w[\w -]*)$/
  end

  def option_name
    match /(\w[\w-]*)/
  end

  def args
    @line.scan(/<.+?>/).flatten.map { |m| CommandArgument.new m }
  end

  private

  def match pattern
    match = @line.match(pattern) || []
    match[1]
  end

end