require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module InstallUtil
    module V35
      class InstallUtil
        def initialize builder, assembly_name=nil
          @builder = builder
          @builder.append 'installUtil'
          @builder.append " #{@builder.format assembly_name}" unless assembly_name.nil?
        end
        def help assembly_path=nil
          @builder.append ' /help'
          @builder.append " #{@builder.format assembly_path}" unless assembly_path.nil?
          self
        end
        def log_file file_name=nil
          @builder.append ' /logFile'
          @builder.append "=#{@builder.format file_name}" unless file_name.nil?
          self
        end
        def assembly_name assembly_name
          @builder.append " /assemblyName=#{@builder.format assembly_name}"
          self
        end
        def log_to_console bool
          @builder.append " /logToConsole=#{@builder.format bool}"
          self
        end
        def show_call_stack 
          @builder.append ' /showCallStack'
          self
        end
        def uninstall 
          @builder.append ' /uninstall'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      def installutil assembly_name=nil
        InstallUtil.new CommandBuilder.new, assembly_name
      end
    end
  end
  def installutil_35 assembly_name=nil
    InstallUtil::V35::InstallUtil.new CommandBuilder.new, assembly_name
  end
end
