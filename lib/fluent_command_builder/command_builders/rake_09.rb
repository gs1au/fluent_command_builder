require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def rake_09(task=nil)
    Rake::V09.create(task) { |b| yield b if block_given? }
  end
  module Rake
    module V09
      def self.create(task=nil)
        b = UnderlyingBuilder.new FluentCommandBuilder::Rake::COMMAND_NAME
        c = Rake.new b, task
        yield b if block_given?
        c
      end
      def rake(task=nil)
        V09.create(task) { |b| yield b if block_given? }
      end
      class Rake < CommandBase
        def initialize(underlying_builder, task=nil)
          super underlying_builder
          b.append " #{b.format task, ' '}" unless task.nil?
        end
        def classic_namespace
          b.append ' --classic-namespace'
          yield b if block_given?
          self
        end
        def describe(pattern)
          b.append " --describe #{b.format pattern}"
          yield b if block_given?
          self
        end
        def dry_run
          b.append ' --dry-run'
          yield b if block_given?
          self
        end
        def execute(code)
          b.append " --execute #{b.format code}"
          yield b if block_given?
          self
        end
        def execute_print(code)
          b.append " --execute-print #{b.format code}"
          yield b if block_given?
          self
        end
        def execute_continue(code)
          b.append " --execute-continue #{b.format code}"
          yield b if block_given?
          self
        end
        def libdir(lib_dir)
          b.append " --libdir #{b.format lib_dir}"
          yield b if block_given?
          self
        end
        def no_search
          b.append ' --no-search'
          yield b if block_given?
          self
        end
        def prereqs
          b.append ' --prereqs'
          yield b if block_given?
          self
        end
        def quiet
          b.append ' --quiet'
          yield b if block_given?
          self
        end
        def rakefile(file)
          b.append " --rakefile #{b.format file}"
          yield b if block_given?
          self
        end
        def rakelibdir(rake_lib_dir)
          b.append " --rakelibdir #{b.format rake_lib_dir}"
          yield b if block_given?
          self
        end
        def require(file)
          b.append " --require #{b.format file}"
          yield b if block_given?
          self
        end
        def rules
          b.append ' --rules'
          yield b if block_given?
          self
        end
        def silent
          b.append ' --silent'
          yield b if block_given?
          self
        end
        def no_system
          b.append ' --no-system'
          yield b if block_given?
          self
        end
        def tasks(pattern)
          b.append " --tasks #{b.format pattern}"
          yield b if block_given?
          self
        end
        def trace
          b.append ' --trace'
          yield b if block_given?
          self
        end
        def verbose
          b.append ' --verbose'
          yield b if block_given?
          self
        end
        def version
          b.append ' --version'
          yield b if block_given?
          self
        end
        def where(pattern)
          b.append " --where #{b.format pattern}"
          yield b if block_given?
          self
        end
        def no_deprecation_warnings
          b.append ' --no-deprecation-warnings'
          yield b if block_given?
          self
        end
        def help
          b.append ' --help'
          yield b if block_given?
          self
        end
      end

    end
  end
end