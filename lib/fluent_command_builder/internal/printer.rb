require 'term/ansicolor'

module FluentCommandBuilder
  class Printer
    include Term::ANSIColor

    def print_warning(message)
      $stderr.print yellow, 'Warning: ', message, reset, "\n"
      $stderr.flush
    end

    def print_error(message)
      $stderr.print red, 'Error: ', message, reset, "\n"
      $stderr.flush
    end

    def print_command(command)
      print magenta, command, reset, "\n"
      $stdout.flush
    end

  end
end