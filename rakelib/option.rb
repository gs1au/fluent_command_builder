require_relative 'command_definition_line'

class Option

  ARG_PATTERN = /<(.+?)>/

  def initialize option_text
    @option_text = option_text.strip
    @command_definition_line = CommandDefinitionLine.new option_text
  end

  def write_option_method writer
    w = writer
    w.write_block "def #{method_name} #{arg_name}" do
      w.write_line case
                     when needs_formatting?
                       append_arg = @option_text.gsub ARG_PATTERN, '#{v}'
                       format_args = [arg_name, [delimiter, key_value_separator].compact.map { |v| "'#{v}'" }].flatten
                       append_format_statement format_args, append_arg
                     when has_arg?
                       append_arg = @option_text.gsub ARG_PATTERN, "\#{#{arg_name}}"
                       append_statement append_arg
                     else
                       append_statement @option_text
                   end
      w.write_line 'self'
    end
  end

  def to_s
    @option_text
  end

  private

  def method_name
    camel_case_to_underscore_separated (option_name || arg_name).gsub(/\W/, ' ')
  end

  def needs_formatting?
    !delimiter.nil? || !key_value_separator.nil?
  end

  def has_arg?
    !@command_definition_line.arg_name.nil?
  end

  def option_name
    @command_definition_line.option_name
  end

  def arg_name
    camel_case_to_underscore_separated @command_definition_line.arg_name if has_arg?
  end

  def append_statement append_arg
    %Q[@builder.append "#{append_arg}"]
  end

  def append_format_statement format_args, append_arg
    %Q[@builder.append_format(#{format_args.join ', '}) { |v| "#{append_arg}" }]
  end

  def camel_case_to_underscore_separated value
    value.gsub(/[A-Z]/, ' \0').strip.gsub(' ', '_').downcase
  end

  def key_value_separator
    @command_definition_line.key_value_separator
  end

  def delimiter
    @command_definition_line.delimiter
  end

end