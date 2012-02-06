require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module AspnetCompiler
    module V35
      class AspnetCompiler < CommandBase
        def initialize builder, target_dir=nil
          @builder = builder
          @builder.append 'aspnet_compiler'
          @builder.append " #{@builder.format target_dir}" unless target_dir.nil?
        end
        def metabase_path metabase_path
          @builder.append " -m #{@builder.format metabase_path}"
          self
        end
        def virtual_path virtual_path
          @builder.append " -v #{@builder.format virtual_path}"
          self
        end
        def physical_path physical_path
          @builder.append " -p #{@builder.format physical_path}"
          self
        end
        def allow_subsequent_updates 
          @builder.append ' -u'
          self
        end
        def force_overwrite_files 
          @builder.append ' -f'
          self
        end
        def force_debug_output 
          @builder.append ' -d'
          self
        end
        def fixed_names 
          @builder.append ' -fixedNames'
          self
        end
        def full_rebuild 
          @builder.append ' -c'
          self
        end
        def error_stack 
          @builder.append ' -errorStack'
          self
        end
        def no_logo 
          @builder.append ' -noLogo'
          self
        end
        def key_file file
          @builder.append " -keyFile #{@builder.format file}"
          self
        end
        def key_container container
          @builder.append " -keyContainer #{@builder.format container}"
          self
        end
        def aptca 
          @builder.append ' -aptca'
          self
        end
        def delay_sign 
          @builder.append ' -delaySign'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      def aspnet_compiler target_dir=nil
        AspnetCompiler.new CommandBuilder.new, target_dir
      end
    end
  end
  def aspnet_compiler_35 target_dir=nil
    AspnetCompiler::V35::AspnetCompiler.new CommandBuilder.new, target_dir
  end
end
