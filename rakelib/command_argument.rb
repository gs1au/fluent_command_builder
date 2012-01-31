class CommandArgument

  def initialize raw_text
    @raw_text = raw_text
  end

  def arg_name
    @arg_name ||= match /<(\w+)/
  end

  def key_value_separator
    @key_value_separator ||= match /(\W)\W>/
  end

  def delimiter
    @delimiter ||= match /(\W)>/
  end

  private

  def match pattern
    match = @raw_text.match(pattern) || []
    match[1]
  end

end