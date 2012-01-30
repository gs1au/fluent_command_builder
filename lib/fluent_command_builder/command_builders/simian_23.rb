require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Simian
    module V23
      class Simian
        def initialize builder
          @builder = builder
          @builder.append 'simian'
        end
        def formatter formatter=nil
          @builder.append "-formatter=#{@builder.format formatter}"
          self
        end
        def threshold threshold=nil
          @builder.append "-threshold=#{@builder.format threshold}"
          self
        end
        def language language=nil
          @builder.append "-language=#{@builder.format language}"
          self
        end
        def default_language language=nil
          @builder.append "-defaultLanguage=#{@builder.format language}"
          self
        end
        def fail_on_duplication bool=nil
          @builder.append "-failOnDuplication=#{@builder.format bool}"
          self
        end
        def report_duplicate_text bool=nil
          @builder.append "-reportDuplicateText=#{@builder.format bool}"
          self
        end
        def ignore_blocks markers=nil
          @builder.append "-ignoreBlocks=#{@builder.format markers}"
          self
        end
        def ignore_curly_braces bool=nil
          @builder.append "-ignoreCurlyBraces=#{@builder.format bool}"
          self
        end
        def ignore_identifiers bool=nil
          @builder.append "-ignoreIdentifiers=#{@builder.format bool}"
          self
        end
        def ignore_identifier_case bool=nil
          @builder.append "-ignoreIdentifierCase=#{@builder.format bool}"
          self
        end
        def ignore_regions bool=nil
          @builder.append "-ignoreRegions=#{@builder.format bool}"
          self
        end
        def ignore_strings bool=nil
          @builder.append "-ignoreStrings=#{@builder.format bool}"
          self
        end
        def ignore_string_case bool=nil
          @builder.append "-ignoreStringCase=#{@builder.format bool}"
          self
        end
        def ignore_numbers bool=nil
          @builder.append "-ignoreNumbers=#{@builder.format bool}"
          self
        end
        def ignore_characters bool=nil
          @builder.append "-ignoreCharacters=#{@builder.format bool}"
          self
        end
        def ignore_character_case bool=nil
          @builder.append "-ignoreCharacterCase=#{@builder.format bool}"
          self
        end
        def ignore_literals bool=nil
          @builder.append "-ignoreLiterals=#{@builder.format bool}"
          self
        end
        def ignore_subtype_names bool=nil
          @builder.append "-ignoreSubtypeNames=#{@builder.format bool}"
          self
        end
        def ignore_modifiers bool=nil
          @builder.append "-ignoreModifiers=#{@builder.format bool}"
          self
        end
        def ignore_variable_names bool=nil
          @builder.append "-ignoreVariableNames=#{@builder.format bool}"
          self
        end
        def balance_parentheses bool=nil
          @builder.append "-balanceParentheses=#{@builder.format bool}"
          self
        end
        def balance_curly_braces bool=nil
          @builder.append "-balanceCurlyBraces=#{@builder.format bool}"
          self
        end
        def balance_square_brackets bool=nil
          @builder.append "-balanceSquareBrackets=#{@builder.format bool}"
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
