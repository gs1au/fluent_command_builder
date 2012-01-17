require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSDeploy
    module V40
      class MSDeploy
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'MSDeploy'
          self
        end
        
        def allow_untrusted bool
          @builder.append "-allowUntrusted:#{bool}"
          self
        end
        
        def app_host_config_dir path
          @builder.append "-appHostConfigDir:#{path}"
          self
        end
        
        def declare_param param
          @builder.format(param, ',', '=') { |v| @builder.append "-declareParam:#{v}" }
          self
        end
        
        def declare_param_file xml_file
          @builder.append "-declareParamFile:#{xml_file}"
          self
        end
        
        def dest provider
          @builder.append "-dest:#{provider}"
          self
        end
        
        def disable_link link_extension
          @builder.append "-disableLink:#{link_extension}"
          self
        end
        
        def disable_rule rule
          @builder.format(rule, ',') { |v| @builder.append "-disableRule:#{v}" }
          self
        end
        
        def disable_skip_directive skip_directive_name
          @builder.append "-disableSkipDirective:#{skip_directive_name}"
          self
        end
        
        def enable_link link_extension
          @builder.append "-enableLink:#{link_extension}"
          self
        end
        
        def enable_rule rule
          @builder.format(rule, ',') { |v| @builder.append "-enableRule:#{v}" }
          self
        end
        
        def enable_skip_directive skip_directive_name
          @builder.append "-enableSkipDirective:#{skip_directive_name}"
          self
        end
        
        def post_sync command
          @builder.append "-postSync:#{command}"
          self
        end
        
        def pre_sync command
          @builder.append "-preSync:#{command}"
          self
        end
        
        def remove_param param
          @builder.append "-removeParam:#{param}"
          self
        end
        
        def replace arg
          @builder.append "-replace:#{arg}"
          self
        end
        
        def retry_attempts number
          @builder.append "-retryAttempts:#{number}"
          self
        end
        
        def retry_interval milliseconds
          @builder.append "-retryInterval:#{milliseconds}"
          self
        end
        
        def set_param param
          @builder.format(param, ',', '=') { |v| @builder.append "-setParam:#{v}" }
          self
        end
        
        def set_param_file xml_file
          @builder.append "-setParamFile:#{xml_file}"
          self
        end
        
        def show_secure 
          @builder.append "-showSecure"
          self
        end
        
        def skip arg
          @builder.append "-skip:#{arg}"
          self
        end
        
        def source provider
          @builder.append "-source:#{provider}"
          self
        end
        
        def unicode 
          @builder.append "-unicode"
          self
        end
        
        def use_check_sum 
          @builder.append "-useCheckSum"
          self
        end
        
        def verb verb_name
          @builder.append "-verb:#{verb_name}"
          self
        end
        
        def verbose 
          @builder.append "-verbose"
          self
        end
        
        def web_server_dir path
          @builder.append "-webServerDir:#{path}"
          self
        end
        
        def whatif 
          @builder.append "-whatif"
          self
        end
        
        def xml 
          @builder.append "-xml"
          self
        end
        
        def xpath path
          @builder.append "-xpath:#{path}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      def msdeploy
        MSDeploy.new
      end
      
    end
    
  end
  
  def msdeploy40
    MSDeploy::V40::MSDeploy.new
  end
  
end

