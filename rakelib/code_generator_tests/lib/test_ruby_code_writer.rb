require 'stringio'
require 'test/unit'
require_relative '../../code_generator/lib/ruby_code_writer'
include CodeGenerator

class TestRubyCodeWriter < Test::Unit::TestCase

  def test_should_indent_without_block
    stream = StringIO.new
    code_writer = RubyCodeWriter.new stream
    code_writer.indent
    code_writer.write_line 'puts 123'
    code_writer.indent
    code_writer.write_line 'puts 456'
    lines = stream.string.lines.to_a
    assert_equal "  puts 123\n", lines[0]
    assert_equal "    puts 456\n", lines[1]
  end

  def test_should_indent_block_then_dedent
    stream = StringIO.new
    code_writer = RubyCodeWriter.new stream
    code_writer.indent { code_writer.write_line 'puts 123' }
    code_writer.write_line 'puts 456'
    lines = stream.string.lines.to_a
    assert_equal "  puts 123\n", lines[0]
    assert_equal "puts 456\n", lines[1]
  end

  def test_should_dedent
    stream = StringIO.new
    code_writer = RubyCodeWriter.new stream
    code_writer.indent
    code_writer.write_line 'puts 123'
    code_writer.dedent
    code_writer.write_line 'puts 456'
    lines = stream.string.lines.to_a
    assert_equal "  puts 123\n", lines[0]
    assert_equal "puts 456\n", lines[1]
  end

  def test_should_write_blank_line
    stream = StringIO.new
    code_writer = RubyCodeWriter.new stream
    code_writer.write_line
    lines = stream.string.lines.to_a
    assert_equal "\n", lines[0]
  end

  def test_should_write_line_with_correct_indent
    stream = StringIO.new
    code_writer = RubyCodeWriter.new stream
    code_writer.indent
    code_writer.write_line 'puts 123'
    lines = stream.string.lines.to_a
    assert_equal "  puts 123\n", lines[0]
  end

  def test_should_write_block
    stream = StringIO.new
    code_writer = RubyCodeWriter.new stream
    code_writer.write_block('def favourite_number') { code_writer.write_line '123' }
    lines = stream.string.lines.to_a
    assert_equal "def favourite_number\n", lines[0]
    assert_equal "  123\n", lines[1]
    assert_equal "end\n", lines[2]
  end

  def test_should_write_module
    stream = StringIO.new
    code_writer = RubyCodeWriter.new stream
    code_writer.write_module('ModuleName') { code_writer.write_line '# todo: write code' }
    lines = stream.string.lines.to_a
    assert_equal "module ModuleName\n", lines[0]
    assert_equal "  # todo: write code\n", lines[1]
    assert_equal "end\n", lines[2]
  end

  def test_should_write_class
    stream = StringIO.new
    code_writer = RubyCodeWriter.new stream
    code_writer.write_class('ClassName') { code_writer.write_line '# todo: write code' }
    lines = stream.string.lines.to_a
    assert_equal "class ClassName\n", lines[0]
    assert_equal "  # todo: write code\n", lines[1]
    assert_equal "end\n", lines[2]
  end

  def test_should_write_method_without_args
    stream = StringIO.new
    code_writer = RubyCodeWriter.new stream
    code_writer.write_method('method_name') { code_writer.write_line '# todo: write code' }
    lines = stream.string.lines.to_a
    assert_equal "def method_name\n", lines[0]
    assert_equal "  # todo: write code\n", lines[1]
    assert_equal "end\n", lines[2]
  end

  def test_should_write_method_with_args
    stream = StringIO.new
    code_writer = RubyCodeWriter.new stream
    code_writer.write_method('method_name', 'arg1', 'arg2') { code_writer.write_line '# todo: write code' }
    lines = stream.string.lines.to_a
    assert_equal "def method_name(arg1, arg2)\n", lines[0]
    assert_equal "  # todo: write code\n", lines[1]
    assert_equal "end\n", lines[2]
  end

end