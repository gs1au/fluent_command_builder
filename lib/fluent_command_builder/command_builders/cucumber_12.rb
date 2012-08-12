require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def cucumber_12(feature=nil)
    Cucumber::V12.create(feature) { |b| yield b if block_given? }
  end
  module Cucumber
    module V12
      def self.create(feature=nil)
        b = UnderlyingBuilder.new FluentCommandBuilder::Cucumber::COMMAND_NAME
        c = Cucumber.new b, feature
        yield b if block_given?
        c
      end
      def cucumber(feature=nil)
        V12.create(feature) { |b| yield b if block_given? }
      end
      class Cucumber < CommandBase
        def initialize(underlying_builder, feature=nil)
          super underlying_builder
          @builder.append " #{@builder.format feature}" unless feature.nil?
        end
        def require(library)
          @builder.append " --require #{@builder.format library}"
          yield @builder if block_given?
          self
        end
        def i18n(lang)
          @builder.append " --i18n #{@builder.format lang}"
          yield @builder if block_given?
          self
        end
        def format(format)
          @builder.append " --format #{@builder.format format}"
          yield @builder if block_given?
          self
        end
        def out(file)
          @builder.append " --out #{@builder.format file}"
          yield @builder if block_given?
          self
        end
        def tags(tag_expression)
          @builder.append " --tags #{@builder.format tag_expression, ','}"
          yield @builder if block_given?
          self
        end
        def name(name)
          @builder.append " --name #{@builder.format name}"
          yield @builder if block_given?
          self
        end
        def exclude(pattern)
          @builder.append " --exclude #{@builder.format pattern}"
          yield @builder if block_given?
          self
        end
        def profile(profile)
          @builder.append " --profile #{@builder.format profile}"
          yield @builder if block_given?
          self
        end
        def no_profile
          @builder.append ' --no-profile'
          yield @builder if block_given?
          self
        end
        def color
          @builder.append ' --color'
          yield @builder if block_given?
          self
        end
        def no_color
          @builder.append ' --no-color'
          yield @builder if block_given?
          self
        end
        def dry_run
          @builder.append ' --dry-run'
          yield @builder if block_given?
          self
        end
        def autoformat(dir)
          @builder.append " --autoformat #{@builder.format dir}"
          yield @builder if block_given?
          self
        end
        def no_multiline
          @builder.append ' --no-multiline'
          yield @builder if block_given?
          self
        end
        def no_source
          @builder.append ' --no-source'
          yield @builder if block_given?
          self
        end
        def no_snippets
          @builder.append ' --no-snippets'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def backtrace
          @builder.append ' --backtrace'
          yield @builder if block_given?
          self
        end
        def strict
          @builder.append ' --strict'
          yield @builder if block_given?
          self
        end
        def wip
          @builder.append ' --wip'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def guess
          @builder.append ' --guess'
          yield @builder if block_given?
          self
        end
        def lines(lines)
          @builder.append " --lines #{@builder.format lines}"
          yield @builder if block_given?
          self
        end
        def expand
          @builder.append ' --expand'
          yield @builder if block_given?
          self
        end
        def drb
          @builder.append ' --drb'
          yield @builder if block_given?
          self
        end
        def no_drb
          @builder.append ' --no-drb'
          yield @builder if block_given?
          self
        end
        def port(port)
          @builder.append " --port #{@builder.format port}"
          yield @builder if block_given?
          self
        end
        def dotcucumber(dir)
          @builder.append " --dotcucumber #{@builder.format dir}"
          yield @builder if block_given?
          self
        end
        def version
          @builder.append ' --version'
          yield @builder if block_given?
          self
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
      end

    end
  end
end