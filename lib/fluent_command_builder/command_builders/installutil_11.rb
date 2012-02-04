require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module InstallUtil
    module V11
      class InstallUtil
        def initialize builder, assembly_name
          @builder = builder
          @builder.append "installUtil #{@builder.format assembly_name}"
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
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      def installutil assembly_name
        InstallUtil.new CommandBuilder.new, assembly_name
      end
    end
  end
  def installutil_11 assembly_name
    InstallUtil::V11::InstallUtil.new CommandBuilder.new, assembly_name
  end
end
