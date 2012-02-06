require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Bundle
    module V11
      class Bundle < CommandBase
        def initialize builder
          @builder = builder
          @builder.append 'bundle'
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
          self
        end
        def console group=nil
          @builder.append ' console'
          @builder.append " #{@builder.format group}" unless group.nil?
          self
        end
        def exec command
          @builder.append " exec #{@builder.format command}"
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
          self
        end
        def viz 
          Viz.new @builder
        end
        def to_s 
          @builder.to_s
        end
      end
      class Cache < CommandBase
        def initialize builder
          @builder = builder
          @builder.append ' cache'
        end
        def no_prune 
          @builder.append ' --no-prune'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Check < CommandBase
        def initialize builder
          @builder = builder
          @builder.append ' check'
        end
        def gemfile file
          @builder.append " --gemfile=#{@builder.format file}"
          self
        end
        def path path
          @builder.append " --path=#{@builder.format path}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Clean < CommandBase
        def initialize builder
          @builder = builder
          @builder.append ' clean'
        end
        def force 
          @builder.append ' --force'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Gem < CommandBase
        def initialize builder, gem
          @builder = builder
          @builder.append " gem #{@builder.format gem}"
        end
        def bin 
          @builder.append ' --bin'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Init < CommandBase
        def initialize builder
          @builder = builder
          @builder.append ' init'
        end
        def gemspec file
          @builder.append " --gemspec=#{@builder.format file}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Install < CommandBase
        def initialize builder
          @builder = builder
          @builder.append ' install'
        end
        def binstubs path
          @builder.append " --binstubs=#{@builder.format path}"
          self
        end
        def clean 
          @builder.append ' --clean'
          self
        end
        def deployment 
          @builder.append ' --deployment'
          self
        end
        def frozen 
          @builder.append ' --frozen'
          self
        end
        def full_index 
          @builder.append ' --full-index'
          self
        end
        def gemfile file
          @builder.append " --gemfile=#{@builder.format file}"
          self
        end
        def local 
          @builder.append ' --local'
          self
        end
        def no_cache 
          @builder.append ' --no-cache'
          self
        end
        def no_prune 
          @builder.append ' --no-prune'
          self
        end
        def path path
          @builder.append " --path=#{@builder.format path}"
          self
        end
        def quiet 
          @builder.append ' --quiet'
          self
        end
        def shebang string
          @builder.append " --shebang=#{@builder.format string}"
          self
        end
        def standalone array
          @builder.append " --standalone=#{@builder.format array}"
          self
        end
        def system 
          @builder.append ' --system'
          self
        end
        def without group
          @builder.append " --without=#{@builder.format group}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Outdated < CommandBase
        def initialize builder, gem=nil
          @builder = builder
          @builder.append ' outdated'
          @builder.append " #{@builder.format gem}" unless gem.nil?
        end
        def local 
          @builder.append ' --local'
          self
        end
        def pre 
          @builder.append ' --pre'
          self
        end
        def source 
          @builder.append ' --source'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Package < CommandBase
        def initialize builder
          @builder = builder
          @builder.append ' package'
        end
        def no_prune 
          @builder.append ' --no-prune'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Show < CommandBase
        def initialize builder, gem=nil
          @builder = builder
          @builder.append ' show'
          @builder.append " #{@builder.format gem}" unless gem.nil?
        end
        def paths 
          @builder.append ' --paths'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Update < CommandBase
        def initialize builder, gem=nil
          @builder = builder
          @builder.append ' update'
          @builder.append " #{@builder.format gem}" unless gem.nil?
        end
        def local 
          @builder.append ' --local'
          self
        end
        def source source
          @builder.append " --source=#{@builder.format source}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Viz < CommandBase
        def initialize builder
          @builder = builder
          @builder.append ' viz'
        end
        def file file
          @builder.append " --file=#{@builder.format file}"
          self
        end
        def format format
          @builder.append " --format=#{@builder.format format}"
          self
        end
        def requirements 
          @builder.append ' --requirements'
          self
        end
        def version 
          @builder.append ' --version'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      def bundle 
        Bundle.new CommandBuilder.new
      end
    end
  end
  def bundle_11 
    Bundle::V11::Bundle.new CommandBuilder.new
  end
end
