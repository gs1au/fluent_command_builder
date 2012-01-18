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

  def arg_name
    match /<(\w+)/
  end

  def key_value_separator
    match /(\W)\W>/
  end

  def delimiter
    match /(\W)>/
  end

  private

  def match pattern
    match = @line.match(pattern) || []
    match[1]
  end

end