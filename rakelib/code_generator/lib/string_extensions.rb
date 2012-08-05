class String

  NEW_LINE = "\n"

  def camelcase
    words.join
  end

  def snakecase
    words.join('_').downcase
  end

  def first_line
    match(/^.*$/)[0]
  end

  def strip_first_line
    first_line_index = self.index NEW_LINE
    return '' unless first_line_index
    self[first_line_index+1..self.length-1]
  end

  def split_and_strip(pattern)
    split(pattern).map { |s| s.strip }
  end

  private

  def words
    result = self =~ /^[A-Z]+$/ ? downcase : self
    result.gsub(/[\W_]/, ' ').gsub(/[A-Z*]/, ' \0').split(' ').map { |s| s.capitalize }
  end

end