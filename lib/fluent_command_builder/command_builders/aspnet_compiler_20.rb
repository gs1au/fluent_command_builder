require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module AspnetCompiler
    module V20
      class AspnetCompiler
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'aspnet_compiler'
          self
        end
        
        def target_dir target_dir
          @b.append "#{@b.format target_dir}"
          self
        end
        
        def m metabase_path
          @b.append "-m #{@b.format metabase_path}"
          self
        end
        
        def v virtual_path
          @b.append "-v #{@b.format virtual_path}"
          self
        end
        
        def p physical_path
          @b.append "-p #{@b.format physical_path}"
          self
        end
        
        def u 
          @b.append '-u'
          self
        end
        
        def f 
          @b.append '-f'
          self
        end
        
        def d 
          @b.append '-d'
          self
        end
        
        def fixed_names 
          @b.append '-fixedNames'
          self
        end
        
        def c 
          @b.append '-c'
          self
        end
        
        def error_stack 
          @b.append '-errorStack'
          self
        end
        
        def no_logo 
          @b.append '-noLogo'
          self
        end
        
        def key_file file
          @b.append "-keyFile #{@b.format file}"
          self
        end
        
        def key_container container
          @b.append "-keyContainer #{@b.format container}"
          self
        end
        
        def aptca 
          @b.append '-aptca'
          self
        end
        
        def delay_sign 
          @b.append '-delaySign'
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      def aspnet_compiler
        AspnetCompiler.new
      end
      
    end
    
  end
  
  def aspnet_compiler_20
    AspnetCompiler::V20::AspnetCompiler.new
  end
  
end

