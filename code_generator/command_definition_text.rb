require_relative 'code_generator'
require_relative 'command_text'

module CodeGenerator
  class CommandDefinitionText

    VERSION_LINE_INDEX = 0
    COMMAND_LINE_INDEX = 1

    def initialize text
      @lines = text.split NEW_LINE
      @option_references_line_index = @lines.index 'options:'
    end

    def versions
      @lines[VERSION_LINE_INDEX].split(',').map { |v| v.strip }
    end

    def command_text
      end_index = @option_references_line_index ? @option_references_line_index - 1 : @lines.length - 1
      command_text = @lines[COMMAND_LINE_INDEX..end_index].join NEW_LINE
      CommandText.new command_text
    end

    def option_references
      return [] unless @option_references_line_index
      start_index = @option_references_line_index + 1
      end_index = @lines.length - 1
      @lines[start_index..end_index].map { |l| l.strip }
    end

  end
end