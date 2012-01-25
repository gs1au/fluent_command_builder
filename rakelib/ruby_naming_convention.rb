class RubyNamingConvention

  def module_name text
    class_name text
  end

  def class_name text
    text.gsub(/[\W_]/, ' ').gsub(/[A-Z]/, ' \0').strip.split(' ').map { |s| s.capitalize }.join
  end

  def method_name text
    text.gsub(/[\W_]/, ' ').gsub(/[A-Z]{2,}/) { |m| m.downcase }.gsub(/[A-Z]/, ' \0').strip.split(' ').join('_').downcase
  end

  def arg_name text
    ruby_case(text)
  end

  private

  def ruby_case value
    value.gsub(/[A-Z]/, ' \0').strip.gsub(' ', '_').downcase
  end

end