require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module XCodeBuild
    module V43
      COMMAND_NAME = 'xcodebuild'
      class XCodeBuild < CommandBase
        def initialize(builder)
          super builder
        end
        def build_project(build_action=nil)
          BuildProject.new @builder, build_action
        end
        def build_workspace(workspace_name, build_action=nil)
          BuildWorkspace.new @builder, workspace_name, build_action
        end
        def version
          Version.new @builder
        end
        def showsdks
          @builder.append ' -showsdks'
          yield @builder if block_given?
          self
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
      end
      class BuildProject < CommandBase
        def initialize(builder, build_action=nil)
          super builder
          @builder.append ' '
          @builder.append "#{@builder.format build_action, ' '}" unless build_action.nil?
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
        def configuration(configuration_name)
          @builder.append " -configuration #{@builder.format configuration_name}"
          yield @builder if block_given?
          self
        end
        def sdk(sdk_name)
          @builder.append " -sdk #{@builder.format sdk_name}"
          yield @builder if block_given?
          self
        end
        def setting(setting, value)
          @builder.append " #{@builder.format setting}=#{@builder.format value}"
          yield @builder if block_given?
          self
        end
        def user_default(value)
          @builder.append " -userdefault=#{@builder.format value}"
          yield @builder if block_given?
          self
        end
      end
      class BuildWorkspace < CommandBase
        def initialize(builder, workspace_name, build_action=nil)
          super builder
          @builder.append " -workspace #{@builder.format workspace_name}"
          @builder.append " #{@builder.format build_action, ' '}" unless build_action.nil?
        end
        def scheme(scheme_name)
          @builder.append " -scheme #{@builder.format scheme_name}"
          yield @builder if block_given?
          self
        end
        def configuration(configuration_name)
          @builder.append " -configuration #{@builder.format configuration_name}"
          yield @builder if block_given?
          self
        end
        def sdk(sdk_name)
          @builder.append " -sdk #{@builder.format sdk_name}"
          yield @builder if block_given?
          self
        end
        def setting(setting, value)
          @builder.append " #{@builder.format setting}=#{@builder.format value}"
          yield @builder if block_given?
          self
        end
        def user_default(value)
          @builder.append " -userdefault=#{@builder.format value}"
          yield @builder if block_given?
          self
        end
      end
      class Version < CommandBase
        def initialize(builder)
          super builder
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
      def xcodebuild
        builder = CommandBuilder.new COMMAND_NAME
        command = XCodeBuild.new builder
        yield builder if block_given?
        command
      end
    end
  end
  def xcodebuild_43
    builder = CommandBuilder.new XCodeBuild::V43::COMMAND_NAME
    command = XCodeBuild::V43::XCodeBuild.new builder
    yield builder if block_given?
    command
  end
end
