require 'test/unit'
require_relative '../../../../lib/fluent_command_builder'
include FluentCommandBuilder

class PrinterTest < Test::Unit::TestCase

  def test_should_print_warning_in_yellow
    $stderr = StringIO.new
    printer = Printer.new
    printer.print_warning 'This is a warning message.'
    assert_equal "\e[33mWarning: This is a warning message.\e[0m\n", $stderr.string
  end

  def test_should_print_error_in_red
    $stderr = StringIO.new
    printer = Printer.new
    printer.print_error 'This is an error message.'
    assert_equal "\e[31mError: This is an error message.\e[0m\n", $stderr.string
  end

  def test_should_print_command_in_magenta
    $stdout = StringIO.new
    printer = Printer.new
    printer.print_command 'command'
    assert_equal "\e[35mcommand\e[0m\n", $stdout.string
  end

end