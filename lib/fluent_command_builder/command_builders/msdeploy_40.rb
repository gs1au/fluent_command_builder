require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSDeploy
    module V40
      class MSDeploy
        def initialize builder
          @builder = builder
          @builder.append 'MSDeploy'
        end
        def allow_untrusted bool=nil
          @builder.append "-allowUntrusted:#{@builder.format bool}"
          self
        end
        def app_host_config_dir path=nil
          @builder.append "-appHostConfigDir:#{@builder.format path}"
          self
        end
        def declare_param param=nil
          @builder.append "-declareParam:#{@builder.format param, ',', '='}"
          self
        end
        def declare_param_file xml_file=nil
          @builder.append "-declareParamFile:#{@builder.format xml_file}"
          self
        end
        def dest provider=nil
          @builder.append "-dest:#{@builder.format provider}"
          self
        end
        def disable_link link_extension=nil
          @builder.append "-disableLink:#{@builder.format link_extension}"
          self
        end
        def disable_rule rule=nil
          @builder.append "-disableRule:#{@builder.format rule, ','}"
          self
        end
        def disable_skip_directive skip_directive_name=nil
          @builder.append "-disableSkipDirective:#{@builder.format skip_directive_name}"
          self
        end
        def enable_link link_extension=nil
          @builder.append "-enableLink:#{@builder.format link_extension}"
          self
        end
        def enable_rule rule=nil
          @builder.append "-enableRule:#{@builder.format rule, ','}"
          self
        end
        def enable_skip_directive skip_directive_name=nil
          @builder.append "-enableSkipDirective:#{@builder.format skip_directive_name}"
          self
        end
        def post_sync command=nil
          @builder.append "-postSync:#{@builder.format command}"
          self
        end
        def pre_sync command=nil
          @builder.append "-preSync:#{@builder.format command}"
          self
        end
        def remove_param param=nil
          @builder.append "-removeParam:#{@builder.format param}"
          self
        end
        def replace arg=nil
          @builder.append "-replace:#{@builder.format arg}"
          self
        end
        def retry_attempts number=nil
          @builder.append "-retryAttempts:#{@builder.format number}"
          self
        end
        def retry_interval milliseconds=nil
          @builder.append "-retryInterval:#{@builder.format milliseconds}"
          self
        end
        def set_param param=nil
          @builder.append "-setParam:#{@builder.format param, ',', '='}"
          self
        end
        def set_param_file xml_file=nil
          @builder.append "-setParamFile:#{@builder.format xml_file}"
          self
        end
        def show_secure 
          @builder.append '-showSecure'
          self
        end
        def skip arg=nil
          @builder.append "-skip:#{@builder.format arg}"
          self
        end
        def source provider=nil
          @builder.append "-source:#{@builder.format provider}"
          self
        end
        def unicode 
          @builder.append '-unicode'
          self
        end
        def use_check_sum 
          @builder.append '-useCheckSum'
          self
        end
        def verb verb_name=nil
          @builder.append "-verb:#{@builder.format verb_name}"
          self
        end
        def verbose 
          @builder.append '-verbose'
          self
        end
        def web_server_dir path=nil
          @builder.append "-webServerDir:#{@builder.format path}"
          self
        end
        def whatif 
          @builder.append '-whatif'
          self
        end
        def xml 
          @builder.append '-xml'
          self
        end
        def xpath path=nil
          @builder.append "-xpath:#{@builder.format path}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      def msdeploy 
        MSDeploy.new CommandBuilder.new
      end
    end
  end
  def msdeploy_40 
    MSDeploy::V40::MSDeploy.new CommandBuilder.new
  end
end
