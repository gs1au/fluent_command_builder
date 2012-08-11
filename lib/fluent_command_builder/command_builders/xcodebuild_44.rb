require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def xcodebuild_44
    b = UnderlyingBuilder.new
    c = FluentCommandBuilder::XCodeBuild::V44.create b
    yield b if block_given?
    c
  end
  module XCodeBuild
    module V44
      def self.create(underlying_builder)
        XCodeBuild.new underlying_builder
      end
      def xcodebuild
        b = UnderlyingBuilder.new
        c = FluentCommandBuilder::XCodeBuild::V44.create b
        yield b if block_given?
        c
      end
      class XCodeBuild < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = 'xcodebuild'
        end
        def build_project(build_action=nil)
          BuildProject.new @builder, build_action
        end
        def build_project_scheme(build_action=nil)
          BuildProjectScheme.new @builder, build_action
        end
        def build_workspace(workspace_name, build_action=nil)
          BuildWorkspace.new @builder, workspace_name, build_action
        end
        def version
          Version.new @builder
        end
        def list
          @builder.append ' -list'
          yield @builder if block_given?
          self
        end
        def list_project(project_name)
          @builder.append " -list -project #{@builder.format project_name}"
          yield @builder if block_given?
          self
        end
        def list_workspace(workspace_name)
          @builder.append " -list -workspace #{@builder.format workspace_name}"
          yield @builder if block_given?
          self
        end
        def find(binary)
          @builder.append " -find #{@builder.format binary}"
          yield @builder if block_given?
          self
        end
        def help
          @builder.append ' -help'
          yield @builder if block_given?
          self
        end
        def license
          @builder.append ' -license'
          yield @builder if block_given?
          self
        end
        def show_sdks
          @builder.append ' -showsdks'
          yield @builder if block_given?
          self
        end
        def usage
          @builder.append ' -usage'
          yield @builder if block_given?
          self
        end
      end
      class BuildProject < CommandBase
        def initialize(underlying_builder, build_action=nil)
          super underlying_builder
          @builder.command_name = 'xcodebuild'
          @builder.append ' '
          @builder.append "#{@builder.format build_action, ' '}" unless build_action.nil?
        end
        def all_targets
          @builder.append ' -alltargets'
          yield @builder if block_given?
          self
        end
        def architecture(architecture)
          @builder.append " -arch #{@builder.format architecture}"
          yield @builder if block_given?
          self
        end
        def configuration(configuration_name)
          @builder.append " -configuration #{@builder.format configuration_name}"
          yield @builder if block_given?
          self
        end
        def dry_run
          @builder.append ' -dry-run'
          yield @builder if block_given?
          self
        end
        def jobs(number)
          @builder.append " -jobs #{@builder.format number}"
          yield @builder if block_given?
          self
        end
        def parallelize_targets
          @builder.append ' -parallelizeTargets'
          yield @builder if block_given?
          self
        end
        def project(project_name)
          @builder.append " -project #{@builder.format project_name}"
          yield @builder if block_given?
          self
        end
        def target(target_name)
          @builder.append " -target #{@builder.format target_name}"
          yield @builder if block_given?
          self
        end
        def sdk(sdk_name)
          @builder.append " -sdk #{@builder.format sdk_name}"
          yield @builder if block_given?
          self
        end
        def show_build_settings
          @builder.append ' -showBuildSettings'
          yield @builder if block_given?
          self
        end
        def toolchain(name)
          @builder.append " -toolchain #{@builder.format name}"
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' -verbose'
          yield @builder if block_given?
          self
        end
        def xcconfig(path)
          @builder.append " -xcconfig #{@builder.format path}"
          yield @builder if block_given?
          self
        end
        def setting(setting, value)
          @builder.append " #{@builder.format setting}=#{@builder.format value}"
          yield @builder if block_given?
          self
        end
      end
      class BuildProjectScheme < CommandBase
        def initialize(underlying_builder, build_action=nil)
          super underlying_builder
          @builder.command_name = 'xcodebuild'
          @builder.append ' '
          @builder.append "#{@builder.format build_action, ' '}" unless build_action.nil?
        end
        def architecture(architecture)
          @builder.append " -arch #{@builder.format architecture}"
          yield @builder if block_given?
          self
        end
        def configuration(configuration_name)
          @builder.append " -configuration #{@builder.format configuration_name}"
          yield @builder if block_given?
          self
        end
        def dry_run
          @builder.append ' -dry-run'
          yield @builder if block_given?
          self
        end
        def jobs(number)
          @builder.append " -jobs #{@builder.format number}"
          yield @builder if block_given?
          self
        end
        def parallelize_targets
          @builder.append ' -parallelizeTargets'
          yield @builder if block_given?
          self
        end
        def scheme(scheme_name)
          @builder.append " -scheme #{@builder.format scheme_name}"
          yield @builder if block_given?
          self
        end
        def sdk(sdk_name)
          @builder.append " -sdk #{@builder.format sdk_name}"
          yield @builder if block_given?
          self
        end
        def show_build_settings
          @builder.append ' -showBuildSettings'
          yield @builder if block_given?
          self
        end
        def toolchain(name)
          @builder.append " -toolchain #{@builder.format name}"
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' -verbose'
          yield @builder if block_given?
          self
        end
        def xcconfig(path)
          @builder.append " -xcconfig #{@builder.format path}"
          yield @builder if block_given?
          self
        end
        def setting(setting, value)
          @builder.append " #{@builder.format setting}=#{@builder.format value}"
          yield @builder if block_given?
          self
        end
      end
      class BuildWorkspace < CommandBase
        def initialize(underlying_builder, workspace_name, build_action=nil)
          super underlying_builder
          @builder.command_name = 'xcodebuild'
          @builder.append " -workspace #{@builder.format workspace_name}"
          @builder.append " #{@builder.format build_action, ' '}" unless build_action.nil?
        end
        def architecture(architecture)
          @builder.append " -arch #{@builder.format architecture}"
          yield @builder if block_given?
          self
        end
        def configuration(configuration_name)
          @builder.append " -configuration #{@builder.format configuration_name}"
          yield @builder if block_given?
          self
        end
        def dry_run
          @builder.append ' -dry-run'
          yield @builder if block_given?
          self
        end
        def jobs(number)
          @builder.append " -jobs #{@builder.format number}"
          yield @builder if block_given?
          self
        end
        def parallelize_targets
          @builder.append ' -parallelizeTargets'
          yield @builder if block_given?
          self
        end
        def scheme(scheme_name)
          @builder.append " -scheme #{@builder.format scheme_name}"
          yield @builder if block_given?
          self
        end
        def sdk(sdk_name)
          @builder.append " -sdk #{@builder.format sdk_name}"
          yield @builder if block_given?
          self
        end
        def show_build_settings
          @builder.append ' -showBuildSettings'
          yield @builder if block_given?
          self
        end
        def toolchain(name)
          @builder.append " -toolchain #{@builder.format name}"
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' -verbose'
          yield @builder if block_given?
          self
        end
        def xcconfig(path)
          @builder.append " -xcconfig #{@builder.format path}"
          yield @builder if block_given?
          self
        end
        def setting(setting, value)
          @builder.append " #{@builder.format setting}=#{@builder.format value}"
          yield @builder if block_given?
          self
        end
      end
      class Version < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = 'xcodebuild'
          @builder.append ' -version'
        end
        def sdk(sdk_name)
          @builder.append " -sdk #{@builder.format sdk_name}"
          yield @builder if block_given?
          self
        end
        def info_item(info_item)
          @builder.append " #{@builder.format info_item}"
          yield @builder if block_given?
          self
        end
      end
    end
  end
end
