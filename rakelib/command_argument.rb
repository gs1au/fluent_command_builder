class CommandArgument

  def initialize argument_text
    @argument_text = argument_text
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
    match = @argument_text.match(pattern) || []
    match[1]
  end

end