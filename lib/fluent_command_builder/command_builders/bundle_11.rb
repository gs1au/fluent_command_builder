require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def bundle_11
    FluentCommandBuilder::Bundle::V11.create { |b| yield b if block_given? }
  end
  module Bundle
    module V11
      VERSION = '1.1'
      def self.create
        b = UnderlyingBuilder.new FluentCommandBuilder::Bundle::COMMAND_NAME
        c = Bundle.new(b)
        yield b if block_given?
        c
      end
      def bundle
        FluentCommandBuilder::Bundle::V11.create { |b| yield b if block_given? }
      end
      class Bundle < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
        end
        def cache
          Cache.new @b
        end
        def check
          Check.new @b
        end
        def clean
          Clean.new @b
        end
        def config(name, value=nil)
          @b.append " config #{@b.format name}"
          @b.append " #{@b.format value}" unless value.nil?
          yield @b if block_given?
          self
        end
        def console(group=nil)
          @b.append ' console'
          @b.append " #{@b.format group}" unless group.nil?
          yield @b if block_given?
          self
        end
        def exec(command)
          @b.append " exec #{@b.format command}"
          yield @b if block_given?
          self
        end
        def gem(gem)
          Gem.new @b, gem
        end
        def init
          Init.new @b
        end
        def install
          Install.new @b
        end
        def open(gem)
          @b.append " open #{@b.format gem}"
          yield @b if block_given?
          self
        end
        def outdated(gem=nil)
          Outdated.new @b, gem
        end
        def package
          Package.new @b
        end
        def show(gem=nil)
          Show.new @b, gem
        end
        def update(gem=nil)
          Update.new @b, gem
        end
        def version
          @b.append ' version'
          yield @b if block_given?
          self
        end
        def viz
          Viz.new @b
        end
      end
      class Cache < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' cache'
        end
        def no_prune
          @b.append ' --no-prune'
          yield @b if block_given?
          self
        end
      end
      class Check < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' check'
        end
        def gemfile(file)
          @b.append " --gemfile=#{@b.format file}"
          yield @b if block_given?
          self
        end
        def path(path)
          @b.append " --path=#{@b.format path}"
          yield @b if block_given?
          self
        end
      end
      class Clean < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' clean'
        end
        def force
          @b.append ' --force'
          yield @b if block_given?
          self
        end
      end
      class Gem < CommandBase
        def initialize(underlying_builder, gem)
          super underlying_builder
          @b.append " gem #{@b.format gem}"
        end
        def bin
          @b.append ' --bin'
          yield @b if block_given?
          self
        end
      end
      class Init < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' init'
        end
        def gemspec(file)
          @b.append " --gemspec=#{@b.format file}"
          yield @b if block_given?
          self
        end
      end
      class Install < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' install'
        end
        def binstubs(path)
          @b.append " --binstubs=#{@b.format path}"
          yield @b if block_given?
          self
        end
        def clean
          @b.append ' --clean'
          yield @b if block_given?
          self
        end
        def deployment
          @b.append ' --deployment'
          yield @b if block_given?
          self
        end
        def frozen
          @b.append ' --frozen'
          yield @b if block_given?
          self
        end
        def full_index
          @b.append ' --full-index'
          yield @b if block_given?
          self
        end
        def gemfile(file)
          @b.append " --gemfile=#{@b.format file}"
          yield @b if block_given?
          self
        end
        def local
          @b.append ' --local'
          yield @b if block_given?
          self
        end
        def no_cache
          @b.append ' --no-cache'
          yield @b if block_given?
          self
        end
        def no_prune
          @b.append ' --no-prune'
          yield @b if block_given?
          self
        end
        def path(path)
          @b.append " --path=#{@b.format path}"
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def shebang(string)
          @b.append " --shebang=#{@b.format string}"
          yield @b if block_given?
          self
        end
        def standalone(array)
          @b.append " --standalone=#{@b.format array}"
          yield @b if block_given?
          self
        end
        def system
          @b.append ' --system'
          yield @b if block_given?
          self
        end
        def without(group)
          @b.append " --without=#{@b.format group}"
          yield @b if block_given?
          self
        end
      end
      class Outdated < CommandBase
        def initialize(underlying_builder, gem=nil)
          super underlying_builder
          @b.append ' outdated'
          @b.append " #{@b.format gem}" unless gem.nil?
        end
        def local
          @b.append ' --local'
          yield @b if block_given?
          self
        end
        def pre
          @b.append ' --pre'
          yield @b if block_given?
          self
        end
        def source
          @b.append ' --source'
          yield @b if block_given?
          self
        end
      end
      class Package < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' package'
        end
        def no_prune
          @b.append ' --no-prune'
          yield @b if block_given?
          self
        end
      end
      class Show < CommandBase
        def initialize(underlying_builder, gem=nil)
          super underlying_builder
          @b.append ' show'
          @b.append " #{@b.format gem}" unless gem.nil?
        end
        def paths
          @b.append ' --paths'
          yield @b if block_given?
          self
        end
      end
      class Update < CommandBase
        def initialize(underlying_builder, gem=nil)
          super underlying_builder
          @b.append ' update'
          @b.append " #{@b.format gem}" unless gem.nil?
        end
        def local
          @b.append ' --local'
          yield @b if block_given?
          self
        end
        def source(source)
          @b.append " --source=#{@b.format source}"
          yield @b if block_given?
          self
        end
      end
      class Viz < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' viz'
        end
        def file(file)
          @b.append " --file=#{@b.format file}"
          yield @b if block_given?
          self
        end
        def format(format)
          @b.append " --format=#{@b.format format}"
          yield @b if block_given?
          self
        end
        def requirements
          @b.append ' --requirements'
          yield @b if block_given?
          self
        end
        def version
          @b.append ' --version'
          yield @b if block_given?
          self
        end
      end

    end
  end
end