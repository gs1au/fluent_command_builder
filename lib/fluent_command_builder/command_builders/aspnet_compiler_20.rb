require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def aspnet_compiler_20(target_dir=nil)
    FluentCommandBuilder::AspnetCompiler::V20.create(target_dir) { |b| yield b if block_given? }
  end
  module AspnetCompiler
    module V20
      VERSION = '2.0'
      def self.create(target_dir=nil)
        b = UnderlyingBuilder.new FluentCommandBuilder::AspnetCompiler::COMMAND_NAME
        c = AspnetCompiler.new(b, target_dir)
        yield b if block_given?
        c
      end
      def aspnet_compiler(target_dir=nil)
        FluentCommandBuilder::AspnetCompiler::V20.create(target_dir) { |b| yield b if block_given? }
      end
      class AspnetCompiler < CommandBase
        def initialize(underlying_builder, target_dir=nil)
          super underlying_builder
          @b.append " #{@b.format target_dir}" unless target_dir.nil?
        end
        def metabase_path(metabase_path)
          @b.append " -m #{@b.format metabase_path}"
          yield @b if block_given?
          self
        end
        def virtual_path(virtual_path)
          @b.append " -v #{@b.format virtual_path}"
          yield @b if block_given?
          self
        end
        def physical_path(physical_path)
          @b.append " -p #{@b.format physical_path}"
          yield @b if block_given?
          self
        end
        def allow_subsequent_updates
          @b.append ' -u'
          yield @b if block_given?
          self
        end
        def force_overwrite_files
          @b.append ' -f'
          yield @b if block_given?
          self
        end
        def force_debug_output
          @b.append ' -d'
          yield @b if block_given?
          self
        end
        def fixed_names
          @b.append ' -fixedNames'
          yield @b if block_given?
          self
        end
        def full_rebuild
          @b.append ' -c'
          yield @b if block_given?
          self
        end
        def error_stack
          @b.append ' -errorStack'
          yield @b if block_given?
          self
        end
        def no_logo
          @b.append ' -noLogo'
          yield @b if block_given?
          self
        end
        def key_file(file)
          @b.append " -keyFile #{@b.format file}"
          yield @b if block_given?
          self
        end
        def key_container(container)
          @b.append " -keyContainer #{@b.format container}"
          yield @b if block_given?
          self
        end
        def aptca
          @b.append ' -aptca'
          yield @b if block_given?
          self
        end
        def delay_sign
          @b.append ' -delaySign'
          yield @b if block_given?
          self
        end
      end

    end
  end
end