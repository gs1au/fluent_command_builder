require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Simian
    module V23
      class Simian
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'simian'
          self
        end
        
        def formatter formatter
          @builder.append "-formatter=#{formatter}"
          self
        end
        
        def threshold threshold
          @builder.append "-threshold=#{threshold}"
          self
        end
        
        def language language
          @builder.append "-language=#{language}"
          self
        end
        
        def default_language language
          @builder.append "-defaultLanguage=#{language}"
          self
        end
        
        def fail_on_duplication bool
          @builder.append "-failOnDuplication=#{bool}"
          self
        end
        
        def report_duplicate_text bool
          @builder.append "-reportDuplicateText=#{bool}"
          self
        end
        
        def ignore_blocks markers
          @builder.append "-ignoreBlocks=#{markers}"
          self
        end
        
        def ignore_curly_braces bool
          @builder.append "-ignoreCurlyBraces=#{bool}"
          self
        end
        
        def ignore_identifiers bool
          @builder.append "-ignoreIdentifiers=#{bool}"
          self
        end
        
        def ignore_identifier_case bool
          @builder.append "-ignoreIdentifierCase=#{bool}"
          self
        end
        
        def ignore_regions bool
          @builder.append "-ignoreRegions=#{bool}"
          self
        end
        
        def ignore_strings bool
          @builder.append "-ignoreStrings=#{bool}"
          self
        end
        
        def ignore_string_case bool
          @builder.append "-ignoreStringCase=#{bool}"
          self
        end
        
        def ignore_numbers bool
          @builder.append "-ignoreNumbers=#{bool}"
          self
        end
        
        def ignore_characters bool
          @builder.append "-ignoreCharacters=#{bool}"
          self
        end
        
        def ignore_character_case bool
          @builder.append "-ignoreCharacterCase=#{bool}"
          self
        end
        
        def ignore_literals bool
          @builder.append "-ignoreLiterals=#{bool}"
          self
        end
        
        def ignore_subtype_names bool
          @builder.append "-ignoreSubtypeNames=#{bool}"
          self
        end
        
        def ignore_modifiers bool
          @builder.append "-ignoreModifiers=#{bool}"
          self
        end
        
        def ignore_variable_names bool
          @builder.append "-ignoreVariableNames=#{bool}"
          self
        end
        
        def balance_parentheses bool
          @builder.append "-balanceParentheses=#{bool}"
          self
        end
        
        def balance_curly_braces bool
          @builder.append "-balanceCurlyBraces=#{bool}"
          self
        end
        
        def balance_square_brackets bool
          @builder.append "-balanceSquareBrackets=#{bool}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      def simian
        Simian.new
      end
      
    end
    
  end
  
  def simian23
    Simian::V23::Simian.new
  end
  
end

