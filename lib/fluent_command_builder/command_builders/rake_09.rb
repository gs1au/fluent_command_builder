require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def rake_09(task=nil)
    b = UnderlyingBuilder.new
    c = FluentCommandBuilder::Rake::V09.create b, task
    yield b if block_given?
    c
  end
  module Rake
    module V09
      def self.create(underlying_builder, task=nil)
        Rake.new underlying_builder, task
      end
      def rake(task=nil)
        b = UnderlyingBuilder.new
        c = FluentCommandBuilder::Rake::V09.create b, task
        yield b if block_given?
        c
      end
      class Rake < CommandBase
        def initialize(underlying_builder, task=nil)
          super underlying_builder
          @builder.command_name = 'rake'
          @builder.append " #{@builder.format task, ' '}" unless task.nil?
        end
        def classic_namespace
          @builder.append ' --classic-namespace'
          yield @builder if block_given?
          self
        end
        def describe(pattern)
          @builder.append " --describe #{@builder.format pattern}"
          yield @builder if block_given?
          self
        end
        def dry_run
          @builder.append ' --dry-run'
          yield @builder if block_given?
          self
        end
        def execute(code)
          @builder.append " --execute #{@builder.format code}"
          yield @builder if block_given?
          self
        end
        def execute_print(code)
          @builder.append " --execute-print #{@builder.format code}"
          yield @builder if block_given?
          self
        end
        def execute_continue(code)
          @builder.append " --execute-continue #{@builder.format code}"
          yield @builder if block_given?
          self
        end
        def libdir(lib_dir)
          @builder.append " --libdir #{@builder.format lib_dir}"
          yield @builder if block_given?
          self
        end
        def no_search
          @builder.append ' --no-search'
          yield @builder if block_given?
          self
        end
        def prereqs
          @builder.append ' --prereqs'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def rakefile(file)
          @builder.append " --rakefile #{@builder.format file}"
          yield @builder if block_given?
          self
        end
        def rakelibdir(rake_lib_dir)
          @builder.append " --rakelibdir #{@builder.format rake_lib_dir}"
          yield @builder if block_given?
          self
        end
        def require(file)
          @builder.append " --require #{@builder.format file}"
          yield @builder if block_given?
          self
        end
        def rules
          @builder.append ' --rules'
          yield @builder if block_given?
          self
        end
        def silent
          @builder.append ' --silent'
          yield @builder if block_given?
          self
        end
        def no_system
          @builder.append ' --no-system'
          yield @builder if block_given?
          self
        end
        def tasks(pattern)
          @builder.append " --tasks #{@builder.format pattern}"
          yield @builder if block_given?
          self
        end
        def trace
          @builder.append ' --trace'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def version
          @builder.append ' --version'
          yield @builder if block_given?
          self
        end
        def where(pattern)
          @builder.append " --where #{@builder.format pattern}"
          yield @builder if block_given?
          self
        end
        def no_deprecation_warnings
          @builder.append ' --no-deprecation-warnings'
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
