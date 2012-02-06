require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Simian
    module V23
      class Simian < CommandBase
        def initialize builder
          @builder = builder
          @builder.append 'simian'
        end
        def formatter formatter
          @builder.append " -formatter=#{@builder.format formatter}"
          self
        end
        def threshold threshold
          @builder.append " -threshold=#{@builder.format threshold}"
          self
        end
        def language language
          @builder.append " -language=#{@builder.format language}"
          self
        end
        def default_language language
          @builder.append " -defaultLanguage=#{@builder.format language}"
          self
        end
        def fail_on_duplication bool
          @builder.append " -failOnDuplication=#{@builder.format bool}"
          self
        end
        def report_duplicate_text bool
          @builder.append " -reportDuplicateText=#{@builder.format bool}"
          self
        end
        def ignore_blocks markers
          @builder.append " -ignoreBlocks=#{@builder.format markers}"
          self
        end
        def ignore_curly_braces bool
          @builder.append " -ignoreCurlyBraces=#{@builder.format bool}"
          self
        end
        def ignore_identifiers bool
          @builder.append " -ignoreIdentifiers=#{@builder.format bool}"
          self
        end
        def ignore_identifier_case bool
          @builder.append " -ignoreIdentifierCase=#{@builder.format bool}"
          self
        end
        def ignore_regions bool
          @builder.append " -ignoreRegions=#{@builder.format bool}"
          self
        end
        def ignore_strings bool
          @builder.append " -ignoreStrings=#{@builder.format bool}"
          self
        end
        def ignore_string_case bool
          @builder.append " -ignoreStringCase=#{@builder.format bool}"
          self
        end
        def ignore_numbers bool
          @builder.append " -ignoreNumbers=#{@builder.format bool}"
          self
        end
        def ignore_characters bool
          @builder.append " -ignoreCharacters=#{@builder.format bool}"
          self
        end
        def ignore_character_case bool
          @builder.append " -ignoreCharacterCase=#{@builder.format bool}"
          self
        end
        def ignore_literals bool
          @builder.append " -ignoreLiterals=#{@builder.format bool}"
          self
        end
        def ignore_subtype_names bool
          @builder.append " -ignoreSubtypeNames=#{@builder.format bool}"
          self
        end
        def ignore_modifiers bool
          @builder.append " -ignoreModifiers=#{@builder.format bool}"
          self
        end
        def ignore_variable_names bool
          @builder.append " -ignoreVariableNames=#{@builder.format bool}"
          self
        end
        def balance_parentheses bool
          @builder.append " -balanceParentheses=#{@builder.format bool}"
          self
        end
        def balance_curly_braces bool
          @builder.append " -balanceCurlyBraces=#{@builder.format bool}"
          self
        end
        def balance_square_brackets bool
          @builder.append " -balanceSquareBrackets=#{@builder.format bool}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      def simian 
        Simian.new CommandBuilder.new
      end
    end
  end
  def simian_23 
    Simian::V23::Simian.new CommandBuilder.new
  end
end
