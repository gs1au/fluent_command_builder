# Generated code. Do not modify.

require_relative '../internal/command_base'
require_relative '../internal/command_builder_config'
require_relative '../internal/underlying_builder'

module FluentCommandBuilder
  module MSDeploy
    module V71
      VERSION = '7.1'
      @@config = CommandBuilderConfig.new FluentCommandBuilder::MSDeploy::COMMAND_NAME, VERSION
      def configure_msdeploy
        yield @@config
      end
      def msdeploy
        b = UnderlyingBuilder.new @@config
        c = MSDeploy.new(b)
        yield b if block_given?
        c
      end
      class MSDeploy < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
        end
        def allow_untrusted(bool)
          @b.append ' -allowUntrusted'
          yield @b if block_given?
          self
        end
        def app_host_config_dir(path)
          @b.append " -appHostConfigDir:#{@b.format path}"
          yield @b if block_given?
          self
        end
        def declare_param(param)
          @b.append " -declareParam:#{@b.format param, ',', '='}"
          yield @b if block_given?
          self
        end
        def declare_param_file(xml_file)
          @b.append " -declareParamFile:#{@b.format xml_file}"
          yield @b if block_given?
          self
        end
        def dest(provider)
          @b.append " -dest:#{@b.format provider}"
          yield @b if block_given?
          self
        end
        def disable_link(link_extension)
          @b.append " -disableLink:#{@b.format link_extension}"
          yield @b if block_given?
          self
        end
        def disable_rule(rule)
          @b.append " -disableRule:#{@b.format rule, ','}"
          yield @b if block_given?
          self
        end
        def disable_skip_directive(skip_directive_name)
          @b.append " -disableSkipDirective:#{@b.format skip_directive_name}"
          yield @b if block_given?
          self
        end
        def enable_link(link_extension)
          @b.append " -enableLink:#{@b.format link_extension}"
          yield @b if block_given?
          self
        end
        def enable_rule(rule)
          @b.append " -enableRule:#{@b.format rule, ','}"
          yield @b if block_given?
          self
        end
        def enable_skip_directive(skip_directive_name)
          @b.append " -enableSkipDirective:#{@b.format skip_directive_name}"
          yield @b if block_given?
          self
        end
        def post_sync(command)
          @b.append " -postSync:#{@b.format command}"
          yield @b if block_given?
          self
        end
        def pre_sync(command)
          @b.append " -preSync:#{@b.format command}"
          yield @b if block_given?
          self
        end
        def remove_param(param)
          @b.append " -removeParam:#{@b.format param}"
          yield @b if block_given?
          self
        end
        def replace(arg)
          @b.append " -replace:#{@b.format arg}"
          yield @b if block_given?
          self
        end
        def retry_attempts(number)
          @b.append " -retryAttempts:#{@b.format number}"
          yield @b if block_given?
          self
        end
        def retry_interval(milliseconds)
          @b.append " -retryInterval:#{@b.format milliseconds}"
          yield @b if block_given?
          self
        end
        def set_param(param)
          @b.append " -setParam:#{@b.format param, ',', '='}"
          yield @b if block_given?
          self
        end
        def set_param_file(xml_file)
          @b.append " -setParamFile:#{@b.format xml_file}"
          yield @b if block_given?
          self
        end
        def show_secure
          @b.append ' -showSecure'
          yield @b if block_given?
          self
        end
        def skip(arg)
          @b.append " -skip:#{@b.format arg}"
          yield @b if block_given?
          self
        end
        def source(provider)
          @b.append " -source:#{@b.format provider}"
          yield @b if block_given?
          self
        end
        def unicode
          @b.append ' -unicode'
          yield @b if block_given?
          self
        end
        def use_check_sum
          @b.append ' -useCheckSum'
          yield @b if block_given?
          self
        end
        def verb(verb_name)
          @b.append " -verb:#{@b.format verb_name}"
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' -verbose'
          yield @b if block_given?
          self
        end
        def web_server_dir(path)
          @b.append " -webServerDir:#{@b.format path}"
          yield @b if block_given?
          self
        end
        def whatif
          @b.append ' -whatif'
          yield @b if block_given?
          self
        end
        def xml
          @b.append ' -xml'
          yield @b if block_given?
          self
        end
        def xpath(path)
          @b.append " -xpath:#{@b.format path}"
          yield @b if block_given?
          self
        end
      end

    end
  end
end