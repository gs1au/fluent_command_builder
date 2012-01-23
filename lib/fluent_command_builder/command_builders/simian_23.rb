require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Simian
    module V23
      class Simian
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'simian'
          self
        end
        
        def formatter formatter
          @b.append "-formatter=#{@b.format formatter}"
          self
        end
        
        def threshold threshold
          @b.append "-threshold=#{@b.format threshold}"
          self
        end
        
        def language language
          @b.append "-language=#{@b.format language}"
          self
        end
        
        def default_language language
          @b.append "-defaultLanguage=#{@b.format language}"
          self
        end
        
        def fail_on_duplication bool
          @b.append "-failOnDuplication=#{@b.format bool}"
          self
        end
        
        def report_duplicate_text bool
          @b.append "-reportDuplicateText=#{@b.format bool}"
          self
        end
        
        def ignore_blocks markers
          @b.append "-ignoreBlocks=#{@b.format markers}"
          self
        end
        
        def ignore_curly_braces bool
          @b.append "-ignoreCurlyBraces=#{@b.format bool}"
          self
        end
        
        def ignore_identifiers bool
          @b.append "-ignoreIdentifiers=#{@b.format bool}"
          self
        end
        
        def ignore_identifier_case bool
          @b.append "-ignoreIdentifierCase=#{@b.format bool}"
          self
        end
        
        def ignore_regions bool
          @b.append "-ignoreRegions=#{@b.format bool}"
          self
        end
        
        def ignore_strings bool
          @b.append "-ignoreStrings=#{@b.format bool}"
          self
        end
        
        def ignore_string_case bool
          @b.append "-ignoreStringCase=#{@b.format bool}"
          self
        end
        
        def ignore_numbers bool
          @b.append "-ignoreNumbers=#{@b.format bool}"
          self
        end
        
        def ignore_characters bool
          @b.append "-ignoreCharacters=#{@b.format bool}"
          self
        end
        
        def ignore_character_case bool
          @b.append "-ignoreCharacterCase=#{@b.format bool}"
          self
        end
        
        def ignore_literals bool
          @b.append "-ignoreLiterals=#{@b.format bool}"
          self
        end
        
        def ignore_subtype_names bool
          @b.append "-ignoreSubtypeNames=#{@b.format bool}"
          self
        end
        
        def ignore_modifiers bool
          @b.append "-ignoreModifiers=#{@b.format bool}"
          self
        end
        
        def ignore_variable_names bool
          @b.append "-ignoreVariableNames=#{@b.format bool}"
          self
        end
        
        def balance_parentheses bool
          @b.append "-balanceParentheses=#{@b.format bool}"
          self
        end
        
        def balance_curly_braces bool
          @b.append "-balanceCurlyBraces=#{@b.format bool}"
          self
        end
        
        def balance_square_brackets bool
          @b.append "-balanceSquareBrackets=#{@b.format bool}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      def simian
        Simian.new
      end
      
    end
    
  end
  
  def simian_23
    Simian::V23::Simian.new
  end
  
end

