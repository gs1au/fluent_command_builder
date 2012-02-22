require 'yaml'
require_relative 'command_definition_text'

module CodeGenerator
  class CommandDefinitionPreprocessor

    attr_reader :result_text

    def initialize stream
      @command_definition_text = CommandDefinitionText.new stream.read
      @result_text = @command_definition_text.versions + "\n"
    end

    def expand_options
      @result_text += @command_definition_text.command.lines.map { |line|
        option_matches = option_references.select { |o| o if o.start_with? line.strip }
        result = option_matches.empty? ? line : (line[/^ +/].to_s + option_matches[0])
        result.rstrip
      }.join "\n"
    end

    def yaml
      @result_text.lines.map { |l| l.rstrip.gsub(/^( *)(\S.+)$/, '\1- "\2":') }.join "\n"
    end

    private

    def option_references
      return [] unless @command_definition_text.option_references
      @option_references ||= @command_definition_text.option_references.lines.to_a.map { |o| o.strip }
    end

  end
end