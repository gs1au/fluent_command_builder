require_relative 'lib/command'

module CodeGenerator
  class CommandDefinition

    def initialize(stream)
      text = stream.read
      @lines = text.split String::NEW_LINE
    end

    def versions
      @versions ||= @lines[0].split(',').map { |v| v.strip }
    end

    def command
      @command ||= Command.new command_text
    end

    private

    def command_text
      lines = expand_options
      end_index = option_references_line_index ? option_references_line_index - 1 : lines.length - 1
      lines[1..end_index].join String::NEW_LINE
    end

    def expand_options
      @lines.map do |line|
        option_matches = option_references.select { |o| o if o.start_with? line.strip }
        option_matches.empty? ? line : (line[/^ +/].to_s + option_matches[0])
      end
    end

    def option_references
      return [] unless option_references_line_index
      start_index = option_references_line_index + 1
      end_index = @lines.length - 1
      @lines[start_index..end_index].map { |l| l.strip }
    end

    def option_references_line_index
      @option_references_line_index ||= @lines.index 'options:'
    end

  end
end