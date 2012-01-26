require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Cucumber
    module V11
      class Cucumber
        def initialize builder
          @builder = builder
          @builder.append 'cucumber'
        end
        def require library
          @builder.append "--require #{@builder.format library}"
          self
        end
        def i18n lang
          @builder.append "--i18n #{@builder.format lang}"
          self
        end
        def format format
          @builder.append "--format #{@builder.format format}"
          self
        end
        def out file
          @builder.append "--out #{@builder.format file}"
          self
        end
        def tags tag_expression
          @builder.append "--tags #{@builder.format tag_expression, ','}"
          self
        end
        def name name
          @builder.append "--name #{@builder.format name}"
          self
        end
        def exclude pattern
          @builder.append "--exclude #{@builder.format pattern}"
          self
        end
        def profile profile
          @builder.append "--profile #{@builder.format profile}"
          self
        end
        def no_profile 
          @builder.append '--no-profile'
          self
        end
        def color 
          @builder.append '--color'
          self
        end
        def no_color 
          @builder.append '--no-color'
          self
        end
        def dry_run 
          @builder.append '--dry-run'
          self
        end
        def autoformat dir
          @builder.append "--autoformat #{@builder.format dir}"
          self
        end
        def no_multiline 
          @builder.append '--no-multiline'
          self
        end
        def no_source 
          @builder.append '--no-source'
          self
        end
        def no_snippets 
          @builder.append '--no-snippets'
          self
        end
        def quiet 
          @builder.append '--quiet'
          self
        end
        def backtrace 
          @builder.append '--backtrace'
          self
        end
        def strict 
          @builder.append '--strict'
          self
        end
        def wip 
          @builder.append '--wip'
          self
        end
        def verbose 
          @builder.append '--verbose'
          self
        end
        def guess 
          @builder.append '--guess'
          self
        end
        def lines lines
          @builder.append "--lines #{@builder.format lines}"
          self
        end
        def expand 
          @builder.append '--expand'
          self
        end
        def drb 
          @builder.append '--drb'
          self
        end
        def port port
          @builder.append "--port #{@builder.format port}"
          self
        end
        def dotcucumber dir
          @builder.append "--dotcucumber #{@builder.format dir}"
          self
        end
        def version 
          @builder.append '--version'
          self
        end
        def help 
          @builder.append '--help'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      def cucumber 
        Cucumber.new CommandBuilder.new
      end
    end
  end
  def cucumber_11 
    Cucumber::V11::cucumber
  end
end
