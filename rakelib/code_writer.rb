class CodeWriter

  INDENT_SPACES = 2

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

  def line line=''
    @stream.puts line.rjust(line.length + @indent * INDENT_SPACES, ' ')
  end

  def block line
    line line
    indent
    yield
    dedent
    line 'end'
    line
  end

  def method name, *args
    block "def #{name} #{args.flatten.join ', '}" do
      yield
    end
  end

  def initializer class_name, *args
    line "#{class_name}.new #{args.flatten.join ', '}"
  end

  def module module_name
    block "module #{module_name}" do
      yield
    end
  end

end