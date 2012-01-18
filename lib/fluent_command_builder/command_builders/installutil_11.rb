require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module InstallUtil
    module V11
      class InstallUtil
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'installUtil'
          self
        end
        
        def assembly_file_name assembly_file_name
          @builder.append "#{assembly_file_name}"
          self
        end
        
        def help 
          @builder.append "/help"
          self
        end
        
        def log_file file_name
          @builder.append "/logFile=#{file_name}"
          self
        end
        
        def log_to_console bool
          @builder.append "/logToConsole=#{bool}"
          self
        end
        
        def show_call_stack 
          @builder.append "/showCallStack"
          self
        end
        
        def uninstall 
          @builder.append "/uninstall"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      def installutil
        InstallUtil.new
      end
      
    end
    
  end
  
  def installutil11
    InstallUtil::V11::InstallUtil.new
  end
  
end

