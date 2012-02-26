module CodeGenerator

  NEW_LINE = "\n"

end

class String
  def camelcase
    words.join
  end

  def snakecase
    words.join('_').downcase
  end

  private

  def words
    result = self =~ /^[A-Z]+$/ ? downcase : self
    result.gsub(/[\W_]/, ' ').gsub(/[A-Z*]/, ' \0').split(' ').map { |s| s.capitalize }
  end
end