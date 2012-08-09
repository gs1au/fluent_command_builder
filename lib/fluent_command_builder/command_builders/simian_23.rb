require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Simian
    COMMAND_NAME = 'simian' unless const_defined? :COMMAND_NAME
    module V23
      class Simian < CommandBase
        def initialize(builder)
          super builder
        end
        def formatter(formatter)
          @builder.append " -formatter=#{@builder.format formatter}"
          yield @builder if block_given?
          self
        end
        def threshold(threshold)
          @builder.append " -threshold=#{@builder.format threshold}"
          yield @builder if block_given?
          self
        end
        def language(language)
          @builder.append " -language=#{@builder.format language}"
          yield @builder if block_given?
          self
        end
        def default_language(language)
          @builder.append " -defaultLanguage=#{@builder.format language}"
          yield @builder if block_given?
          self
        end
        def fail_on_duplication(bool)
          @builder.append " -failOnDuplication=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def report_duplicate_text(bool)
          @builder.append " -reportDuplicateText=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def ignore_blocks(markers)
          @builder.append " -ignoreBlocks=#{@builder.format markers}"
          yield @builder if block_given?
          self
        end
        def ignore_curly_braces(bool)
          @builder.append " -ignoreCurlyBraces=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def ignore_identifiers(bool)
          @builder.append " -ignoreIdentifiers=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def ignore_identifier_case(bool)
          @builder.append " -ignoreIdentifierCase=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def ignore_regions(bool)
          @builder.append " -ignoreRegions=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def ignore_strings(bool)
          @builder.append " -ignoreStrings=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def ignore_string_case(bool)
          @builder.append " -ignoreStringCase=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def ignore_numbers(bool)
          @builder.append " -ignoreNumbers=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def ignore_characters(bool)
          @builder.append " -ignoreCharacters=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def ignore_character_case(bool)
          @builder.append " -ignoreCharacterCase=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def ignore_literals(bool)
          @builder.append " -ignoreLiterals=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def ignore_subtype_names(bool)
          @builder.append " -ignoreSubtypeNames=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def ignore_modifiers(bool)
          @builder.append " -ignoreModifiers=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def ignore_variable_names(bool)
          @builder.append " -ignoreVariableNames=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def balance_parentheses(bool)
          @builder.append " -balanceParentheses=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def balance_curly_braces(bool)
          @builder.append " -balanceCurlyBraces=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def balance_square_brackets(bool)
          @builder.append " -balanceSquareBrackets=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
      end
      def simian
        builder = CommandBuilder.new FluentCommandBuilder::Simian::COMMAND_NAME
        command = Simian.new builder
        yield builder if block_given?
        command
      end
    end
  end
  def simian_23
    builder = CommandBuilder.new FluentCommandBuilder::Simian::COMMAND_NAME
    command = Simian::V23::Simian.new builder
    yield builder if block_given?
    command
  end
end
