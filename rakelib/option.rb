require_relative 'command_argument'
require_relative 'command_definition_line'

class Option

  def initialize option_text
    @option_text = option_text.strip
    @command_definition_line = CommandDefinitionLine.new option_text
  end

  def write_option_method writer
    w = writer
    w.write_block "def #{method_signature}" do
      w.write_line append_statement
      w.write_line 'self'
    end
  end

  def append_statement
    append_arg = @option_text.gsub /<.+?>/ do |m|
      arg = CommandArgument.new m
      format_args = [arg_name(arg), [arg.delimiter, arg.key_value_separator].compact.map { |v| "'#{v}'" }].flatten
      "\#{@b.format #{format_args.join ', '}}"
    end
    append_arg = append_arg.include?('#{') ? %Q["#{append_arg}"] : "'#{append_arg}'"
    "@b.append #{append_arg}"
  end

  def to_s
    @option_text
  end

  private

  def method_signature
    args = @command_definition_line.args.map { |a| lowercase a.arg_name }
    "#{method_name} #{args.join ', '}"
  end

  def method_name
    lowercase(@command_definition_line.option_name.gsub(/\W/, ' '))
  end

  def arg_name arg
    lowercase arg.arg_name
  end

  def lowercase value
    value.gsub(/[A-Z]/, ' \0').strip.gsub(' ', '_').downcase
  end

end