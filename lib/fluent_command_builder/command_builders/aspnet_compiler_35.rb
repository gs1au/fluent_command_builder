require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module AspnetCompiler
    module V35
      COMMAND_NAME = 'aspnet_compiler'
      class AspnetCompiler < CommandBase
        def initialize builder, target_dir=nil
          super builder
          @builder.append " #{@builder.format target_dir}" unless target_dir.nil?
        end
        def metabase_path metabase_path
          @builder.append " -m #{@builder.format metabase_path}"
          yield @builder if block_given?
          self
        end
        def virtual_path virtual_path
          @builder.append " -v #{@builder.format virtual_path}"
          yield @builder if block_given?
          self
        end
        def physical_path physical_path
          @builder.append " -p #{@builder.format physical_path}"
          yield @builder if block_given?
          self
        end
        def allow_subsequent_updates
          @builder.append ' -u'
          yield @builder if block_given?
          self
        end
        def force_overwrite_files
          @builder.append ' -f'
          yield @builder if block_given?
          self
        end
        def force_debug_output
          @builder.append ' -d'
          yield @builder if block_given?
          self
        end
        def fixed_names
          @builder.append ' -fixedNames'
          yield @builder if block_given?
          self
        end
        def full_rebuild
          @builder.append ' -c'
          yield @builder if block_given?
          self
        end
        def error_stack
          @builder.append ' -errorStack'
          yield @builder if block_given?
          self
        end
        def no_logo
          @builder.append ' -noLogo'
          yield @builder if block_given?
          self
        end
        def key_file file
          @builder.append " -keyFile #{@builder.format file}"
          yield @builder if block_given?
          self
        end
        def key_container container
          @builder.append " -keyContainer #{@builder.format container}"
          yield @builder if block_given?
          self
        end
        def aptca
          @builder.append ' -aptca'
          yield @builder if block_given?
          self
        end
        def delay_sign
          @builder.append ' -delaySign'
          yield @builder if block_given?
          self
        end
      end
      def aspnet_compiler target_dir=nil
        builder = CommandBuilder.new COMMAND_NAME
        command = AspnetCompiler.new builder, target_dir
        yield builder if block_given?
        command
      end
    end
  end
  def aspnet_compiler_35 target_dir=nil
    builder = CommandBuilder.new AspnetCompiler::V35::COMMAND_NAME
    command = AspnetCompiler::V35::AspnetCompiler.new builder, target_dir
    yield builder if block_given?
    command
  end
end
