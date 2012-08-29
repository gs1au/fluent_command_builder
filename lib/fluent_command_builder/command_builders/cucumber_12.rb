# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../printer')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def cucumber_12(feature=nil)
    FluentCommandBuilder::Cucumber::V12.create(feature) { |b| yield b if block_given? }
  end
  module Cucumber
    module V12
      VERSION = '1.2'
      def self.default_path
        @default_path ||= nil
      end
      def self.default_path=(value)
        printer = FluentCommandBuilder::Printer.new
        begin
          printer.print_warning %Q[Default Path for command "#{FluentCommandBuilder::Cucumber::COMMAND_NAME}", version "#{VERSION}" does not exist. Path: #{value}] unless File.exist? value
        rescue
          printer.print_warning %Q[Failed to determine whether Default Path for command "#{FluentCommandBuilder::Cucumber::COMMAND_NAME}", version "#{VERSION}" exists. An internal error occurred.]
        end
        @default_path = value
      end
      def self.create(feature=nil)
        b = UnderlyingBuilder.new FluentCommandBuilder::Cucumber::COMMAND_NAME, VERSION
        b.path = self.default_path
        b.actual_version_lambda = lambda { |path| FluentCommandBuilder::Cucumber.version path }
        c = Cucumber.new(b, feature)
        yield b if block_given?
        c
      end
      def cucumber(feature=nil)
        FluentCommandBuilder::Cucumber::V12.create(feature) { |b| yield b if block_given? }
      end
      class Cucumber < CommandBase
        def initialize(underlying_builder, feature=nil)
          super underlying_builder
          @b.append " #{@b.format feature}" unless feature.nil?
        end
        def require(library)
          @b.append " --require #{@b.format library}"
          yield @b if block_given?
          self
        end
        def i18n(lang)
          @b.append " --i18n #{@b.format lang}"
          yield @b if block_given?
          self
        end
        def format(format)
          @b.append " --format #{@b.format format}"
          yield @b if block_given?
          self
        end
        def out(file)
          @b.append " --out #{@b.format file}"
          yield @b if block_given?
          self
        end
        def tags(tag_expression)
          @b.append " --tags #{@b.format tag_expression, ','}"
          yield @b if block_given?
          self
        end
        def name(name)
          @b.append " --name #{@b.format name}"
          yield @b if block_given?
          self
        end
        def exclude(pattern)
          @b.append " --exclude #{@b.format pattern}"
          yield @b if block_given?
          self
        end
        def profile(profile)
          @b.append " --profile #{@b.format profile}"
          yield @b if block_given?
          self
        end
        def no_profile
          @b.append ' --no-profile'
          yield @b if block_given?
          self
        end
        def color
          @b.append ' --color'
          yield @b if block_given?
          self
        end
        def no_color
          @b.append ' --no-color'
          yield @b if block_given?
          self
        end
        def dry_run
          @b.append ' --dry-run'
          yield @b if block_given?
          self
        end
        def autoformat(dir)
          @b.append " --autoformat #{@b.format dir}"
          yield @b if block_given?
          self
        end
        def no_multiline
          @b.append ' --no-multiline'
          yield @b if block_given?
          self
        end
        def no_source
          @b.append ' --no-source'
          yield @b if block_given?
          self
        end
        def no_snippets
          @b.append ' --no-snippets'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def backtrace
          @b.append ' --backtrace'
          yield @b if block_given?
          self
        end
        def strict
          @b.append ' --strict'
          yield @b if block_given?
          self
        end
        def wip
          @b.append ' --wip'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def guess
          @b.append ' --guess'
          yield @b if block_given?
          self
        end
        def lines(lines)
          @b.append " --lines #{@b.format lines}"
          yield @b if block_given?
          self
        end
        def expand
          @b.append ' --expand'
          yield @b if block_given?
          self
        end
        def drb
          @b.append ' --drb'
          yield @b if block_given?
          self
        end
        def no_drb
          @b.append ' --no-drb'
          yield @b if block_given?
          self
        end
        def port(port)
          @b.append " --port #{@b.format port}"
          yield @b if block_given?
          self
        end
        def dotcucumber(dir)
          @b.append " --dotcucumber #{@b.format dir}"
          yield @b if block_given?
          self
        end
        def version
          @b.append ' --version'
          yield @b if block_given?
          self
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
      end

    end
  end
end