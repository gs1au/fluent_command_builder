require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module AspnetCompiler
    module V35
      class AspnetCompiler
        def initialize builder
          @builder = builder
          @builder.append 'aspnet_compiler'
        end
        def target_dir target_dir
          @builder.append "#{@builder.format target_dir}"
          self
        end
        def m metabase_path
          @builder.append "-m #{@builder.format metabase_path}"
          self
        end
        def v virtual_path
          @builder.append "-v #{@builder.format virtual_path}"
          self
        end
        def p physical_path
          @builder.append "-p #{@builder.format physical_path}"
          self
        end
        def u 
          @builder.append '-u'
          self
        end
        def f 
          @builder.append '-f'
          self
        end
        def d 
          @builder.append '-d'
          self
        end
        def fixed_names 
          @builder.append '-fixedNames'
          self
        end
        def c 
          @builder.append '-c'
          self
        end
        def error_stack 
          @builder.append '-errorStack'
          self
        end
        def no_logo 
          @builder.append '-noLogo'
          self
        end
        def key_file file
          @builder.append "-keyFile #{@builder.format file}"
          self
        end
        def key_container container
          @builder.append "-keyContainer #{@builder.format container}"
          self
        end
        def aptca 
          @builder.append '-aptca'
          self
        end
        def delay_sign 
          @builder.append '-delaySign'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      def aspnet_compiler 
        AspnetCompiler.new CommandBuilder.new
      end
    end
  end
  def aspnet_compiler_35 
    AspnetCompiler::V35::aspnet_compiler
  end
end
