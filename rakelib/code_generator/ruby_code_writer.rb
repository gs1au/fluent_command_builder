module CodeGenerator
  class RubyCodeWriter

    INDENT_SPACES = 2

    def initialize(stream)
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

    def write(code)
      @stream.print code
    end

    def write_line(line='')
      @stream.puts line.rjust(line.length + @indent * INDENT_SPACES, ' ')
    end

    def write_block(line)
      write_line line
      indent
      yield
      dedent
      write_line 'end'
      line
    end

    def write_module(module_name)
      write_block("module #{module_name}") { yield }
    end

    def write_class(class_name, base_class_name=nil)
      line = "class #{class_name}"
      line << " < #{base_class_name}" if base_class_name
      write_block(line) { yield }
    end

    def write_method(method_name, *args)
      line = "def #{method_name}"
      line << "(#{args.flatten.join ', '})" unless args.flatten.empty?
      write_block(line) { yield }
    end

  end
end