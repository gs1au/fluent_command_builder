require 'term/ansicolor'

module FluentCommandBuilder
  class Printer
    include Term::ANSIColor

    def print_warning(message)
      print yellow, 'WARNING: ', message, reset, "\n"
    end

  end
end