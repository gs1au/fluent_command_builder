require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../printer')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def simian_23
    FluentCommandBuilder::Simian::V23.create { |b| yield b if block_given? }
  end
  module Simian
    module V23
      VERSION = '2.3'
      def self.default_path
        @default_path ||= nil
      end
      def self.default_path=(value)
        printer = FluentCommandBuilder::Printer.new
        begin
          printer.print_warning %Q[Default Path for command "#{FluentCommandBuilder::Simian::COMMAND_NAME}" does not exist. Path: #{value}] unless File.exist? value
        rescue
          printer.print_warning %Q[Failed to determine whether Default Path for command "#{FluentCommandBuilder::Simian::COMMAND_NAME}" exists. An internal error occurred.]
        end
        @default_path = value
      end
      def self.create
        b = UnderlyingBuilder.new FluentCommandBuilder::Simian::COMMAND_NAME
        b.path = self.default_path
        c = Simian.new(b)
        yield b if block_given?
        c
      end
      def simian
        FluentCommandBuilder::Simian::V23.create { |b| yield b if block_given? }
      end
      class Simian < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
        end
        def formatter(formatter)
          @b.append " -formatter=#{@b.format formatter}"
          yield @b if block_given?
          self
        end
        def threshold(threshold)
          @b.append " -threshold=#{@b.format threshold}"
          yield @b if block_given?
          self
        end
        def language(language)
          @b.append " -language=#{@b.format language}"
          yield @b if block_given?
          self
        end
        def default_language(language)
          @b.append " -defaultLanguage=#{@b.format language}"
          yield @b if block_given?
          self
        end
        def fail_on_duplication(bool)
          @b.append " -failOnDuplication=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def report_duplicate_text(bool)
          @b.append " -reportDuplicateText=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def ignore_blocks(markers)
          @b.append " -ignoreBlocks=#{@b.format markers}"
          yield @b if block_given?
          self
        end
        def ignore_curly_braces(bool)
          @b.append " -ignoreCurlyBraces=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def ignore_identifiers(bool)
          @b.append " -ignoreIdentifiers=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def ignore_identifier_case(bool)
          @b.append " -ignoreIdentifierCase=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def ignore_regions(bool)
          @b.append " -ignoreRegions=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def ignore_strings(bool)
          @b.append " -ignoreStrings=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def ignore_string_case(bool)
          @b.append " -ignoreStringCase=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def ignore_numbers(bool)
          @b.append " -ignoreNumbers=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def ignore_characters(bool)
          @b.append " -ignoreCharacters=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def ignore_character_case(bool)
          @b.append " -ignoreCharacterCase=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def ignore_literals(bool)
          @b.append " -ignoreLiterals=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def ignore_subtype_names(bool)
          @b.append " -ignoreSubtypeNames=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def ignore_modifiers(bool)
          @b.append " -ignoreModifiers=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def ignore_variable_names(bool)
          @b.append " -ignoreVariableNames=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def balance_parentheses(bool)
          @b.append " -balanceParentheses=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def balance_curly_braces(bool)
          @b.append " -balanceCurlyBraces=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def balance_square_brackets(bool)
          @b.append " -balanceSquareBrackets=#{@b.format bool}"
          yield @b if block_given?
          self
        end
      end

    end
  end
end