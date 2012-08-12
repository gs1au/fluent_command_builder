require_relative 'command_argument'

class Fragment

  def initialize(fragment_def)
    @fragment_def = fragment_def
  end

  def fragment_text
    @fragment_text ||= optional? ? @fragment_def[1, @fragment_def.length - 2] : @fragment_def
  end

  def required?
    !optional?
  end

  def optional?
    @optional ||= @fragment_def.start_with?('[') && @fragment_def.end_with?(']')
  end

  def args
    @args ||= fragment_text.scan(/<.+?>/).flatten.map { |m| CommandArgument.new m, required? }
  end

  def arg_names
    @arg_names ||= args.map { |a| a.arg_name }
  end

  def has_args?
    @has_args ||= !args.empty?
  end

end