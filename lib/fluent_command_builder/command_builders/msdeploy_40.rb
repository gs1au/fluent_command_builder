require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSDeploy
    module V40
      class MSDeploy
        def initialize builder
          @builder = builder
          @builder.append 'MSDeploy'
        end
        def allow_untrusted bool
          @builder.append " -allowUntrusted:#{@builder.format bool}"
          self
        end
        def app_host_config_dir path
          @builder.append " -appHostConfigDir:#{@builder.format path}"
          self
        end
        def declare_param param
          @builder.append " -declareParam:#{@builder.format param, ',', '='}"
          self
        end
        def declare_param_file xml_file
          @builder.append " -declareParamFile:#{@builder.format xml_file}"
          self
        end
        def dest provider
          @builder.append " -dest:#{@builder.format provider}"
          self
        end
        def disable_link link_extension
          @builder.append " -disableLink:#{@builder.format link_extension}"
          self
        end
        def disable_rule rule
          @builder.append " -disableRule:#{@builder.format rule, ','}"
          self
        end
        def disable_skip_directive skip_directive_name
          @builder.append " -disableSkipDirective:#{@builder.format skip_directive_name}"
          self
        end
        def enable_link link_extension
          @builder.append " -enableLink:#{@builder.format link_extension}"
          self
        end
        def enable_rule rule
          @builder.append " -enableRule:#{@builder.format rule, ','}"
          self
        end
        def enable_skip_directive skip_directive_name
          @builder.append " -enableSkipDirective:#{@builder.format skip_directive_name}"
          self
        end
        def post_sync command
          @builder.append " -postSync:#{@builder.format command}"
          self
        end
        def pre_sync command
          @builder.append " -preSync:#{@builder.format command}"
          self
        end
        def remove_param param
          @builder.append " -removeParam:#{@builder.format param}"
          self
        end
        def replace arg
          @builder.append " -replace:#{@builder.format arg}"
          self
        end
        def retry_attempts number
          @builder.append " -retryAttempts:#{@builder.format number}"
          self
        end
        def retry_interval milliseconds
          @builder.append " -retryInterval:#{@builder.format milliseconds}"
          self
        end
        def set_param param
          @builder.append " -setParam:#{@builder.format param, ',', '='}"
          self
        end
        def set_param_file xml_file
          @builder.append " -setParamFile:#{@builder.format xml_file}"
          self
        end
        def show_secure 
          @builder.append ' -showSecure'
          self
        end
        def skip arg
          @builder.append " -skip:#{@builder.format arg}"
          self
        end
        def source provider
          @builder.append " -source:#{@builder.format provider}"
          self
        end
        def unicode 
          @builder.append ' -unicode'
          self
        end
        def use_check_sum 
          @builder.append ' -useCheckSum'
          self
        end
        def verb verb_name
          @builder.append " -verb:#{@builder.format verb_name}"
          self
        end
        def verbose 
          @builder.append ' -verbose'
          self
        end
        def web_server_dir path
          @builder.append " -webServerDir:#{@builder.format path}"
          self
        end
        def whatif 
          @builder.append ' -whatif'
          self
        end
        def xml 
          @builder.append ' -xml'
          self
        end
        def xpath path
          @builder.append " -xpath:#{@builder.format path}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
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
