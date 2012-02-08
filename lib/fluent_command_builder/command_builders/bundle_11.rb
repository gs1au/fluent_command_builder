require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Bundle
    module V11
      COMMAND_NAME = 'bundle'
      class Bundle < CommandBase
        def initialize builder
          super builder
        end
        def cache 
          Cache.new @builder
        end
        def check 
          Check.new @builder
        end
        def clean 
          Clean.new @builder
        end
        def config name, value=nil
          @builder.append " config #{@builder.format name}"
          @builder.append " #{@builder.format value}" unless value.nil?
          yield @builder if block_given?
          self
        end
        def console group=nil
          @builder.append ' console'
          @builder.append " #{@builder.format group}" unless group.nil?
          yield @builder if block_given?
          self
        end
        def exec command
          @builder.append " exec #{@builder.format command}"
          yield @builder if block_given?
          self
        end
        def gem gem
          Gem.new @builder, gem
        end
        def init 
          Init.new @builder
        end
        def install 
          Install.new @builder
        end
        def open gem
          @builder.append " open #{@builder.format gem}"
          yield @builder if block_given?
          self
        end
        def outdated gem=nil
          Outdated.new @builder, gem
        end
        def package 
          Package.new @builder
        end
        def show gem=nil
          Show.new @builder, gem
        end
        def update gem=nil
          Update.new @builder, gem
        end
        def version 
          @builder.append ' version'
          yield @builder if block_given?
          self
        end
        def viz 
          Viz.new @builder
        end
      end
      class Cache < CommandBase
        def initialize builder
          super builder
          @builder.append ' cache'
        end
        def no_prune 
          @builder.append ' --no-prune'
          yield @builder if block_given?
          self
        end
      end
      class Check < CommandBase
        def initialize builder
          super builder
          @builder.append ' check'
        end
        def gemfile file
          @builder.append " --gemfile=#{@builder.format file}"
          yield @builder if block_given?
          self
        end
        def path path
          @builder.append " --path=#{@builder.format path}"
          yield @builder if block_given?
          self
        end
      end
      class Clean < CommandBase
        def initialize builder
          super builder
          @builder.append ' clean'
        end
        def force 
          @builder.append ' --force'
          yield @builder if block_given?
          self
        end
      end
      class Gem < CommandBase
        def initialize builder, gem
          super builder
          @builder.append " gem #{@builder.format gem}"
        end
        def bin 
          @builder.append ' --bin'
          yield @builder if block_given?
          self
        end
      end
      class Init < CommandBase
        def initialize builder
          super builder
          @builder.append ' init'
        end
        def gemspec file
          @builder.append " --gemspec=#{@builder.format file}"
          yield @builder if block_given?
          self
        end
      end
      class Install < CommandBase
        def initialize builder
          super builder
          @builder.append ' install'
        end
        def binstubs path
          @builder.append " --binstubs=#{@builder.format path}"
          yield @builder if block_given?
          self
        end
        def clean 
          @builder.append ' --clean'
          yield @builder if block_given?
          self
        end
        def deployment 
          @builder.append ' --deployment'
          yield @builder if block_given?
          self
        end
        def frozen 
          @builder.append ' --frozen'
          yield @builder if block_given?
          self
        end
        def full_index 
          @builder.append ' --full-index'
          yield @builder if block_given?
          self
        end
        def gemfile file
          @builder.append " --gemfile=#{@builder.format file}"
          yield @builder if block_given?
          self
        end
        def local 
          @builder.append ' --local'
          yield @builder if block_given?
          self
        end
        def no_cache 
          @builder.append ' --no-cache'
          yield @builder if block_given?
          self
        end
        def no_prune 
          @builder.append ' --no-prune'
          yield @builder if block_given?
          self
        end
        def path path
          @builder.append " --path=#{@builder.format path}"
          yield @builder if block_given?
          self
        end
        def quiet 
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def shebang string
          @builder.append " --shebang=#{@builder.format string}"
          yield @builder if block_given?
          self
        end
        def standalone array
          @builder.append " --standalone=#{@builder.format array}"
          yield @builder if block_given?
          self
        end
        def system 
          @builder.append ' --system'
          yield @builder if block_given?
          self
        end
        def without group
          @builder.append " --without=#{@builder.format group}"
          yield @builder if block_given?
          self
        end
      end
      class Outdated < CommandBase
        def initialize builder, gem=nil
          super builder
          @builder.append ' outdated'
          @builder.append " #{@builder.format gem}" unless gem.nil?
        end
        def local 
          @builder.append ' --local'
          yield @builder if block_given?
          self
        end
        def pre 
          @builder.append ' --pre'
          yield @builder if block_given?
          self
        end
        def source 
          @builder.append ' --source'
          yield @builder if block_given?
          self
        end
      end
      class Package < CommandBase
        def initialize builder
          super builder
          @builder.append ' package'
        end
        def no_prune 
          @builder.append ' --no-prune'
          yield @builder if block_given?
          self
        end
      end
      class Show < CommandBase
        def initialize builder, gem=nil
          super builder
          @builder.append ' show'
          @builder.append " #{@builder.format gem}" unless gem.nil?
        end
        def paths 
          @builder.append ' --paths'
          yield @builder if block_given?
          self
        end
      end
      class Update < CommandBase
        def initialize builder, gem=nil
          super builder
          @builder.append ' update'
          @builder.append " #{@builder.format gem}" unless gem.nil?
        end
        def local 
          @builder.append ' --local'
          yield @builder if block_given?
          self
        end
        def source source
          @builder.append " --source=#{@builder.format source}"
          yield @builder if block_given?
          self
        end
      end
      class Viz < CommandBase
        def initialize builder
          super builder
          @builder.append ' viz'
        end
        def file file
          @builder.append " --file=#{@builder.format file}"
          yield @builder if block_given?
          self
        end
        def format format
          @builder.append " --format=#{@builder.format format}"
          yield @builder if block_given?
          self
        end
        def requirements 
          @builder.append ' --requirements'
          yield @builder if block_given?
          self
        end
        def version 
          @builder.append ' --version'
          yield @builder if block_given?
          self
        end
      end
      def bundle 
        builder = CommandBuilder.new COMMAND_NAME
        command = Bundle.new builder
        yield builder if block_given?
        command
      end
    end
  end
  def bundle_11 
    builder = CommandBuilder.new Bundle::V11::COMMAND_NAME
    command = Bundle::V11::Bundle.new builder
    yield builder if block_given?
    command
  end
end
