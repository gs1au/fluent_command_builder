require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSDeploy
    COMMAND_NAME = 'MSDeploy' unless const_defined? :COMMAND_NAME
    module V40
      class MSDeploy < CommandBase
        def initialize(builder)
          super builder
        end
        def allow_untrusted(bool)
          @builder.append " -allowUntrusted:#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def app_host_config_dir(path)
          @builder.append " -appHostConfigDir:#{@builder.format path}"
          yield @builder if block_given?
          self
        end
        def declare_param(param)
          @builder.append " -declareParam:#{@builder.format param, ',', '='}"
          yield @builder if block_given?
          self
        end
        def declare_param_file(xml_file)
          @builder.append " -declareParamFile:#{@builder.format xml_file}"
          yield @builder if block_given?
          self
        end
        def dest(provider)
          @builder.append " -dest:#{@builder.format provider}"
          yield @builder if block_given?
          self
        end
        def disable_link(link_extension)
          @builder.append " -disableLink:#{@builder.format link_extension}"
          yield @builder if block_given?
          self
        end
        def disable_rule(rule)
          @builder.append " -disableRule:#{@builder.format rule, ','}"
          yield @builder if block_given?
          self
        end
        def disable_skip_directive(skip_directive_name)
          @builder.append " -disableSkipDirective:#{@builder.format skip_directive_name}"
          yield @builder if block_given?
          self
        end
        def enable_link(link_extension)
          @builder.append " -enableLink:#{@builder.format link_extension}"
          yield @builder if block_given?
          self
        end
        def enable_rule(rule)
          @builder.append " -enableRule:#{@builder.format rule, ','}"
          yield @builder if block_given?
          self
        end
        def enable_skip_directive(skip_directive_name)
          @builder.append " -enableSkipDirective:#{@builder.format skip_directive_name}"
          yield @builder if block_given?
          self
        end
        def post_sync(command)
          @builder.append " -postSync:#{@builder.format command}"
          yield @builder if block_given?
          self
        end
        def pre_sync(command)
          @builder.append " -preSync:#{@builder.format command}"
          yield @builder if block_given?
          self
        end
        def remove_param(param)
          @builder.append " -removeParam:#{@builder.format param}"
          yield @builder if block_given?
          self
        end
        def replace(arg)
          @builder.append " -replace:#{@builder.format arg}"
          yield @builder if block_given?
          self
        end
        def retry_attempts(number)
          @builder.append " -retryAttempts:#{@builder.format number}"
          yield @builder if block_given?
          self
        end
        def retry_interval(milliseconds)
          @builder.append " -retryInterval:#{@builder.format milliseconds}"
          yield @builder if block_given?
          self
        end
        def set_param(param)
          @builder.append " -setParam:#{@builder.format param, ',', '='}"
          yield @builder if block_given?
          self
        end
        def set_param_file(xml_file)
          @builder.append " -setParamFile:#{@builder.format xml_file}"
          yield @builder if block_given?
          self
        end
        def show_secure
          @builder.append ' -showSecure'
          yield @builder if block_given?
          self
        end
        def skip(arg)
          @builder.append " -skip:#{@builder.format arg}"
          yield @builder if block_given?
          self
        end
        def source(provider)
          @builder.append " -source:#{@builder.format provider}"
          yield @builder if block_given?
          self
        end
        def unicode
          @builder.append ' -unicode'
          yield @builder if block_given?
          self
        end
        def use_check_sum
          @builder.append ' -useCheckSum'
          yield @builder if block_given?
          self
        end
        def verb(verb_name)
          @builder.append " -verb:#{@builder.format verb_name}"
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' -verbose'
          yield @builder if block_given?
          self
        end
        def web_server_dir(path)
          @builder.append " -webServerDir:#{@builder.format path}"
          yield @builder if block_given?
          self
        end
        def whatif
          @builder.append ' -whatif'
          yield @builder if block_given?
          self
        end
        def xml
          @builder.append ' -xml'
          yield @builder if block_given?
          self
        end
        def xpath(path)
          @builder.append " -xpath:#{@builder.format path}"
          yield @builder if block_given?
          self
        end
      end
      def msdeploy
        builder = CommandBuilder.new FluentCommandBuilder::MSDeploy::COMMAND_NAME
        command = MSDeploy.new builder
        yield builder if block_given?
        command
      end
    end
  end
  def msdeploy_40
    builder = CommandBuilder.new FluentCommandBuilder::MSDeploy::COMMAND_NAME
    command = MSDeploy::V40::MSDeploy.new builder
    yield builder if block_given?
    command
  end
end
