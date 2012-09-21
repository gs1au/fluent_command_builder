require 'term/ansicolor'

module FluentCommandBuilder
  class Printer
    include Term::ANSIColor

    def print_warning(message)
      STDERR.print yellow, 'Warning: ', message, reset, "\n"
      STDERR.flush
    end

    def print_error(message)
      STDERR.print red, 'Error: ', message, reset, "\n"
      STDERR.flush
    end

    def print_command(command)
      print magenta, command, reset, "\n"
      STDOUT.flush
    end

  end
end