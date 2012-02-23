require_relative 'command_definition_text'
require_relative 'command_definition'

module CodeGenerator
  class CommandDefinitionParser

    def parse stream
      command_definition_text = CommandDefinitionText.new stream.read
      versions = command_definition_text.versions
      command_text = command_definition_text.command_text
      option_references = command_definition_text.option_references
      command_text.expand_options option_references
      CommandDefinition.new versions, command_text.yaml
    end

  end
end