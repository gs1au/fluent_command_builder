require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSDeploy
    module V40
      class MSDeploy
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'MSDeploy'
          self
        end
        
        def allow_untrusted bool
          @b.append "-allowUntrusted:#{@b.format bool}"
          self
        end
        
        def app_host_config_dir path
          @b.append "-appHostConfigDir:#{@b.format path}"
          self
        end
        
        def declare_param param
          @b.append "-declareParam:#{@b.format param, ',', '='}"
          self
        end
        
        def declare_param_file xml_file
          @b.append "-declareParamFile:#{@b.format xml_file}"
          self
        end
        
        def dest provider
          @b.append "-dest:#{@b.format provider}"
          self
        end
        
        def disable_link link_extension
          @b.append "-disableLink:#{@b.format link_extension}"
          self
        end
        
        def disable_rule rule
          @b.append "-disableRule:#{@b.format rule, ','}"
          self
        end
        
        def disable_skip_directive skip_directive_name
          @b.append "-disableSkipDirective:#{@b.format skip_directive_name}"
          self
        end
        
        def enable_link link_extension
          @b.append "-enableLink:#{@b.format link_extension}"
          self
        end
        
        def enable_rule rule
          @b.append "-enableRule:#{@b.format rule, ','}"
          self
        end
        
        def enable_skip_directive skip_directive_name
          @b.append "-enableSkipDirective:#{@b.format skip_directive_name}"
          self
        end
        
        def post_sync command
          @b.append "-postSync:#{@b.format command}"
          self
        end
        
        def pre_sync command
          @b.append "-preSync:#{@b.format command}"
          self
        end
        
        def remove_param param
          @b.append "-removeParam:#{@b.format param}"
          self
        end
        
        def replace arg
          @b.append "-replace:#{@b.format arg}"
          self
        end
        
        def retry_attempts number
          @b.append "-retryAttempts:#{@b.format number}"
          self
        end
        
        def retry_interval milliseconds
          @b.append "-retryInterval:#{@b.format milliseconds}"
          self
        end
        
        def set_param param
          @b.append "-setParam:#{@b.format param, ',', '='}"
          self
        end
        
        def set_param_file xml_file
          @b.append "-setParamFile:#{@b.format xml_file}"
          self
        end
        
        def show_secure 
          @b.append '-showSecure'
          self
        end
        
        def skip arg
          @b.append "-skip:#{@b.format arg}"
          self
        end
        
        def source provider
          @b.append "-source:#{@b.format provider}"
          self
        end
        
        def unicode 
          @b.append '-unicode'
          self
        end
        
        def use_check_sum 
          @b.append '-useCheckSum'
          self
        end
        
        def verb verb_name
          @b.append "-verb:#{@b.format verb_name}"
          self
        end
        
        def verbose 
          @b.append '-verbose'
          self
        end
        
        def web_server_dir path
          @b.append "-webServerDir:#{@b.format path}"
          self
        end
        
        def whatif 
          @b.append '-whatif'
          self
        end
        
        def xml 
          @b.append '-xml'
          self
        end
        
        def xpath path
          @b.append "-xpath:#{@b.format path}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      def msdeploy
        MSDeploy.new
      end
      
    end
    
  end
  
  def msdeploy_40
    MSDeploy::V40::MSDeploy.new
  end
  
end

