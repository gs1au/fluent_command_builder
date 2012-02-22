module CodeGenerator
  class CommandDefinitionText

    def initialize text
      @text = text
    end

    def versions
      @versions ||= lines[versions_line_index].rstrip
    end

    def command
      @command ||= load_command
    end

    def option_references
      @option_references ||= load_option_references
    end

    private

    def lines
      @lines ||= @text.split("\n")
    end

    def versions_line_index
      0
    end

    def command_line_index
      1
    end

    def option_references_line_index
      @option_references_line_index ||= lines.index('options:')
    end

    def load_command
      start_index = command_line_index
      end_index = option_references_line_index ? option_references_line_index - 1 : lines.length - 1
      lines[start_index..end_index].join("\n")
    end

    def load_option_references
      return unless option_references_line_index
      start_index = option_references_line_index + 1
      end_index = lines.length - 1
      lines[start_index..end_index].join("\n")
    end

  end
end