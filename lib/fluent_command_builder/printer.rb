require 'term/ansicolor'

module FluentCommandBuilder
  class Printer
    include Term::ANSIColor

    def print_warning(message)
      print yellow, 'WARNING: ', message, reset, "\n"
      STDOUT.flush
    end

    def print_error(message)
      print red, 'ERROR: ', message, reset, "\n"
      STDOUT.flush
    end

    def print_command(command)
      print magenta, command, reset, "\n"
      STDOUT.flush
    end

  end
end