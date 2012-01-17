class CodeWriter

  def initialize stream
    @stream = stream
    @indent = 0
  end

  def indent
    @indent += 1

    if block_given?
      yield
      dedent
    end
  end

  def dedent
    @indent -= 1
  end

  def write_line line=''
    @stream.puts line.rjust(line.length + @indent * 2, ' ')
  end

  def write_block line
    write_line line
    indent
    yield
    dedent
    write_line 'end'
    write_line
  end

end